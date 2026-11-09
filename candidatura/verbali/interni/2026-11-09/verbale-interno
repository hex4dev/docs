#import "/templates/verbale-interno.typ": *
#import "/templates/verbale-interno.typ": _tabella
#import "/templates/diario-di-bordo.typ": colore-scuro

// Tracciabilità decisione ↔ attività: ogni decisione rimanda alle attività
// che la attuano e ogni attività rimanda alla decisione da cui discende.
#let azioni-correlate(..ids) = [
  #linebreak()
  #text(size: 9pt, fill: colore-scuro)[*Attività correlate:* #ids.pos().join(", ")]
]
#let rif(..ids) = text(size: 9pt, fill: colore-scuro)[*Rif.* #ids.pos().join(", ")]


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
  numero: "VI-2026-11-09",
  data: "2026-11-09",
  ora-inizio: "15:00",
  ora-fine: "15:40",
  luogo: "Online (Discord)",
  verbalizzante: "Alessandro Ravenna",
  presenti: (
    "Matteo Angelini",
    "Andrea Nogara",
    "Matilde Pedrocchi",
    "Alessandro Ravenna",
    "Alessandro Zanier",
  ),
  assenti: ("Francesco Bassani",),
)

= Ordine del giorno
+ Scelta del capitolato C9
+ Ripartizione delle attività per la consegna della candidatura

= Resoconto
== Scelta del capitolato C9
Il gruppo ha scelto di candidarsi al capitolato C9, confermando la decisione dopo il confronto sulla valutazione dei capitoli. La candidatura sarà preparata a partire dai documenti già esistenti, aggiornati dove necessario.

== Ripartizione delle attività per la consegna della candidatura
Per consegnare la candidatura il prima possibile, il gruppo ha ripartito le attività nella tabella seguente. Rimangono da completare la verifica della dichiarazione degli impegni, la sistemazione del verbale del 2026-11-06 e della valutazione dei capitolati, e l'inserimento dei link nella lettera di presentazione.

= Decisioni
#decisioni(
  [Il gruppo sceglie di fornire la documentazione per la candidatura al capitolato C9.#azioni-correlate("A1", "A2", "A3", "A4", "A5")],
)

#pagebreak(weak: true)
= Attività da svolgere
#attivita(
  "VI-2026-11-09",
  ([#rif("D1") \ Verificare la dichiarazione degli impegni], [Matteo Angelini], [2026-11-10], []),
  ([#rif("D1") \ Sistemare il verbale del 2026-11-06], [Alessandro Zanier], [2026-11-10], []),
  ([#rif("D1") \ Sistemare la valutazione dei capitolati], [Andrea Nogara], [2026-11-10], []),
  ([#rif("D1") \ Redigere il verbale del 2026-11-09 e revisionare la valutazione dei capitolati], [Alessandro Ravenna], [2026-11-10], []),
  ([#rif("D1") \ Attendere la fornitura dei link necessari e inserirli nella lettera di presentazione], [Matilde Pedrocchi], [2026-11-10], []),
)

= Prossima riunione
La data della prossima riunione sarà definita dopo la risposta del docente riguardo all'aggiudicazione del capitolato C9.
