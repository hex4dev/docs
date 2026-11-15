#import "/templates/verbale-interno.typ": *
#import "/templates/verbale-interno.typ": _tabella
#import "/templates/diario-di-bordo.typ": colore-scuro

// Tracciabilità decisione ↔ attività: ogni decisione rimanda alle attività
// che la attuano e ogni attività rimanda alla decisione da cui discende.
#let azioni-correlate(..ids) = [
  #linebreak()
  #text(size: 9pt, fill: colore-scuro)[*Attività correlate:* #ids.pos().join(", ")]
]
#let senza-azioni = [
  #linebreak()
  #text(size: 9pt, fill: colore-scuro)[*Attività correlate:* nessuna]
]
#let rif(..ids) = text(size: 9pt, fill: colore-scuro)[*Rif.* #ids.pos().join(", ")]

// Issue GitHub collegata a un'attività. Per aggiungere il link, sostituire
// la cella vuota [] con [#issue(NN)], dove NN è il numero dell'issue.
#let issue(n) = link("https://github.com/hex4dev/docs/issues/" + str(n))[\##n]

// Tabella delle attività con colonna per il link all'issue GitHub.
// Ogni riga: (attività, responsabile, scadenza, issue).
#let attivita(numero, ..righe) = _tabella(
  (auto, 1fr, 2.9cm, 2.4cm, 1.5cm),
  ("ID", "Attività", "Responsabile", "Scadenza", "Issue"),
  righe.pos().enumerate().map(((i, r)) => (
    [#(numero + "-A" + str(i + 1))],
    ..r.map(c => block(breakable: false, c)),
  )).flatten(),
)

#show: verbale-interno.with(
  numero: "VI-2026-11-11",
  data: "2026-11-11",
  ora-inizio: "15:02",
  ora-fine: "15:31",
  luogo: "Online (Discord)",
  verbalizzante: "Francesco Bassani",
  presenti: (
    "Matteo Angelini",
    "Francesco Bassani",
    "Andrea Nogara",
    "Matilde Pedrocchi",
    "Alessandro Ravenna",
    "Alessandro Zanier",
  ),
  assenti: ("Nessuno",),
)

= Ordine del giorno
+ Incontro con Zucchetti
+ Riscontri del docente sulla seconda candidatura
+ Struttura della repository e documenti da redigere
+ Convenzioni e automazioni

= Resoconto
== Incontro con Zucchetti
L'email al referente di Zucchetti non è ancora stata inviata, perché non era chiaro se proporre una data senza conoscere la disponibilità dell'azienda. Si propone una fascia pomeridiana, senza vincoli rigidi, e sarà Zucchetti a fissare l'orario.

== Riscontri del docente sulla seconda candidatura
Il sito deve escludere i diari di bordo e i link ai sorgenti, mantenendo solo i link ai PDF, con documenti separati per categoria. Sulla dichiarazione degli impegni, il docente giudica non ragionevole presumere sprint sempre bisettimanali e troppo prescrittivo assegnare ore specifiche a ruoli e persone; il documento non è rivisto e si presta attenzione a non superare il costo massimo dichiarato. Alla prima pubblicazione nella repo ogni documento richiede l'approvazione del Responsabile in carica nello sprint, da indicare in "approvazione a rilascio"; resta da chiarire se sia necessaria anche per le modifiche successive.

== Struttura della repository e documenti da redigere
Chiusa la candidatura, i nuovi documenti sono raccolti in una sezione Analisi, affiancata a Candidatura; le Norme di progetto, che non appartengono a una singola fase, hanno una cartella dedicata. I documenti individuati sono: Norme di progetto (comprendono il way of working), Analisi dei requisiti, Glossario e diario di bordo. Il Glossario è separato dalle Norme di progetto e resta in aggiornamento continuo.

== Convenzioni e automazioni
Il nome del gruppo è scritto con l'iniziale maiuscola e le date con il trattino, come nella maggior parte dei documenti. Sono state valutate l'automazione dell'indicazione del verificatore tramite pull request e un controllo automatico del formato delle date, senza assegnare l'attività.

= Decisioni
#decisioni(
  [L'email a Zucchetti propone la disponibilità nel pomeriggio, senza vincoli rigidi, e lascia all'azienda la scelta dell'orario.#azioni-correlate("A1")],
  [Dal sito sono rimossi i diari di bordo e i link ai sorgenti; restano i link ai PDF.#azioni-correlate("A2")],
  [I documenti successivi alla candidatura sono pubblicati in una sezione Analisi, parallela a Candidatura; le Norme di progetto hanno una cartella dedicata.#azioni-correlate("A2", "A3")],
  [Le Norme di progetto, che includono il way of working, la nomenclatura dei branch e le regole di versionamento, sono pianificate dal responsabile e poi riviste dall'intero gruppo.#azioni-correlate("A3")],
  [L'analisi dei requisiti sul C9 parte da una bozza interna, da integrare con le informazioni di Zucchetti.#azioni-correlate("A4")],
  [Il Glossario è un documento separato, inizialmente una struttura vuota aggiornata durante il progetto.#azioni-correlate("A5")],
  [Alla prima pubblicazione nella repo, ogni documento riporta in "approvazione a rilascio" il Responsabile dello sprint.#senza-azioni],
  [Il nome del gruppo si scrive con l'iniziale maiuscola e le date con il trattino.#senza-azioni],
  [Il diario di bordo compete al Responsabile.#azioni-correlate("A6")],
  [Il verbale della riunione è redatto dal verbalizzante.#azioni-correlate("A7")],
)

= Attività da svolgere
#attivita(
  "VI-2026-11-11",
  ([#rif("D1") \ Inviare l'email a Zucchetti con la disponibilità nel pomeriggio], [Matilde Pedrocchi], [2026-11-11], [#issue(54)]),
  ([#rif("D2", "D3") \ Sistemare il sito: rimuovere diari di bordo e link ai sorgenti, aggiungere la sezione Analisi], [Alessandro Zanier], [2026-11-16], [#issue(55)]),
  ([#rif("D3", "D4") \ Redigere il piano dei contenuti delle Norme di progetto e predisporne la cartella], [Alessandro Zanier], [2026-11-16], [#issue(56)]),
  ([#rif("D5") \ Redigere la prima bozza dell'Analisi dei requisiti sul C9], [Francesco Bassani, Alessandro Ravenna], [2026-11-16], [#issue(57)]),
  ([#rif("D6") \ Predisporre la struttura del Glossario], [Francesco Bassani], [2026-11-16], [#issue(58)]),
  ([#rif("D9") \ Redigere il diario di bordo], [Matilde Pedrocchi], [2026-11-16], [#issue(59)]),
  ([#rif("D10") \ Redigere il verbale della riunione del 2026-11-11], [Francesco Bassani], [2026-11-16], [#issue(60)]),
)

= Prossima riunione
Lunedì 2026-11-16, ore 15:00, online (Discord). L'incontro con Zucchetti sarà fissato alla ricezione della loro risposta.
