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
  numero: "VI-2026-11-23",
  data: "2026-11-23",
  ora-inizio: "15:00",
  ora-fine: "16:00",
  luogo: "Online (Discord)",
  verbalizzante: "Matilde Pedrocchi",
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
+ Retrospettiva Sprint 1
+ Stato dell'Analisi dei requisiti e ruoli dello Sprint 2
+ Piano di Qualifica
+ Approvazione e pubblicazione dei documenti
+ Approfondimento di OpenCode e OpenSpec
+ Firma verbale esterno e secondo incontro con Zucchetti

= Resoconto

== Retrospettiva Sprint 1
Il Responsabile dello Sprint 1 ha compilato la sezione relativa al consuntivo, retrospettiva e aggiornamento del preventivo a finire dello Sprint 1 nel Piano di Progetto.

== Stato dell'Analisi dei requisiti e ruoli dello Sprint 2
La prima bozza di Analisi dei Requisiti è prossima al completamento. Poiché in questo sprint si continua la fase di analisi dei requisiti, non sono presenti né Progettisti né Programmatori. Per poter mantenere continuità nella parte iniziale dell'analisi, Francesco Bassani e Alessandro Ravenna restano Analisti, seguendo la regola delle Norme di Progetto che ammette che un membro ricopra lo stesso ruolo per al massimo due sprint consecutivi. Matilde Pedrocchi e Alessandro Zanier diventano Verificatori. Matteo Angelini assume il ruolo di Responsabile. Andrea Nogara diventa Amministratore.

== Piano di Qualifica
Con la redazione della prima bozza di Analisi dei Requisiti, il gruppo ritiene sensato iniziare a lavorare in parallelo al Piano di Qualifica. Questo compito viene affidato ai Verificatori. 

== Approvazione e pubblicazione dei documenti
Le anteprime PDF nelle pull request sono attive. L'approvazione a rilascio invece non è ancora stata provata ed è stata configurata solamente per i documenti con registro delle modifiche, che i verbali non hanno. Si preferisce non introdurlo, in quanto i verbali sono dei documenti che non verranno rilavorati dopo la pubblicazione, inserendo invece una riga che segnala l'avvenuta approvazione.

== Approfondimento di OpenCode e OpenSpec
Francesco Bassani e Alessandro Ravenna continuano in coppia ad approfondire OpenCode. Durante la riunione di lunedì 2026-11-30 riporteranno al resto del gruppo quanto imparato.

== Firma verbale esterno e secondo incontro con Zucchetti
Il verbale esterno dell'incontro del 2026-11-13 non è ancora stato inviato a Zucchetti per la firma. Con il cambio di ruolo, Matilde Pedrocchi passa a Matteo Angelini indirizzo e accessi della casella del gruppo e lui invierà la richiesta di firma del verbale. 
Il gruppo ha deciso di chiedere un secondo incontro con l'azienda proponente Zucchetti per la seconda settimana di questo sprint, in modo da poter ricevere riscontro sui requisiti e casi d'uso per il momento individuati e sugli approfondimenti effettuati su OpenCode e OpenSpec.

= Decisioni
#decisioni(
  [Per lo Sprint 2 Matteo Angelini è Responsabile, Andrea Nogara è Amministratore, Francesco Bassani e Alessandro Ravenna sono Analisti, Matilde Pedrocchi e Alessandro Zanier sono Verificatori.#azioni-correlate("A3")],
  [Viene terminata la prima bozza di Analisi dei Requisiti e consegnata ai Verificatori.#azioni-correlate("A1")],
  [Il Piano di Qualifica è avviato in questo sprint dai Verificatori, dopo la ricezione della prima bozza di Analisi dei Requisiti.#azioni-correlate("A2")],
  [Nei verbali non si introduce il registro delle modifiche, ma all'approvazione della pull request è inserita automaticamente una riga che indica l'approvazione a rilascio.#azioni-correlate("A7")],
  [Francesco Bassani e Alessandro Ravenna continuano l'approfondimento di OpenCode e OpenSpec e riportano al resto del gruppo per la riunione interna del 2026-11-30.#azioni-correlate("A4")],
  [Il verbale esterno del 2026-11-13 deve essere inviato a Zucchetti per la firma.#azioni-correlate("A3", "A5")],
  [Chiedere a Zucchetti un secondo incontro da fissare per la seconda settimana dello sprint.#azioni-correlate("A6")],
)

= Attività da svolgere
#attivita(
  "VI-2026-11-23",
  ([#rif("D2") \ Completare la prima bozza di Analisi dei Requisiti e consegnarla ai Verificatori], [Francesco Bassani, Alessandro Ravenna], [2026-11-25], [#issue(57)]),
  ([#rif("D3") \ Avviare il Piano di Qualifica per la parte sull'Analisi dei Requisiti], [Matilde Pedrocchi, Alessandro Zanier], [2026-12-06], [#issue(75)]),
  ([#rif("D1", "D6") \ Consegnare al nuovo Responsabile indirizzo e accessi della casella del gruppo], [Matilde Pedrocchi], [2026-11-23], []),
  ([#rif("D5") \ Redigere l'overview di OpenCode e OpenSpec], [Francesco Bassani, Alessandro Ravenna], [2026-11-30], [#issue(67)]),
  ([#rif("D6") \ Inviare alla proponente Zucchetti il verbale esterno del 2026-11-13 per la firma], [Matteo Angelini], [2026-11-25], [#issue(76)]),
  ([#rif("D7") \ Chiedere alla proponente Zucchetti un secondo incontro per la seconda settimana dello sprint (2026-11-30 – 2026-12-06)], [Matteo Angelini], [2026-11-28], [#issue(77)]),
  ([#rif("D4") \ Inserire nei verbali la riga di approvazione al rilascio e sviluppare il corrispondente GitHub workflow di approvazione], [Andrea Nogara], [2026-12-06], [#issue(78)]),
)

= Prossima riunione
Lunedì 2026-11-30, ore 15:00, online (Discord).