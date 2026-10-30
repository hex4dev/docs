#import "/templates/documento.typ": documento, tabella, todo

#show: documento.with(
  titolo: "Dichiarazione degli impegni",
  sottotitolo: "Progetto di Ingegneria del Software",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "0.2",
  data: "29/10/2026",
  uso: "Interno",
  redattori: ("Alessandro Zanier", "Andrea Nogara"),
  verificatori: ("Francesco Bassani", "Alessandro Ravenna"),
  registro: (
    ("0.1", "28/10/2026", "Alessandro Zanier", "-", "Prima stesura"),
    ("0.2", "29/10/2026", "Andrea Nogara", "-", "Continuazione stesura"),
  ),
)

= Introduzione
== Scopo del documento
Questo documento definisce gli impegni del gruppo *Hex4dev* per lo sviluppo del capitolato *C3*, intitolato *FossDot*.
Vengono in particolare illustrati l'impegno orario suddiviso per membro e ruolo, con relativa analisi ed un preventivo dei costi.

= Impegno orario e preventivo
== Suddivisione e costo orario

#tabella(
  (1fr, 1fr, 1fr, 1fr, 1fr),
  ("Ruolo", "Ore individuali previste" ,"Ore totali previste", "Costo/ora", "Costo totale"),
  ([Responsabile], [9], [54], [€ 30,00], [€ 1.620,00],
   [Amministratore], [7], [42], [€ 20,00], [€ 840,00],
   [Analista], [12], [72], [€ 25,00], [€ 1.800,00],
   [Progettista], [20], [120], [€ 25,00], [€ 3.000,00],
   [Programmatore], [24], [144], [€ 15,00], [€ 2.160,00],
   [Verificatore], [18], [108], [€ 15,00], [€ 1.620,00]),
)

== Preventivo costi

Il costo totale stimato per la realizzazione del progetto è di € 11.040,00.

= Analisi dei ruoli e motivazioni

== Analisi dei ruoli

=== Responsabile
Garantisce il coordinamento generale del progetto, comunicando con il docente e con l'azienda, monitorando l'avanzamento delle attività e il rispetto delle scadenze. Il suo contributo è essenziale per mantenere una visione d'insieme, individuare eventuali criticità e favorire una gestione equilibrata delle risorse disponibili.

=== Amministratore
Si occupa dell'organizzazione e del mantenimento dell'ambiente operativo, assicurando che strumenti e risorse siano accessibili e adeguatamente configurati. Il suo impegno contribuisce a prevenire difficoltà tecniche e a rendere più efficienti i processi di lavoro.

=== Analista
Ha il compito di comprendere le esigenze del progetto e trasformarle in requisiti precisi, coerenti e verificabili. La sua attività è particolarmente rilevante nelle fasi iniziali, poiché costituisce la base su cui vengono definite le successive scelte progettuali.

=== Progettista
Definisce la struttura tecnica del sistema, individuando soluzioni capaci di soddisfare i requisiti stabiliti. Le sue decisioni incidono direttamente sulla manutenibilità, sull'affidabilità e sulla possibilità di evoluzione del prodotto, rendendo fondamentale un'attenta valutazione delle alternative disponibili.

=== Programmatore
Realizza concretamente le funzionalità previste, traducendo le specifiche tecniche in codice eseguibile. Il suo lavoro richiede attenzione alla correttezza, alla leggibilità e alla qualità dell'implementazione, oltre alla capacità di affrontare eventuali problemi emersi durante lo sviluppo.

=== Verificatore
Valuta la conformità degli artefatti rispetto ai requisiti e agli standard di qualità definiti. La sua attività accompagna l'intero ciclo di sviluppo e permette di individuare tempestivamente anomalie e incongruenze, riducendo il rischio che queste compromettano il risultato finale.

== Motivazione suddivisione Ore

Il gruppo è composto da 6 membri e ciascuno assicura di dedicare al progetto 90 ore, per un totale di 540 ore, la ripartizione delle ore tra i ruoli riflette il peso di ciascuna attività nel ciclo di sviluppo, progettazione e codifica sono le fasi più onerose e hanno una quota maggiore, mentre i ruoli di natura organizzativa hanno tempo limitato rispetto al resto. 

== Rotazione dei ruoli

I ruoli verranno ricoperti a rotazione con cadenza bisettimanale, da tutti i membri del gruppo. Per garantire la rotazione dei ruoli, ogni membro ricoprirà ogni ruolo per lo stesso numero di ore, avendo alla fine acquisito esperienza in modo equo per ogni ruolo.

= Data di consegna

Il gruppo si impegna a rispettare la data prevista di consegna del prodotto, fissata al 26/03/2027.
