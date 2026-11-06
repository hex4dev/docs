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
  numero: "VI-2026-11-03",
  data: "2026-11-03",
  ora-inizio: "15:00",
  ora-fine: "16:20",
  luogo: "Online (Discord)",
  verbalizzante: "Francesco Bassani",
  presenti: (
    "Matteo Angelini",
    "Francesco Bassani",
    "Matilde Pedrocchi",
    "Alessandro Ravenna",
    "Alessandro Zanier",
  ),
  assenti: ("Andrea Nogara",),
)

= Ordine del giorno
+ Esito dell'aggiudicazione e candidatura al C7
+ Riscontri del docente e dichiarazione degli impegni
+ Repository, sito e verifica dei documenti
+ Ruoli del primo sprint e ripartizione delle attività

= Resoconto
== Esito dell'aggiudicazione e candidatura al C7
Il C3 non è stato assegnato al gruppo, che si candida al C7 (SmartDashboard, Ergon), già indicato come alternativa. Si rivedono i documenti esistenti, senza riscriverli, per consegnare la nuova candidatura entro il 2026-11-10.

== Riscontri del docente e dichiarazione degli impegni
I rilievi riguardano la distribuzione di tempo e ruoli, il versionamento (ordine e verifica del registro delle modifiche) e i verbali, troppo verbosi e con scadenze non definite. È stata esaminata la nuova versione della dichiarazione degli impegni, scritta sul C3 e da adattare al C7 (decisione D5).

== Repository, sito e verifica dei documenti
Le date del sito seguiranno il formato della repository e il sito mostrerà la versione dei documenti. Ogni attività del verbale avrà una issue GitHub assegnata al responsabile, creata da Alessandro Zanier e linkata nel verbale. Le modifiche ai documenti sono verificate da una persona diversa dall'autore.

== Ruoli del primo sprint e ripartizione delle attività
Il gruppo ha assegnato i ruoli del primo sprint (decisione D6) e ripartito le attività nella tabella seguente.

= Decisioni
#decisioni(
  [La nuova candidatura al C7 si prepara revisionando i documenti esistenti e si consegna entro il 2026-11-10 (data indicativa), con lettera di presentazione aggiornata.#azioni-correlate("A3", "A5", "A6", "A7", "A10")],
  [I verbali già emessi non sono modificati; i nuovi sono sintetici e riportano scadenze definite per ogni attività.#azioni-correlate("A2")],
  [Il registro delle modifiche di ogni documento è ordinato dal più recente e riporta autore e verificatore, diversi tra loro.#azioni-correlate("A8", "A9")],
  [Ogni attività del verbale ha una issue GitHub assegnata al responsabile; i link sono riportati nel verbale.#azioni-correlate("A1")],
  [Dichiarazione degli impegni riferita al C7: 90 ore a componente (540 totali); ruoli decisi sprint per sprint (2 settimane); eliminati riferimenti normativi e informativi e tabella delle ore per ruolo e sprint; impegni assunti in coda; rischi e motivazione della ripartizione delle ore riferiti al C7.#azioni-correlate("A3")],
  [Ruoli del primo sprint: Responsabile Matilde Pedrocchi; Amministratore Alessandro Zanier; Analisti Francesco Bassani e Alessandro Ravenna; Verificatori Matteo Angelini e Andrea Nogara.#azioni-correlate("A3")],
  [Il sito mostra le date in formato AAAA-MM-GG e, se possibile in modo automatico, la versione dei documenti.#azioni-correlate("A4")],
)

#pagebreak(weak: true)
= Attività da svolgere
#attivita(
  "VI-2026-11-03",
  ([#rif("D4") \ Creare le issue delle attività e comunicarne i link al verbalizzante], [Alessandro Zanier], [2026-11-03], []),
  ([#rif("D2") \ Redigere i verbali del 2026-11-02 e del 2026-11-03], [Francesco Bassani], [2026-11-03], []),
  ([#rif("D1", "D5", "D6") \ Condividere la dichiarazione degli impegni aggiornata], [Francesco Bassani], [2026-11-03], [#issue(32)]),
  ([#rif("D7") \ Sistemare versionamento dei documenti e date del sito], [Alessandro Zanier], [2026-11-06], []),
  ([#rif("D1") \ Verificare e aggiornare la valutazione dei capitolati], [Matilde Pedrocchi], [2026-11-06], [#issue(33)]),
  ([#rif("D1") \ Redigere il diario di bordo], [Matteo Angelini], [2026-11-06], [#issue(34)]),
  ([#rif("D1") \ Esaminare le repository degli altri gruppi], [Alessandro Ravenna], [2026-11-06], [#issue(36)]),
  ([#rif("D3") \ Indicare il verificatore e ordinare il registro delle modifiche nei documenti modificati], [Tutti i componenti], [2026-11-10], [#issue(37)]),
  ([#rif("D3") \ Verificare tutti i documenti di candidatura], [Alessandro Ravenna, Andrea Nogara], [2026-11-10], [#issue(35)]),
  ([#rif("D1") \ Consegnare la nuova candidatura al C7], [Tutto il gruppo], [2026-11-10], [#issue(38)]),
)

= Prossima riunione
Venerdì 2026-11-06, ore 15:00, online (Discord).
