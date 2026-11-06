# Documentazione

[![Build and publish documentation](https://github.com/hex4dev/docs/actions/workflows/publish.yml/badge.svg)](https://github.com/hex4dev/docs/actions/workflows/publish.yml)

Repository dei documenti e del sito statico di documentazione del gruppo **hex4dev**. \
Disponibile su https://hex4dev.github.io/docs

## Struttura del repository

```text
assets/                             Risorse statiche condivise
candidatura/                        Sorgenti ed eventuali PDF dei documenti
templates/                          Template Typst riutilizzabili
scripts/publications.config.json    Regole che associano i file Typst alle voci del sito
scripts/build-documents.mjs         Generazione del catalogo e compilazione dei PDF pubblicati
sito/                               Sito Astro
  public/                             Risorse statiche e PDF prodotti dalla build
  src/                                Pagine, stili, script e dati del sito
```

## Come funziona il sito

Il sito è completamente statico: [Astro](https://astro.build/) genera HTML, CSS e JavaScript in fase di build. La pagina principale legge il catalogo dei documenti generato dalla build e mostra sezioni e categorie, ricerca per titolo/categoria/data e collegamenti per aprire il PDF o vedere il sorgente su GitHub.

I file messi in `sito/public/` vengono copiati da Astro nell'output mantenendo il percorso relativo. Per esempio, `sito/public/download/guida.pdf` sarà disponibile come `/docs/download/guida.pdf` su GitHub Pages. Il prefisso `/docs` è configurato in `sito/astro.config.mjs`; per i collegamenti agli asset della pagina si usa la funzione `siteUrl` in `sito/src/utils/urls.js`, così il prefisso viene applicato correttamente.

Il logo ha il sorgente in `assets/hex4dev_logo.png` e viene copiato automaticamente in `sito/public/assets/` durante la generazione dei documenti. I PDF e i cataloghi JSON presenti in `sito/public/pdf/` e `sito/src/data/generated-*.json` **non vanno modificati** a mano e sono esclusi da Git

## Aggiungere un documento al catalogo

I documenti pubblicati partono da file `.typ` dentro una root di pubblicazione (ad esempio `candidatura/`). \
Lo script `scripts/build-documents.mjs` cerca i file Typst e li pubblica solo se il loro percorso corrisponde a una regola in `scripts/publications.config.json`. \
Per ogni corrispondenza ricava titolo, categoria, data, sezione e nome del PDF.

### Documenti con una regola esistente

Per aggiungere un nuovo diario di bordo, verbale o altro documento già coperto dalle regole:

1. Crea il sorgente nel percorso e con il nome attesi dalla regola. Un esempio di formato corrente supportato è

   ```text
   candidatura/diario-di-bordo/YYYY-MM-DD/diario-di-bordo.typ
   ```

   Per i documenti datati (come in esempio), usa la data effettiva nel formato `YYYY-MM-DD`.

2. Scrivi il documento importando il template adatto da `templates/`. I template includono intestazione, stile e componenti comuni. Nei loro commenti iniziali sono riportati parametri, esempi d'uso e comando di compilazione. Gli import devono essere nella forma `/templates/verbale-interno.typ` e si risolvono dalla root del repository.

3. Esegui la build del sito (vedi [Build locale](#build-locale)). Lo script compila il `.typ` con Typst, mette il PDF in `sito/public/pdf/` e aggiorna il catalogo usato dalla pagina. I documenti datati vengono ordinati per data, dal più recente.

Il PDF accanto al sorgente, con lo stesso nome (per esempio `diario-di-bordo.pdf`), è facoltativo. Se esiste, la build lo copia al posto di compilare il Typst; altrimenti compila il `.typ`. Si consiglia questa opzione per pubblicare documenti firmati dai soggetti interessati.

### Aggiungere una nuova tipologia o personalizzare una voce

Se il percorso non corrisponde a una regola esistente, aggiungi una regola in `scripts/publications.config.json`. `root` indica la root directory di riferimento, `match` è un'espressione regolare ancorata al percorso relativo al repository, `section` deve riferirsi a una sezione definita nella configurazione, e `category` determina il raggruppamento mostrato sul sito. Un esempio di regola per documenti datati:

```json
{
  "root": "candidatura",
  "match": "^candidatura/relazioni/(?<date>\\d{4}-\\d{2}-\\d{2})/relazione\\.typ$",
  "section": "candidatura",
  "category": "Relazioni",
  "titleTemplate": "Relazione — {dateIT}",
  "idTemplate": "relazione-{date}"
}
```

Il gruppo nominato `date` viene usato per validare e mostrare la data. I template del titolo e dell'ID possono usare i campi catturati, `date`, `dateIT`, `categoryTitle`, `slugTitle` e `sourcePath`. Le voci senza `titleTemplate` o `idTemplate` ricevono valori predefiniti basati sul percorso. Gli ID e i percorsi PDF devono essere univoci.

Per una nuova sezione, aggiungi una voce a `sections` e, se necessario, aggiorna `defaultSection`; le sezioni devono avere `id` distinti. Per correggere i metadati o nascondere un singolo file senza cambiare la regola generale, usa `overrides` con il percorso sorgente come chiave. Campi supportati includono `title`, `category`, `section`, `date`, `type`, `placement`, `order`, `readVersion` e `visible` (`false` esclude il documento). `placement: "above-archive"` mostra il documento in evidenza prima dell'archivio. `readVersion: true` legge la versione dal PDF, se il template la registra come parola chiave `version=...`.

Le categorie in `pinnedCategories` vengono mostrate prima delle altre. Se una regola non corrisponde a nessun file, il file `.typ` non comparirà nel sito.

## File statici e risorse Typst

Per un file da servire direttamente senza inserirlo nel catalogo dei documenti, aggiungilo sotto `sito/public/`. \
Per esempio, un'immagine in `sito/public/assets/diagramma.svg` sarà raggiungibile con `/docs/assets/diagramma.svg`.

Le risorse usate in compilazione Typst devono invece essere accessibili dal sorgente durante il build. Il logo condiviso vive in `assets/` e viene copiato automaticamente nel percorso pubblico previsto dai template. Per aggiungere una risorsa locale a un documento, mettila nel repository e usa un percorso coerente con `typst compile --root .`; se deve essere anche scaricabile dal sito, copiala o aggiungila in `sito/public/`.

## Build locale

Requisiti: Node.js `>=22.22.0` (il workflow usa Node 24), npm e Typst `0.15.1` disponibile nel `PATH`. La build compila i sorgenti `.typ` per cui non è presente un PDF affiancato.

```bash
cd sito
npm ci
npm run dev       # build documenti e avvio del server Astro
```

Per generare il sito statico pronto alla pubblicazione:

```bash
cd sito
npm run build
npm run preview   # anteprima locale della build
```

`npm run docs:build` esegue solo la generazione di PDF e cataloghi. La build completa scrive il sito in `sito/dist/`; i PDF generati sono sotto `sito/public/pdf/`. Questi output possono essere rigenerati in qualsiasi momento.

## Pubblicazione

Il workflow `.github/workflows/publish.yml` esegue la build a ogni push su `main` e manualmente tramite `workflow_dispatch`. Installa Typst 0.15.1, configura Node 24 e crea il sito con `npm run build`; se la build riesce, pubblica l'output su GitHub Pages.
