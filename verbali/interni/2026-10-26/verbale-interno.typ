#import "/templates/verbale-interno.typ": *

#show: verbale-interno.with(
  numero: "VI-2026-10-26",
  data: "26/10/2026",
  ora-inizio: "15:00",
  ora-fine: "15:55",
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
  assenti: ("nessuno",),
)

= Ordine del giorno
+ Cadenza degli incontri interni
+ Documentazione: linguaggio, template e sito web
+ Way of working e contenuti della candidatura
+ Scelta del capitolato e capitolati alternativi
+ Valutazione dei capitolati e preventivo dei costi
+ Lettera di presentazione
+ Ripartizione dei compiti e prossimo incontro

= Resoconto
== Cadenza degli incontri interni
Dopo un breve riepilogo dell'incontro della mattina, il gruppo ha convenuto di fissare un incontro interno settimanale, da affiancare a incontri aggiuntivi quando necessario. Il giorno e l'orario scelti sono il lunedì alle 15:00 su Discord, senza obiezioni da parte dei presenti.

== Documentazione, template e sito web
Per avere un unico linguaggio in tutto il progetto, la documentazione sarà scritta interamente in Typst. È già disponibile un template per i verbali interni; un altro componente ne ha uno proprio e, una volta visionato, il gruppo sceglierà quello più adatto. Un sito web per presentare la documentazione è stato considerato utile ma non prioritario: Alessandro Zanier si è reso disponibile a realizzarlo su GitHub.

== Way of working e candidatura
Si è osservato che gran parte del way of working potrà essere redatta solo dopo l'assegnazione del progetto; per ora si lavora a template e bozze. Nella lettera di presentazione sarà però opportuno accennare all'organizzazione, per esempio con un'idea di rotazione dei ruoli. Come principio generale il gruppo punta a una rotazione equa, in modo che le ore di ciascuno siano simili e tutti ricoprano tutti i ruoli.

Dal materiale del corso consultato durante la riunione sono emersi alcuni punti da tenere presenti. I verbali vanno ordinati in ordine cronologico inverso e con la data nel nome nel formato anno-mese-giorno, come già fatto. Ogni modifica deve avvenire su un proprio branch, con pull request su GitHub e verifica da parte di un incaricato prima del merge su main; resta da chiarire se farlo anche per la documentazione. Resta aperto anche il dubbio se ogni documento debba avere un proprio registro delle modifiche, distinto dai commit di Git: per i verbali sembra poco sensato, ma per glossario e analisi dei requisiti sì. Si cercheranno esempi di progetti degli anni passati per chiarire entrambi i punti.

La candidatura richiede la scelta del capitolato, il resoconto degli incontri con il proponente, le motivazioni della scelta con la valutazione di tutti i capitolati e il preventivo. La scadenza è venerdì 30/10/2026.

== Scelta del capitolato e alternative
Il capitolato C3 (FossDot) resta il candidato principale. Poiché finora è stato svolto un solo incontro con un proponente, si è deciso di chiedere un colloquio anche a un'altra azienda, così da dimostrare di non aver valutato un solo capitolato. È stato indicato come possibile riserva il C7 (dashboard di business intelligence collegata a una data factory, senza componenti hardware, con un'azienda descritta come molto reattiva).

== Valutazione dei capitolati e preventivo
La valutazione deve riguardare tutti i capitolati, con un'analisi per ciascuno e l'indicazione di quello selezionato; vale anche per quelli scartati. Il lavoro è diviso in due metà, capitolati da 0 a 4 e da 5 a 9, in una cartella dedicata su GitHub con un file già predisposto con tutte le sezioni, in modo da evitare conflitti. Si può partire da una sintesi preliminare dei PDF dei capitolati, da rielaborare e verificare prima di includerla. I due sottogruppi che si occupano di valutazione e preventivo si verificheranno a vicenda.

Per il preventivo occorre dichiarare le ore per ruolo, con costi diversi per ciascun ruolo, entro i minimi e i massimi indicati dalle slide del corso, e una data di consegna prevista, di cui viene valutata la ragionevolezza. Orientativamente, dalle assegnazioni degli anni scorsi i gruppi da sei persone si collocano intorno ai 10-11 mila euro. Ci si procurerà la documentazione di un progetto passato per confrontare le ore.

== Lettera di presentazione
La lettera è indirizzata ai committenti e deve essere breve (circa due pagine): di fatto un assemblaggio dei due documenti principali, valutazione dei capitolati e preventivo, a cui rimanda. La struttura concordata comprende l'intestazione con la presentazione del gruppo, la motivazione della scelta del capitolato, ricavata dalla valutazione, e un'idea di costi e di data di consegna, con la timeline contenuta nel preventivo. Si potrà accennare all'organizzazione su GitHub. Una persona redigerà la bozza e il gruppo la completerà insieme nell'ultimo incontro prima della consegna.

== Organizzazione del lavoro
Il lavoro è stato suddiviso a coppie. Ciascuno lavora su un proprio branch e apre una pull request; i documenti saranno presentati e approvati insieme prima della consegna, così da metterlo a verbale. Alcuni componenti saranno parzialmente indisponibili tra il 28 e il 31/10: non serve che siano presenti tutti, è sufficiente che partecipino gli incaricati di ciascun documento, tenendosi in contatto con gli altri. Il verbalizzante pubblicherà su Discord un riepilogo dei compiti.

= Decisioni
#decisioni(
  [Incontro interno settimanale fisso il lunedì alle 15:00 su Discord, con incontri aggiuntivi se necessario.],
  [Tutta la documentazione sarà scritta in Typst.],
  [Il capitolato C3 è il candidato principale; il C7 è un'eventuale riserva, da non approfondire per ora.],
  [Richiedere un colloquio a un'altra azienda proponente, per documentare di aver valutato più capitolati.],
  [Valutazione di tutti i capitolati suddivisa in due metà (0-4 e 5-9) in una cartella dedicata su GitHub, con verifica incrociata.],
  [Il lavoro procede su branch separati con pull request e verifica prima del merge.],
  [La lettera di presentazione avrà come struttura intestazione, motivazioni della scelta e idee di costi, e rimanderà a valutazione dei capitolati e preventivo.],
)

= Attività da svolgere
#azioni(
  ([Redigere il verbale della riunione e pubblicare su Discord il riepilogo dei compiti], [Francesco Bassani], [28/10/2026]),
  ([Chiedere un colloquio a un'altra azienda proponente], [Matilde Pedrocchi], [30/10/2026]),
  ([Valutazione dei capitolati da 0 a 4 (bozza)], [Alessandro Ravenna], [28/10/2026]),
  ([Valutazione dei capitolati da 5 a 9 (bozza)], [Francesco Bassani], [28/10/2026]),
  ([Preventivo dei costi per il capitolato C3 (bozza, con stima di ore e costi per ruolo)], [Alessandro Zanier, Andrea Nogara], [28/10/2026]),
  ([Setup del sito web per la documentazione], [Alessandro Zanier], [Da definire]),
  ([Lettera di presentazione: intestazione, motivazioni della scelta del capitolato, idee di costi], [Da assegnare], [30/10/2026]),
)

= Prossima riunione
Mercoledì 28/10/2026 alle 16:00, su Discord. Il successivo incontro fisso è lunedì 2/11/2026 alle 15:00. La candidatura va consegnata entro venerdì 30/10/2026.
