#import "/templates/documento.typ": documento, tabella, todo

#show: documento.with(
  titolo: "Dichiarazione degli impegni",
  sottotitolo: "Progetto di Ingegneria del Software",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "0.1",
  data: "28/10/2026",
  uso: "Interno",
  redattori: ("Alessandro Zanier", "Andrea Nogara"),
  verificatori: ("Francesco Bassani", "Alessandro Ravenna"),
  registro: (
    ("0.1", "28/10/2026", "Alessandro Zanier", "-", "Prima stesura"),
  ),
)

= Introduzione
== Scopo del documento
Questo documento definisce gli impegni del gruppo *Hex4dev* per lo sviluppo del capitolato *C3*, intitolato *FossDot*.
Vengono in particolare illustrati l'impegno orario suddiviso per membro e ruolo, con relativa analisi ed un preventivo dei costi.

= Impegno orario e preventivo
== Suddivisione e costo orario

#tabella(
  (1fr, 1fr, 1fr, 1fr),
  ("Ruolo", "Ore totali previste", "Costo/ora", "Costo totale"),
  ([Responsabile], [#todo[X]], [€ 30,00], [€ #todo[X \* 30]],
   [Amministratore], [#todo[X]], [€ 20,00], [€ #todo[X \* 20]],
   [Analista], [#todo[X]], [€ 25,00], [€ #todo[X \* 25]],
   [Progettista], [#todo[X]], [€ 25,00], [€ #todo[X \* 25]],
   [Programmatore], [#todo[X]], [€ 15,00], [€ #todo[X \* 15]],
   [Verificatore], [#todo[X]], [€ 15,00], [€ #todo[X \* 15]]),
)

== Preventivo costi

#todo[Stabilire costo come somma di costi \* ora, deve essere >= ~10300€]

Il costo totale stimato per la realizzazione del progetto è di € XXXXX.

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

#todo[Stabilire la suddivisione nei vari ruoli e il numero di ore per membro, compatibilmente alla rotazione. Discutere il ruolo degli strumenti agentici, stabilire meglio responsabilità del verificatore vs programmatore]

== Rotazione dei ruoli

#todo[Auspicabile stabilire subito modalità di rotazione]

I ruoli verrano ricoperti, a rotazione con modalità da stabilire dopo l'aggiudicazione, da tutti i membri del gruppo, per garantire che ciascuno conosca e sappia mettere in pratica le funzioni di ogni ruolo. 

= Rischi e mitigazione

#todo[Azioni per evitare di sforare budget/monte ore]

= Data di consegna

Il gruppo si impegna a rispettare la data prevista di consegna del prodotto, fissata al XX/YY/2026.

#todo[selezionare ca. entro 20 sett. dal 3 novembre, metà marzo/inizio aprile] 