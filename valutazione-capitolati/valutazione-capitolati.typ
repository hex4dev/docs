// ============================================================
//  Valutazione Capitolati - candidatura del gruppo hex4dev
//
//  Documento autonomo: non usa template esterni, si compila
//  direttamente dalla root del repository con
//    typst compile --root . valutazione-capitolati/valutazione-capitolati.typ
//
//  Ripartizione della scrittura (riunione del 26/10/2026):
//    - capitolati C0-C4: Alessandro Ravenna
//    - capitolati C5-C9: Francesco Bassani
//  Ogni scheda ha le stesse sezioni, da compilare al posto dei
//  segnaposto #todo[...] (evidenziati in giallo nel PDF).
//  Serve solo il logo in assets/hex4dev_logo.png.
// ============================================================

// --- Palette (la stessa del logo e degli altri documenti hex4dev) ---
#let colore-primario = rgb("#554AB6") // viola bordo esagono
#let colore-scuro    = rgb("#3D3489") // viola interno
#let colore-accento  = rgb("#5FCBAA") // verde dei vertici
#let colore-testo    = rgb("#1E1B3A")
#let colore-sfondo   = rgb("#F5F4FC") // lilla chiarissimo

// Barretta verde sotto i titoli
#let barretta(w: 2.5cm) = rect(width: w, height: 5pt, fill: colore-accento, radius: 2.5pt)

// Segnaposto evidenziato per le parti da completare
#let todo(body) = highlight(fill: rgb("#FFF0A0"), extent: 1.5pt, body)

// Tabella con intestazione colorata e righe alternate
#let tabella(colonne, intestazione, righe) = {
  set text(size: 10pt, hyphenate: false)
  set par(justify: false)
  table(
    columns: colonne,
    stroke: 0.5pt + colore-primario.lighten(55%),
    inset: (x: 7pt, y: 6pt),
    fill: (_, y) => if y == 0 { colore-primario } else if calc.even(y) { colore-sfondo } else { white },
    table.header(..intestazione.map(t => text(fill: white, weight: "bold")[#t])),
    ..righe,
  )
}

#let documento(
  titolo: "Documento",
  sottotitolo: none,
  gruppo: "Hex4dev",
  numero-gruppo: none,
  versione: "0.1",
  data: datetime.today().display("[day]/[month]/[year]"),
  uso: "Esterno",
  redattori: (),
  verificatori: (),
  registro: (),
  logo: "/assets/hex4dev_logo.png",
  body,
) = {
  set document(title: titolo, author: gruppo)
  set text(lang: "it", size: 11pt, fill: colore-testo,
           font: ("Inter", "Noto Sans", "Liberation Sans", "DejaVu Sans"))
  set par(justify: true, leading: 0.65em)

  let elenco(persone) = if persone.len() == 0 [da definire] else { persone.join(", ") }

  // ---- Copertina ----
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3cm, bottom: 2.5cm),
    header: none,
    footer: none,
    background: place(top + left, stack(
      rect(width: 100%, height: 0.9cm, fill: colore-primario),
      rect(width: 100%, height: 0.2cm, fill: colore-accento),
    )),
  )[
    #set par(justify: false)
    #v(1fr)
    #align(center, image(logo, height: 6cm))
    #v(1.5cm)
    #align(center)[
      #text(size: 30pt, weight: "bold", fill: colore-scuro)[#titolo]
      #v(-0.2em)
      #barretta(w: 4cm)
      #if sottotitolo != none [
        #v(1em)
        #text(size: 14pt, fill: colore-primario)[#sottotitolo]
      ]
      #v(0.8em)
      #text(size: 16pt, weight: "semibold")[
        #gruppo#if numero-gruppo != none [ · Gruppo #numero-gruppo]
      ]
    ]
    #v(1fr)
    #block(width: 100%, fill: colore-sfondo, inset: 14pt, radius: 4pt,
           stroke: (left: 3pt + colore-accento))[
      #grid(
        columns: (3cm, 1fr),
        row-gutter: 0.7em,
        text(weight: "semibold", fill: colore-scuro)[Versione], [#versione],
        text(weight: "semibold", fill: colore-scuro)[Data], [#data],
        text(weight: "semibold", fill: colore-scuro)[Uso], [#uso],
        text(weight: "semibold", fill: colore-scuro)[Redattori], elenco(redattori),
        text(weight: "semibold", fill: colore-scuro)[Verificatori], elenco(verificatori),
      )
    ]
  ]

  // ---- Pagine interne ----
  set page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3.2cm, bottom: 2.5cm),
    header: {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (auto, 1fr),
        align: horizon,
        image(logo, height: 1cm),
        align(right)[#gruppo · #titolo],
      )
      v(-0.2em)
      line(length: 100%, stroke: 1pt + colore-primario)
    },
    header-ascent: 30%,
    footer: context {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (1fr, auto),
        [Versione #versione · #data],
        [Pagina #counter(page).display() di #counter(page).final().first()],
      )
    },
  )

  // Titoli: numerati, i capitoli iniziano su una nuova pagina
  set heading(numbering: "1.1.1")
  show heading.where(level: 1): it => {
    // Registro e indice (non in elenco) stanno insieme nella stessa pagina
    if it.outlined { pagebreak(weak: true) }
    block(above: 0pt, below: 1em, breakable: false)[
      #text(size: 20pt, weight: "bold", fill: colore-scuro)[#it]
      #v(-0.5em)
      #barretta(w: 2cm)
    ]
  }
  show heading.where(level: 2): it => block(above: 1.6em, below: 0.7em, breakable: false,
    text(size: 14pt, weight: "bold", fill: colore-primario)[#it])
  show heading.where(level: 3): it => block(above: 1.2em, below: 0.5em, breakable: false,
    text(size: 11.5pt, weight: "semibold", fill: colore-scuro)[#it])

  // Elenchi
  set list(marker: text(fill: colore-primario)[•], body-indent: 0.6em, spacing: 0.7em)
  set enum(numbering: n => text(fill: colore-primario, weight: "bold")[#n.], body-indent: 0.6em, spacing: 0.7em)

  show link: set text(fill: colore-primario)
  show strong: set text(fill: colore-scuro)

  // ---- Registro delle modifiche ----
  heading(numbering: none, outlined: false)[Registro delle modifiche]
  if registro.len() > 0 {
    tabella(
      (2.2cm, 2.4cm, 3cm, 3cm, 1fr),
      ("Versione", "Data", "Autore", "Verificatore", "Descrizione"),
      registro.flatten(),
    )
  }

  // ---- Indice ----
  v(1.2cm)
  heading(numbering: none, outlined: false)[Indice]
  {
    set par(justify: false)
    show outline.entry.where(level: 1): it => {
      v(0.4em)
      strong(it)
    }
    outline(title: none, depth: 2, indent: 1.2em)
  }

  body
}

#show: documento.with(
  titolo: "Valutazione Capitolati",
  sottotitolo: "Candidatura · Anno accademico 2026/2027",
  numero-gruppo: "14",
  versione: "0.2",
  data: "27/10/2026",
  redattori: ("Francesco Bassani", "Alessandro Ravenna"),
  verificatori: ("Alessandro Zanier", "Andrea Nogara"),
  registro: (
    ("0.2", "27/10/2026", "Francesco Bassani", "Alessandro Zanier, Andrea Nogara", "Valutazione dei capitolati da C5 a C9"),
    ("0.1", "27/10/2026", "Francesco Bassani", "—", "Creazione dello scheletro del documento"),
  ),
)

= Introduzione

== Scopo del documento
Questo documento presenta l'analisi dei capitolati d'appalto proposti per il progetto di Ingegneria del Software e le motivazioni che hanno portato il gruppo Hex4dev a candidarsi per uno di essi.

== Metodo di valutazione
Tutti i capitolati, da C0 a C9, sono descritti con la stessa scheda, in modo da poterli confrontare: informazioni generali, breve descrizione, aspetti positivi, criticità e valutazione finale.

= Analisi dei capitolati
Di seguito l'analisi dei dieci capitolati, da C0 a C9.


== C0 – Titolo da definire

=== Informazioni generali
- *Titolo:* #todo[titolo del capitolato]
- *Proponente:* #todo[azienda proponente]
- *Referente:* #todo[nome del referente]

=== Breve descrizione
#todo[Sintesi in poche righe, con parole del gruppo, del problema e della soluzione richiesta.]

=== Aspetti positivi
- #todo[Primo aspetto positivo.]
- #todo[Secondo aspetto positivo.]

=== Criticità
- #todo[Prima criticità o rischio.]
- #todo[Seconda criticità o rischio.]

=== Valutazione finale
#todo[Giudizio complessivo sul capitolato (selezionato, riserva, scartato) e motivazione in poche righe.]

#pagebreak(weak: true)
== C1 – Titolo da definire

=== Informazioni generali
- *Titolo:* #todo[titolo del capitolato]
- *Proponente:* #todo[azienda proponente]
- *Referente:* #todo[nome del referente]

=== Breve descrizione
#todo[Sintesi in poche righe, con parole del gruppo, del problema e della soluzione richiesta.]

=== Aspetti positivi
- #todo[Primo aspetto positivo.]
- #todo[Secondo aspetto positivo.]

=== Criticità
- #todo[Prima criticità o rischio.]
- #todo[Seconda criticità o rischio.]

=== Valutazione finale
#todo[Giudizio complessivo sul capitolato (selezionato, riserva, scartato) e motivazione in poche righe.]

#pagebreak(weak: true)
== C2 – Titolo da definire

=== Informazioni generali
- *Titolo:* #todo[titolo del capitolato]
- *Proponente:* #todo[azienda proponente]
- *Referente:* #todo[nome del referente]

=== Breve descrizione
#todo[Sintesi in poche righe, con parole del gruppo, del problema e della soluzione richiesta.]

=== Aspetti positivi
- #todo[Primo aspetto positivo.]
- #todo[Secondo aspetto positivo.]

=== Criticità
- #todo[Prima criticità o rischio.]
- #todo[Seconda criticità o rischio.]

=== Valutazione finale
#todo[Giudizio complessivo sul capitolato (selezionato, riserva, scartato) e motivazione in poche righe.]

#pagebreak(weak: true)
== C3 – FossDot

=== Informazioni generali
- *Titolo:* FossDot
- *Proponente:* Uranion EMEA Ltd
- *Referente:* Andrea Dorigo

=== Breve descrizione
#todo[Sintesi in poche righe, con parole del gruppo, del problema e della soluzione richiesta.]

=== Aspetti positivi
- #todo[Primo aspetto positivo.]
- #todo[Secondo aspetto positivo.]

=== Criticità
- #todo[Prima criticità o rischio.]
- #todo[Seconda criticità o rischio.]

=== Valutazione finale
#todo[Giudizio complessivo sul capitolato (selezionato, riserva, scartato) e motivazione in poche righe.]

#pagebreak(weak: true)
== C4 – Titolo da definire

=== Informazioni generali
- *Titolo:* #todo[titolo del capitolato]
- *Proponente:* #todo[azienda proponente]
- *Referente:* #todo[nome del referente]

=== Breve descrizione
#todo[Sintesi in poche righe, con parole del gruppo, del problema e della soluzione richiesta.]

=== Aspetti positivi
- #todo[Primo aspetto positivo.]
- #todo[Secondo aspetto positivo.]

=== Criticità
- #todo[Prima criticità o rischio.]
- #todo[Seconda criticità o rischio.]

=== Valutazione finale
#todo[Giudizio complessivo sul capitolato (selezionato, riserva, scartato) e motivazione in poche righe.]

#pagebreak(weak: true)
== C5 – RareCare

=== Informazioni generali
- *Titolo:* RareCare – Piattaforma AI per la raccolta dati e il supporto decisionale nelle malattie rare
- *Proponente:* Miriade S.r.l. (Thiene, VI)
- *Referente:* Emanuele Righetto (coordinatore), Jessica Dalla Fontana (dominio clinico)

=== Breve descrizione
Piattaforma digitale con assistente virtuale basato su intelligenza artificiale (RareCare Navigator) a supporto delle famiglie e della rete di cura nella gestione delle malattie rare, a partire dalla sindrome di Sanfilippo. Comprende un assistente conversazionale RAG che risponde solo sulla base di fonti verificate, checklist e scadenze con promemoria, un hub di coordinamento con permessi granulari tra medico, scuola e terapisti e un fascicolo digitale cifrato. L'architettura deve essere modulare, per poter essere estesa ad altre patologie, e il prototipo è validato sul campo con l'associazione Sanfilippo Fighters.

=== Aspetti positivi
- Impatto sociale concreto e dominio motivante: il prodotto affianca il lavoro del Care Navigator e riduce il carico organizzativo di famiglie fragili.
- Tecnologie moderne e spendibili: LLM, RAG, estrazione di entità con NLP, architettura cloud serverless su AWS, modellazione domain-driven e design a plugin.
- Supporto ampio e concreto di Miriade: mentorship su cloud e AI, supporto UX e UI, mediazione del dominio clinico, formazione iniziale e disponibilità a negoziare il perimetro del progetto.
- Requisiti ben distinti tra funzionali, opzionali, tecnici e non funzionali, con un'architettura di riferimento non vincolante e un percorso incrementale suggerito (MVP ed evoluzioni successive).

=== Criticità
- Trattamento di dati sanitari di minori (art. 9 GDPR): servono privacy by design, DPIA, cifratura, tracciamento degli accessi e un modello di autorizzazione per paziente che vada oltre il semplice RBAC.
- Alcuni requisiti sono difficili da soddisfare alla lettera: la cifratura «end-to-end» è in tensione con le funzioni AI che leggono i dati lato server, e le risposte «prive di allucinazioni» non sono pienamente raggiungibili.
- Rischio regolatorio (EU AI Act, MDR): il perimetro deve restare su orientamento e informazione, senza indicazioni diagnostiche o terapeutiche.
- Forte orientamento ai servizi AWS (Lambda, Bedrock, Cognito), con rischio di vendor lock-in e costi da presidiare; ambito ampio (18 requisiti) e dominio clinico nuovo da apprendere, con strumenti limitati per l'italiano (Comprehend Medical supporta solo l'inglese).

=== Valutazione finale
Capitolato di forte impatto sociale e con un supporto molto ampio da parte del proponente, ma con un'elevata complessità su sicurezza, privacy e conformità normativa e con un dominio sensibile che richiede cautela costante. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C6 – Caching semantico e dashboard FinOps per LiteLLM

=== Informazioni generali
- *Titolo:* Sviluppare un sistema IA di caching semantico e dashboard FinOps – Estendere le funzionalità del progetto open source LiteLLM
- *Proponente:* Var Group
- *Referente:* Alessio Borgheresi, Stefano Dindo, Laura Ferretti, Michele Massaro

=== Breve descrizione
Estensione di LiteLLM, il proxy open source che instrada le richieste verso più provider di modelli linguistici ed è già in produzione in Var Group, con due componenti originali. Il primo è un livello di caching semantico, basato su embedding e ricerca per similarità, che riconosce domande equivalenti anche se formulate in modo diverso e riduce le chiamate ai modelli. Il secondo è una dashboard FinOps che attribuisce i costi a team, progetti e utenti, gestisce budget e avvisi, calcola il risparmio ottenuto dalla cache e prevede la spesa mensile. Il risultato atteso è un MVP end-to-end con proxy, cache e dashboard.

=== Aspetti positivi
- Problema attuale e concreto, quello del controllo dei costi dell'AI generativa in azienda, con risultati misurabili (risparmio di token e costi, latenza).
- Ambito ben delimitato: due componenti su una base esistente (LiteLLM, da non reinventare), con uno stack consigliato chiaro e diffuso (Python, FastAPI, Docker, Redis, PostgreSQL, un vector database, React).
- Competenze trasferibili e richieste dal mercato su embedding, ricerca vettoriale, multi-tenancy e osservabilità dei costi.
- Percorso strutturato dal proponente: sessione di design thinking, formazioni dedicate (LiteLLM, embedding e caching, FinOps), stand-up periodici e momenti di domande e risposte, con deliverable definiti (architettura e ADR, requisiti, UML, MVP, test con copertura di almeno il 70%).

=== Criticità
- Dipendenza da un progetto esterno: il lavoro si innesta su LiteLLM, il cui sviluppo upstream può cambiare, e le sue limitazioni note, come la multi-tenancy limitata, vanno aggirate o estese.
- La cache semantica non è deterministica: la scelta della soglia di similarità può far restituire risposte sbagliate, quindi occorre separare i test deterministici dalla valutazione probabilistica, con un impegno di verifica non banale.
- Il capitolato è presentato in forma di slide e dà meno dettaglio su requisiti numerati, distinzione tra obbligatori e opzionali, criteri di accettazione e dati di prova: il perimetro andrebbe chiarito con il proponente.
- È prevista una sessione di design thinking in presenza di tre ore, e i costi di embedding e di chiamate ai modelli vanno tenuti sotto controllo durante i test.

=== Valutazione finale
Capitolato tecnicamente interessante, ben delimitato e con un buon percorso di supporto, ma con un perimetro dei requisiti meno dettagliato nei documenti e una forte dipendenza da un componente esterno. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C7 – SmartDashboard

=== Informazioni generali
- *Titolo:* SmartDashboard – Piattaforma di Business Intelligence self-service potenziata da AI
- *Proponente:* Ergon Informatica S.r.l. (Castelfranco Veneto, TV)
- *Referente:* Gianluca Carlesso

=== Breve descrizione
Piattaforma di Business Intelligence end-to-end che recupera i dati dal gestionale aziendale (ERP), li consolida in un data warehouse con modello dimensionale e li espone in una web app responsive in cui gli utenti costruiscono da soli le dashboard trascinando i widget (grafici, KPI, tabelle, pivot, mappe). Un layer di intelligenza artificiale basato su LLM genera visualizzazioni da richieste in linguaggio naturale, produce insight automatici, assiste nella costruzione delle dashboard e, come estensione, spiega gli indicatori su richiesta. Il proponente può fornire i dati di un caso di studio reale.

=== Aspetti positivi
- Ambito esclusivamente software, senza componenti hardware, con un dominio facilmente comprensibile e un caso d'uso reale legato a vendite, ordini e logistica di un'azienda.
- Pipeline completa e formativa: ingestione, ETL, modellazione dimensionale (star schema), API, frontend e integrazione di un LLM, con competenze di data engineering e di sviluppo web spendibili.
- Tecnologie libere e molto diffuse (Python, DuckDB, React o altri framework, API REST, LLM commerciali), senza stack vincolanti, e un approccio incrementale consigliato: prima la parte BI, poi le funzioni AI, con requisiti da classificare per priorità.
- Dati reali del proponente disponibili su richiesta per sviluppo e test, incontri di allineamento ogni quindici giorni e un referente disponibile per chiarimenti.

=== Criticità
- Ambito ampio: pipeline dati, web app con costruttore di dashboard drag and drop, libreria di widget con pivot e mappe e quattro capacità AI. Il rischio è realizzare molte funzionalità solo abbozzate, e l'analisi dei requisiti dovrà restringere il perimetro.
- Il confronto implicito con prodotti consolidati come Power BI e Tableau rende difficile ottenere una piattaforma altrettanto rifinita sul piano dell'usabilità.
- La generazione affidabile di visualizzazioni da linguaggio naturale è delicata (risposte errate dell'LLM, interrogazioni sui dati da non esporre al frontend, controlli di coerenza richiesti) e dipende da API commerciali con costi e limiti.
- Il capitolato non definisce requisiti numerati, criteri di accettazione o soglie di test; la qualità dei dati reali del gestionale può richiedere molto lavoro di pulizia e normalizzazione, e sono dichiarati incontri periodici ma non formazioni dedicate.

=== Valutazione finale
Capitolato interamente software, di dominio comprensibile e con un buon equilibrio tra dati e intelligenza artificiale, ma con un ambito ampio e una dipendenza dalla qualità dei dati reali. Il gruppo lo ha individuato come possibile capitolato di riserva.

#pagebreak(weak: true)
== C8 – Sonar

=== Informazioni generali
- *Titolo:* Sonar – Documentazione vivente di uno store Shopify
- *Proponente:* Halue S.r.l. Società Benefit (Parma e Abano Terme, PD)
- *Referente:* Valentino Baraldo

=== Breve descrizione
Applicazione web in sola lettura che si collega a uno store Shopify tramite custom app, ne scansiona configurazioni (app, webhook, campi personalizzati, funzioni, canali) e codice del tema attraverso le Admin API, e ricostruisce un grafo di entità e dipendenze indicando fonte e livello di confidenza di ogni informazione. Un motore di regole estensibile segnala orfani e codice morto; l'interfaccia permette di navigare il catalogo e il grafo, confrontare due snapshot ed esportare la documentazione in Markdown o HTML, pronta da consegnare a un fornitore subentrante.

=== Aspetti positivi
- Problema reale e ben argomentato, con un perimetro molto chiaro: sola lettura, solo Shopify, con indicazioni esplicite su ciò che è fuori ambito.
- Requisiti numerati e criteri di accettazione misurabili (copertura dei test almeno 70%, casi di test superati almeno 95%, falsi positivi ad alta severità non oltre il 10%), con la possibilità di concordare per iscritto una riduzione motivata dei requisiti obbligatori.
- Ambiente di lavoro autonomo e gratuito (development store Shopify, piani free di Vercel e Supabase), senza dipendere da dati o infrastrutture del proponente; l'uso di strumenti di AI nello sviluppo è esplicitamente ammesso.
- Molti temi di ingegneria del software (modello a grafo, rate limiting, analisi statica, architettura estensibile, ADR, diagrammi C4 e UML) e un processo di collaborazione descritto con precisione: incontri ogni due settimane e risposta entro un giorno lavorativo.

=== Criticità
- Stack tecnologico vincolante e specifico (Next.js su Vercel, Vercel Workflows, Supabase con Row Level Security, TypeScript, solo autenticazione Google), in parte recente: le deroghe vanno richieste entro l'analisi dei requisiti.
- I piani gratuiti hanno limiti concreti, come la sospensione dei progetti Supabase dopo una settimana di inattività e le soglie mensili di Vercel, che incidono su ri-scansioni pianificate e generazione di descrizioni; il consumo va monitorato.
- Ambito molto esteso: 20 requisiti funzionali obbligatori, oltre a quelli di qualità, sicurezza e non funzionali; il gruppo deve inoltre costruire e documentare da sé lo store Shopify di prova con la stratificazione da rilevare.
- Dominio specialistico da apprendere (Admin API di Shopify, metafield, codice Liquid) e analisi statica di codice reale e talvolta minificato; non sono previsti incontri in presenza né un canale di messaggistica condiviso.

=== Valutazione finale
Capitolato molto curato e con criteri di valutazione chiari, ma vincolato a uno stack e a un dominio molto specifici, con un ambito ampio e limiti dei piani gratuiti da presidiare. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C9 – SpecCheck

=== Informazioni generali
- *Titolo:* SpecCheck – Skills per OpenCode per la verifica della tracciabilità end-to-end da casi d'uso a requisiti e codice sorgente
- *Proponente:* Zucchetti S.p.A.
- *Referente:* Gregorio Piccoli

=== Breve descrizione
Pacchetto di skill, tool e almeno un plugin per OpenCode, l'harness per lo sviluppo assistito da LLM, che verifica la rispondenza tra casi d'uso, requisiti e codice di un progetto software esterno: legge diagrammi e documentazione dei casi d'uso e le specifiche dei requisiti, li confronta, ne verifica il riscontro nel codice e riporta in una dashboard le discrepanze. Il sistema si occupa solo della verifica, non della realizzazione, ed è distribuito come prodotto unico con un installer. Tra i requisiti opzionali ci sono una dashboard grafica, la verifica della copertura delle specifiche e la lettura da PDF.

=== Aspetti positivi
- Tema molto attuale e coerente con l'ingegneria del software: sviluppo assistito da AI e tracciabilità tra casi d'uso, requisiti e codice, un problema di verifica diventato centrale ora che la scrittura del codice è automatizzata.
- Competenze molto aggiornate su agenti, skill, plugin e gestione del contesto per LLM, con strumenti di riferimento come OpenSpec.
- Accesso offerto dall'azienda sia a modelli di grandi dimensioni, con un tetto di costo, sia a modelli più piccoli senza limiti, e titolo preferenziale per la pubblicazione open source del risultato.
- Requisiti obbligatori chiari e in numero contenuto (nove), con fasi PoC e MVP ben distinte e requisiti opzionali modificabili dai gruppi vincitori.

=== Criticità
- Progetto dichiaratamente molto esplorativo: parte dei risultati dipende dalle capacità degli LLM, non deterministiche e non garantite, e la verifica richiede componenti deterministiche (plugin o applicativo esterno) accanto alle skill.
- I requisiti obbligatori non sono modificabili in corso d'opera, quindi un'ipotesi rivelatasi troppo ambiziosa lascerebbe poco margine.
- Dipendenza da OpenCode e da strumenti in rapida evoluzione, con il rischio che le interfacce di skill e plugin cambino; serve inoltre un progetto di prova con casi d'uso, requisiti e codice da verificare.
- Il capitolato non indica cadenza di incontri, supporto o formazione da parte del proponente, né soglie quantitative di accettazione (parla solo di «adeguata copertura»); la qualità della verifica (falsi positivi e negativi) è difficile da misurare.

=== Valutazione finale
Capitolato innovativo e molto pertinente al corso, con un buon accesso ai modelli, ma con un alto grado di incertezza dovuto alla natura esplorativa e alla dipendenza dagli LLM, e con meno indicazioni sul supporto del proponente. Per questi motivi il gruppo non lo ha selezionato.

= Capitolato selezionato

== Valutazioni finali
#todo[Valutazione finale comparativa dei capitolati e scelta del capitolato per la candidatura.]
