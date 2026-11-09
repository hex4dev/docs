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
  numero: "VI-2026-11-06",
  data: "2026-11-06",
  ora-inizio: "15:03",
  ora-fine: "15:26",
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
+ Candidatura al nuovo capitolato e invio
+ Versionamento e formato delle date
+ Dichiarazione degli impegni e ruoli del primo sprint
+ Verifica dei documenti e uso delle issue

= Resoconto
== Candidatura al nuovo capitolato e invio
Dopo la mancata assegnazione del C7, il gruppo si candida al C9 (SpecCheck, Zucchetti), non considerato in precedenza. La lettera di presentazione richiede solo l'aggiornamento di link e capitolato. L'invio è anticipato a lunedì 2026-11-09, dopo un controllo generale.

== Versionamento e formato delle date
Si è scelto di portare tutti i documenti alla versione 1.0, senza riscrivere retroattivamente le versioni intermedie 0.x. Il docente richiede le date nel formato AAAA-MM-GG, già adottato nella repository e nel sito.

== Dichiarazione degli impegni e ruoli del primo sprint
L'avvio è indicato come "il giorno dopo l'aggiudicazione", senza data, e la consegna slitta di una settimana, con ricalcolo del calendario. Poiché la prima attività sarà l'analisi dei requisiti, si è riesaminata la composizione dei ruoli: restano confermati, con due analisti.

== Verifica dei documenti e uso delle issue
I documenti sono verificati prima dell'inserimento nella repo. Ogni responsabile aggiorna la propria issue e la collega alle pull request, così che si chiuda al merge.

= Decisioni
#decisioni(
  [In questo ciclo di consegna tutti i documenti di candidatura sono alla versione 1.0; le modifiche minori incrementano la seconda cifra (1.1, 1.2), quelle sostanziali, come un cambio di capitolato, portano a 2.0.#azioni-correlate("A2", "A3", "A4")],
  [Tutte le date nei documenti e nel sito sono in formato AAAA-MM-GG.#azioni-correlate("A1")],
  [La candidatura al C9 è inviata lunedì 2026-11-09 entro le 17:00, anticipando il termine del 2026-11-10, dopo un controllo generale nella riunione delle 15:00.#azioni-correlate("A4", "A6", "A7", "A9")],
  [La data di consegna prevista slitta di una settimana, a venerdì 2027-04-02; la dichiarazione degli impegni indica l'avvio il giorno dopo l'aggiudicazione, senza data.#azioni-correlate("A2")],
  [I ruoli del primo sprint restano quelli stabiliti (VI-2026-11-03-D6).#senza-azioni],
  [Ogni componente aggiorna la propria issue GitHub e la collega alle pull request, così che si chiuda al merge.#azioni-correlate("A8")],
  [I documenti sono verificati prima dell'inserimento nella repo e i verificatori compaiono nel registro delle modifiche.#azioni-correlate("A5")],
)

= Attività da svolgere
#attivita(
  "VI-2026-11-06",
  ([#rif("D2") \ Applicare nel sito le date AAAA-MM-GG e la versione dei documenti], [Alessandro Zanier], [2026-11-06], []),
  ([#rif("D1", "D4") \ Aggiornare la dichiarazione degli impegni: calendario ricalcolato, consegna al 2027-04-02, avvio senza data, versione 1.0], [Francesco Bassani], [2026-11-06], [#issue(32)]),
  ([#rif("D1") \ Portare la valutazione dei capitolati alla versione 1.0], [Matilde Pedrocchi], [2026-11-09], [#issue(33)]),
  ([#rif("D1", "D3") \ Aggiornare la lettera di presentazione: link, capitolato e registro delle modifiche (versione 1.0, ordine corretto)], [Tutto il gruppo], [2026-11-09], []),
  ([#rif("D7") \ Verificare i documenti, compresa la PR della dichiarazione degli impegni, prima dell'inserimento nella repo], [Alessandro Ravenna, Andrea Nogara], [2026-11-09], [#issue(35)]),
  ([#rif("D3") \ Ricontrollare con il docente la disponibilità del capitolato], [Matilde Pedrocchi], [2026-11-09], []),
  ([#rif("D3") \ Inviare la candidatura al docente entro le 17:00], [Matilde Pedrocchi], [2026-11-09], [#issue(38)]),
  ([#rif("D6") \ Aggiornare la propria issue e collegarla alle PR delle attività svolte], [Tutti i componenti], [2026-11-09], []),
  ([#rif("D3") \ Designare il verbalizzante della riunione del 2026-11-09], [Tutto il gruppo], [2026-11-09], []),
)

= Prossima riunione
Lunedì 2026-11-09, ore 15:00, online (Discord): controllo generale dei documenti e invio della candidatura. 
