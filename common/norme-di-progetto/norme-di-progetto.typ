#import "/templates/documento.typ": documento

#show: documento.with(
  titolo: "Norme di progetto",
  sottotitolo: "Documentazione interna",
  numero-gruppo: "14",
  versione: "0.3",
  data: "2026-11-16",
  uso: "Interno",
  redattori: ("Alessandro Zanier",),
  verificatori: ("Andrea Nogara",),
  registro: (
    ("0.3", "2026-11-23", "Alessandro Zanier", "Andrea Nogara", "Chiarificazioni sul responsabile e sul processo di verifica"),
    ("0.2", "2026-11-20", "Alessandro Zanier", "Andrea Nogara", "Aggiunte le regole sulla struttura della repository, sui branch e sulla pianificazione degli sprint"),
    ("0.1", "2026-11-16", "Alessandro Zanier", "Andrea Nogara", "Prima stesura delle Norme di Progetto"),
  ),
)

= Introduzione

== Scopo del documento

Queste norme descrivono come Hex4dev organizza il lavoro, gestisce la
documentazione e registra decisioni e attività. Si applicano a tutti i
componenti del gruppo. Quando il gruppo approva una nuova regola, il documento
viene aggiornato e la modifica viene tracciata nel registro.

== Riferimenti

- Verbali interni del gruppo Hex4dev.
- Dichiarazione degli Impegni del gruppo Hex4dev.

= Processi primari

== Fornitura

1. Il *Responsabile* gestisce i contatti con Zucchetti e con le altre entità
   esterne utilizzando *esclusivamente* l'indirizzo email del gruppo,
   #text("hex4dev@gmail.com").
2. Le richieste di incontro e il concordamento di data e orario con Zucchetti
   avvengono tramite email. Il Responsabile comunica la disponibilità del
   gruppo e condivide con i componenti gli accordi presi.
3. Prima di ogni incontro il gruppo definisce l'ordine del giorno e identifica
   il *verbalizzante*. Dopo l'incontro, il verbalizzante redige il _verbale
   esterno_; un componente diverso lo verifica prima dell'invio al proponente.
4. Il *Responsabile* invia le comunicazioni e le consegne ufficiali ai docenti
   dall'indirizzo del gruppo, indicando la consegna e il collegamento alla
   documentazione pubblicata.

== Sviluppo

Il processo di sviluppo sarà completato dopo l'analisi dei requisiti e il
confronto con Zucchetti.

Le attività, le responsabilità e le scadenze dei singoli sprint sono
riportate nel _Piano di Progetto_.

Le procedure tecniche di sviluppo e i relativi criteri di verifica saranno
aggiunti a questa sezione prima di avviare le attività corrispondenti.

= Processi di supporto

== Documentazione

1. Ogni documento è redatto in *Typst* a partire dal template appropriato nella
   cartella `templates/`.
2. La copertina riporta titolo, versione, data, uso, redattori e verificatori.
   Il registro delle modifiche precede l'indice e riporta, dalla revisione più
   recente alla più vecchia, versione, data, autore, verificatore e descrizione.
3. In una revisione, *autore* e *verificatore* devono essere componenti del gruppo diversi.
4. La repository è organizzata per funzione e fase:
   - `common/` contiene i documenti condivisi tra le fasi, come le _Norme di
     progetto_, il _Glossario_ e i diari di bordo;
   - `candidatura/` contiene i documenti della candidatura, inclusi i verbali
     interni ed esterni;
   - `rtb/` contiene i documenti prodotti per la fase RTB;
   - `templates/` raccoglie i template Typst e `assets/` le risorse condivise;
   - `scripts/` contiene gli strumenti di generazione e pubblicazione, mentre
     `sito/` contiene il sito di documentazione.
   I documenti di ogni fase sono ulteriormente ordinati per categoria e, per
   quelli datati, in cartelle denominate con la data.
5. `common/` contiene i documenti validi per più fasi del progetto. Ogni tipo
   di documento condiviso ha una propria sottocartella: le Norme sono in
   `common/norme-di-progetto/`, i diari sono in
   `common/diari-di-bordo/AAAA-MM-GG/` con un diario per data e il Glossario
   risiede in `common/glossario/`.
6. All'interno di `candidatura/` e `rtb/`, ogni documento autonomo ha una
   cartella dedicata, nominata con lo stesso identificativo del documento; il
   file sorgente Typst usa lo stesso nome, per esempio
   `candidatura/lettera-di-presentazione/lettera-di-presentazione.typ`.
   I verbali sono raggruppati per tipo e suddivisi per data: per esempio
   `candidatura/verbali/interni/AAAA-MM-GG/verbale-interno.typ` e
   `rtb/verbali/interni/AAAA-MM-GG/verbale-interno.typ`. I verbali esterni
   seguono la stessa struttura sotto `verbali/esterni/`.
7. Il nome del gruppo è *Hex4dev*, con l'iniziale maiuscola. Le date seguono il
   formato *ISO 8601* `AAAA-MM-GG`.
8. I verbali interni riportano partecipanti, ordine del giorno, resoconto,
   decisioni, attività assegnate e prossima riunione, quando definita. Ogni
   attività indica responsabile e scadenza; se deriva da una decisione, il
   verbale collega i due elementi tramite i rispettivi identificativi.
9. Il *Responsabile* dello sprint e presenta il _diario di bordo_, che riassume
   attività completate, attività previste e difficoltà emerse.
10. Il *Responsabile* può delegare la realizzazione del _diario di bordo_ ad un altro
   componente del gruppo in caso di necessità.

== Gestione della configurazione

1. Il gruppo usa Git per il versionamento del codice e della documentazione e
   GitHub per ospitare i repository. L'organizzazione GitHub del gruppo è
   #link("https://github.com/hex4dev")[github.com/hex4dev].
2. Ogni modifica viene sviluppata su un `branch` dedicato e proposta tramite
   `pull request` verso `main`. La pull request è collegata alla `issue`
   dell'attività. Dopo il merge, il branch viene cancellato; se serve un
   intervento successivo, può essere ricreato con lo stesso nome.
3. La `issue` descrive l'attività, indica il responsabile e la scadenza, e viene eventualmente
   aggiornata durante il lavoro. Al merge della pull request, la issue
   collegata viene chiusa.
4. Ogni revisione di un documento aggiorna la versione in copertina e aggiunge
   una riga al registro. La versione in copertina coincide con quella della
   prima riga del registro.
5. Il versionamento avviene tramite due numeri: una versione maggiore (M) e una versione minore (m); nel formato M.m.
6. La versione minore viene incrementata per ogni modifica e può essere composta da più di una cifra se necessario (0.9 -> 0.10)
7. La versione maggiore viene incrementata in caso di approvazione alla pubblicazione o in caso di cambi sostanziali al documento.
8. Tutti i documenti partono dalla versione 0.1.
9. Il nome del `branch` descrive brevemente il lavoro, usando lettere minuscole
   e trattini tra le parole. È possibile aggiungere un prefisso che indichi
   l'area o la natura dell'attività; il prefisso è facoltativo e non è limitato
   a un elenco prestabilito. Esempi: `norme-di-progetto`,
   `documentazione/norme-di-progetto`, `verbale-2026-11-16`.
10. Ogni `commit` contiene una modifica circoscritta e usa il formato
    `tipo: verbo al participio passato + oggetto`. Lo schema si basa su 
    #link("https://www.conventionalcommits.org/en/v1.0.0/")[Conventional Commits 1.0.0], 
    mantenendo il tipo in lingua inglese e il messaggio in lingua italiana.
    Per documenti datati, il messaggio include la data nel formato *ISO 8601* `AAAA-MM-GG`.
    Il commit che completa l'attività aggiunge in coda
    `- Closes #numero-issue`. Esempi:
    `docs: aggiornata la sezione Fornitura - Closes #56` e
    `docs: redatto verbale interno del 2026-11-11 - Closes #60`.
11. Il `commit` che completa un'attività usa `Closes #numero-issue` per chiudere
    la issue quando viene integrato in `main`. Se il riferimento manca nei
    commit, è possibile aggiungerlo nella descrizione della pull request, o eventualmente 
    sarà possibile collegare manualmente la pull request alla issue utilizzando le funzionalità di GitHub

== Verifica

1. Prima del merge, un *Verificatore* diverso dall'autore della modifica controlla la
   `pull request`. Verifica la correttezza della modifica, la coerenza con le decisioni
   del gruppo e il completamento dell'attività assegnata.
2. Se rileva problemi, il *Verificatore* li segnala nella `pull request` e l'autore
   li corregge prima di una nuova verifica.
3. Per la prima pubblicazione di un documento, il *Responsabile* dello sprint ne
   approva il rilascio dopo la verifica.
4. Il *Verificatore* di un verbale relativo alla riunione deve aver partecipato alla stessa.

== Qualità e validazione

1. I criteri di qualità e le modalità di verifica e validazione del prodotto
   sono stabiliti nel _Piano di Qualifica_ sulla base dei requisiti e degli
   accordi con Zucchetti.
2. Prima di una consegna, il gruppo controlla la coerenza complessiva dei
   documenti.

= Processi organizzativi

== Gestione del gruppo

1. Il gruppo svolge una riunione interna settimanale il lunedì alle 15:00 su
   Discord e convoca incontri aggiuntivi quando necessari.
2. Il gruppo usa un gruppo WhatsApp per le comunicazioni rapide e un server
   Discord per le comunicazioni strutturate e per le riunioni.
3. All'inizio di ogni riunione viene identificato un *verbalizzante*. Il
   verbalizzante redige il verbale e registra su *GitHub* le `issue` delle attività
   concordate; in caso di indisponibilità può delegarne la registrazione
   all'*Amministratore*.
4. I riferimenti delle `issue` sono riportati nel verbale accanto alle attività
   corrispondenti.

== Sprint e ruoli

1. Gli *sprint* durano due settimane. Alla riunione iniziale di ogni sprint il
   gruppo fa il consuntivo dello sprint precedente, assegna i nuovi ruoli e
   pianifica il lavoro; consuntivo e assegnazioni sono registrati nel verbale
   e nel _Piano di Progetto_.
2. Ogni componente ricopre un solo ruolo nello sprint. Ogni sprint prevede un
   solo *Responsabile*, un solo *Amministratore* e almeno un *Verificatore*.
3. Nessuno ricopre lo stesso ruolo per più di due sprint consecutivi e nessuno
   verifica un proprio prodotto.
4. Il *Responsabile* aggiorna a fine sprint le ore svolte da ciascun componente
   e per ruolo. Le assegnazioni successive considerano le ore già svolte e 
   mantengono una rotazione equa dei ruoli.
