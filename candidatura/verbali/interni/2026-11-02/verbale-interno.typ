#import "/templates/verbale-interno.typ": *
#import "/templates/diario-di-bordo.typ": colore-scuro

// Tracciabilità decisione ↔ attività: ogni decisione rimanda alle attività
// che la attuano e ogni attività rimanda alla decisione da cui discende.
#let azioni-correlate(..ids) = [
  #linebreak()
  #text(size: 9pt, fill: colore-scuro)[*Attività correlate:* #ids.pos().join(", ")]
]
#let rif(..ids) = text(size: 9pt, fill: colore-scuro)[*Rif.* #ids.pos().join(", ")]

#show: verbale-interno.with(
  numero: "VI-2026-11-02",
  data: "02/11/2026",
  ora-inizio: "15:00",
  ora-fine: "15:07",
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
+ Pianificazione in attesa dell'esito dell'aggiudicazione
+ Norme di progetto
+ Verbale esterno firmato da Uranion
+ Collocazione del diario di bordo del 02/11/2026

= Resoconto
== Pianificazione
La ripartizione dei compiti dipende dall'esito dell'aggiudicazione, noto il 03/11/2026, da cui discenderanno due percorsi di lavoro distinti. Si rinvia quindi alla riunione successiva.

== Norme di progetto
Il way of working confluisce nelle Norme di progetto, che non dipendono dall'esito dell'aggiudicazione e vanno avviate subito. Definiranno commit, pull request (apertura e approvazione) e convenzioni di scrittura, e saranno aggiornate nel corso del progetto.

== Verbale esterno firmato da Uranion
Il verbale firmato non è ancora stato restituito e il sollecito precedente è rimasto senza risposta: si invierà un nuovo messaggio. Non è urgente, poiché i verbali non firmati non comportano penalizzazioni.

== Diario di bordo del 02/11/2026
Inserito nella sezione Candidatura, perché il capitolato non è ancora aggiudicato.

= Decisioni
#decisioni(
  [Riunione il 03/11/2026 alle 15:00, a esito dell'aggiudicazione noto, per ripartire i compiti.#azioni-correlate("A1")],
  [Le Norme di progetto, che formalizzano il way of working, sono redatte da subito.#azioni-correlate("A1")],
  [Il verbale firmato da Uranion è sollecitato con un nuovo messaggio.#azioni-correlate("A2")],
  [Il diario di bordo del 02/11/2026 è collocato nella sezione Candidatura.#azioni-correlate("A3")],
)

= Attività da svolgere
#azioni(
  ([#rif("D1", "D2") \ Ripartire i compiti, a partire dalle Norme di progetto], [Tutto il gruppo], [03/11/2026, ore 15:00]),
  ([#rif("D3") \ Sollecitare Uranion per il verbale esterno firmato], [Matilde Pedrocchi], [02/11/2026]),
  ([#rif("D4") \ Redigere il diario di bordo del 02/11/2026 nella sezione Candidatura], [Francesco Bassani], [03/11/2026]),
)

= Prossima riunione
03/11/2026, ore 15:00, online (Discord).
