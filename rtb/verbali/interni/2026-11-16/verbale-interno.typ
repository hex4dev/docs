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
  numero: "VI-2026-11-16",
  data: "2026-11-16",
  ora-inizio: "15:00",
  ora-fine: "15:50",
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
+ Approvazione del Responsabile e redazione dei verbali
+ Nome del gruppo
+ Revisione delle Norme di progetto
+ Sprint e ruoli

= Resoconto
== Approvazione del Responsabile e redazione dei verbali
Il docente ha confermato che ogni pubblicazione richiede l'approvazione del Responsabile in carica. Il verbale esterno del 2026-11-13 è affidato a un non verificatore, perché il verificatore Matteo Angelini non era presente all'incontro e non potrebbe verificarlo; la verifica è svolta da Andrea Nogara.

== Nome del gruppo
Il nome dell'organizzazione GitHub non è modificabile e i PDF già firmati restano invariati: la discrepanza tra «hex4dev» su GitHub e «Hex4dev» nei documenti è accettata e i documenti già emessi non sono modificati.

== Revisione delle Norme di progetto
È stata esaminata la bozza delle Norme di progetto, collocate con Glossario e diari di bordo nella cartella common, e concordate le regole su versionamento, branch, commit, issue e verifica (D3–D5). Manca la descrizione della struttura della repository.

== Sprint e ruoli
Il primo sprint termina il 2026-11-22; Responsabile e Verificatore sono necessari in ogni sprint, gli altri ruoli in base alle attività. Retrospettiva e assegnazione dei ruoli si svolgono nella riunione del lunedì successivo.

= Decisioni
#decisioni(
  [Ogni pubblicazione di un documento richiede l'approvazione del Responsabile in carica nello sprint, riportata in "approvazione a rilascio".#azioni-correlate("A1")],
  [Nei documenti il nome del gruppo si scrive con l'iniziale maiuscola; i documenti già emessi non sono modificati.#senza-azioni],
  [Le revisioni incrementano la versione minore senza limite (0.9, 0.10, 0.11); la versione maggiore cambia all'approvazione per la pubblicazione o per modifiche sostanziali.#azioni-correlate("A1")],
  [I branch hanno nomi in minuscolo con trattini, senza date; i commit seguono i Conventional Commits e chiudono la issue con "closes \#N"; il branch è eliminato dopo il merge della pull request.#azioni-correlate("A1")],
  [Il verbalizzante crea le issue delle attività (delegabile all'Amministratore) ed è designato prima delle riunioni esterne; autore e verificatore di un documento sono diversi e il verificatore di un verbale ha partecipato alla riunione.#azioni-correlate("A1", "A8")],
  [Gli sprint durano due settimane; alla prima riunione di ogni sprint si svolge la retrospettiva, si assegnano i ruoli e il Responsabile presenta il diario di bordo.#azioni-correlate("A1", "A10")],
  [Le attività sono pianificate con GitHub Project.#azioni-correlate("A6")],
  [Il verbale esterno del 2026-11-13 è redatto da Alessandro Ravenna; il verbale interno del 2026-11-16 da Francesco Bassani.#azioni-correlate("A7", "A8")],
  [Il secondo incontro con Zucchetti è richiesto dopo la revisione della bozza dell'Analisi dei requisiti e l'overview di OpenCode.#azioni-correlate("A2", "A3", "A9")],
  [Il Glossario parte dai termini generici già in uso; il Piano di progetto prosegue.#azioni-correlate("A4", "A5")],
)

= Attività da svolgere
#attivita(
  "VI-2026-11-16",
  ([#rif("D1", "D3", "D4", "D5", "D6") \ Aggiornare le Norme di progetto: regole concordate e struttura della repo], [Alessandro Zanier], [2026-11-23], [#issue(56)]),
  ([#rif("D9") \ Completare la bozza dell'Analisi dei requisiti], [Francesco Bassani], [2026-11-17], [#issue(57)]),
  ([#rif("D9") \ Revisionare la bozza dell'Analisi dei requisiti], [Alessandro Ravenna], [2026-11-20], []),
  ([#rif("D10") \ Completare il Glossario con i termini generici già in uso], [Francesco Bassani], [2026-11-20], [#issue(58)]),
  ([#rif("D10") \ Proseguire la redazione del Piano di progetto], [Matilde Pedrocchi], [2026-11-23], [#issue(63)]),
  ([#rif("D7") \ Configurare GitHub Project], [Alessandro Zanier], [2026-11-23], [#issue(64)]),
  ([#rif("D8") \ Redigere il verbale interno del 2026-11-16], [Francesco Bassani], [2026-11-16], [#issue(65)]),
  ([#rif("D5", "D8") \ Redigere il verbale esterno del 2026-11-13], [Alessandro Ravenna], [2026-11-16], [#issue(66)]),
  ([#rif("D9") \ Redigere l'overview di OpenCode], [Alessandro Ravenna], [2026-11-20], [#issue(67)]),
  ([#rif("D6") \ Retrospettiva dello sprint 1 e assegnazione dei ruoli], [Tutto il gruppo], [2026-11-23], []),
)

= Prossima riunione
Lunedì 2026-11-23, ore 15:00, online (Discord).
