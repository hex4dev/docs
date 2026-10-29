#import "/templates/verbale-interno.typ": *

#show: verbale-interno.with(
  numero: "VI-2026-10-29",
  data: "29/10/2026",
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
  ),
  assenti: ("Alessandro Zanier",),
)

= Ordine del giorno
+ Revisione e completamento della lettera di presentazione
+ Rotazione dei ruoli nel preventivo
+ Modalità di invio della lettera e raccolta dei verbali firmati
+ Organizzazione della repository e del sito web
+ Verbali richiesti per la candidatura
+ Esito dell'assegnazione e prossimi passi

= Resoconto
== Revisione della lettera di presentazione
La priorità dell'incontro era completare la lettera di presentazione, in modo da poterla inviare domani. Matteo Angelini aveva già impostato lo scheletro su un proprio branch: le formule risultano di rito ed erano già state raccolte, con la specifica degli elementi da indicare. Il gruppo ha quindi esaminato il documento e concordato come completarlo.

Il capitolato scelto è indicato con numero, nome e azienda proponente (C3, FossDot, proposto da Uranion). La lettera riporta poi i link alla repository e al sito della documentazione, l'elenco dei documenti con il relativo collegamento (valutazione dei capitolati, preventivo con assunzione di impegni, verbali interni ed esterni) e, in chiusura, il costo stimato di 11.040 € con data di consegna prevista il 26/03/2027.

Nelle lettere di altri gruppi alcune riportano solo il link alla radice della repository e altre i link ai singoli file; si è scelto di inserire entrambi. Il link alla repository è stato ritenuto utile in particolare perché il sito potrebbe non essere sempre aggiornato con le voci più recenti. Poiché i PDF compilati non sono ancora disponibili online, i collegamenti ai documenti puntano per ora ai sorgenti Typst. È rimasto un dubbio sulla visibilità della repository, che qualcuno ricordava pubblica ma che risulta teoricamente privata: va verificato che il professore possa accedervi.

== Rotazione dei ruoli e preventivo
Durante la revisione del preventivo ci si è chiesti se stabilire in anticipo la rotazione dei ruoli o deciderla più avanti con l'azienda. Dal documento di feedback del professore sulle candidature dello scorso anno è emerso che a un gruppo l'aggiudicazione era stata sospesa in attesa di integrazioni: la sezione sulla distribuzione del tempo e dei ruoli era incompleta, perché mancavano le regole iniziali di rotazione e la tabella di ripartizione delle ore per persona. Le regole iniziali sono quindi necessarie, ma potranno essere modificate in seguito insieme all'azienda.

Il gruppo ha deciso una regola semplice: i ruoli ruotano ogni due settimane e a ogni rotazione ciascun componente avanza di un ruolo secondo l'ordine della tabella presente nel preventivo. Tale tabella riporta, per ogni ruolo, le ore previste per ciascuna persona, le ore totali, il costo orario e il costo totale. I ruoli non sono ancora stati assegnati ai singoli componenti. Il preventivo è stato poi sistemato e integrato nel ramo principale durante la riunione, con un costo totale stimato di 11.040 €. La data di consegna prevista è il 26/03/2027, calcolata su 20 settimane più qualche giorno.

== Invio della lettera
La lettera va consegnata entro venerdì 30/10/2026; è emerso che non sono ammessi allegati. Il gruppo ha quindi deciso di inviare al professore un messaggio con i link alla lettera e alla documentazione, senza allegare file. Matilde Pedrocchi si è resa disponibile a inviarlo dopo l'integrazione delle ultime modifiche, valutando se riportare anche il testo della lettera nel corpo del messaggio. Se il sito fosse già pienamente operativo sarebbe bastato inviare il solo link al sito, ma per ora non compila ancora tutti i documenti.

== Verbali firmati dalle aziende
Le aziende restituiranno i verbali degli incontri esterni, probabilmente in PDF, e occorre capire come pubblicarli sul sito. Si era pensato a una cartella dedicata ai verbali firmati; il gruppo ha invece convenuto di inserire ciascun PDF nella stessa cartella del relativo sorgente Typst, come fanno molte repository di altri gruppi. Matilde Pedrocchi, che segue i contatti con le aziende, li inserirà appena ricevuti, probabilmente uno per ciascun incontro esterno.

== Organizzazione della repository e del sito
Alessandro Zanier ha organizzato la repository in modo che nella cartella candidatura si trovi tutta la documentazione della candidatura, compresi i verbali, che ha senso tenere distinti da quelli delle fasi successive. Il branch di Matteo Angelini usava un nome non allineato alle convenzioni del gruppo: è stato quindi creato un nuovo branch con un nome corretto, che contiene la sola lettera di presentazione, collocata nella cartella dedicata dentro candidatura; i vecchi branch vengono abbandonati. La lettera è stata aggiunta tramite pull request e approvata da un altro componente; una seconda pull request ha corretto il commento iniziale del file, che riportava un percorso di compilazione non più valido, ed è stata approvata a sua volta.

Si è osservato che la dichiarazione degli impegni, a differenza degli altri documenti, si trova fuori dalla cartella candidatura. Poiché la lettera la richiama con un link diretto, un eventuale spostamento andrà coordinato con l'aggiornamento di tale link.

Il sito non compila ancora la lettera di presentazione né i PDF in genere. Per questa volta il PDF della lettera sarà compilato manualmente; in seguito si vuole automatizzare la compilazione e la pubblicazione dei documenti. Si è inoltre proposto, senza urgenza, di rendere disponibili i PDF compilati a ogni commit o pull request, per avere un'anteprima immediata di ciò che va sistemato. Sorgenti e PDF compilati possono convivere nella stessa cartella. Se ne occuperà Francesco Bassani.

== Verbali richiesti per la candidatura
Sono richiesti i verbali di tutte le riunioni svolte prima dell'invio dei documenti: una riunione interna fatta dopo la consegna non richiederebbe verbale, mentre quella di oggi, che precede la consegna di domani, sì. Il verbale di oggi sarà redatto da Francesco Bassani; poiché la lettera è stata scritta prima della riunione, non è stato ritenuto necessario aggiungerlo all'elenco in essa riportato.

== Esito dell'assegnazione
Martedì 3/11/2026, a lezione, saranno pubblicati i risultati dell'assegnazione. La valutazione dei capitolati indica già un secondo capitolato (C7), per cui non dovrebbero esserci obiezioni del professore. La disponibilità di posti sul C7 non è confermata. Sul C3 risultano al momento più prime scelte dei posti disponibili (tre per due posti), ma è ormai tardi per cambiare strada e il gruppo conferma la candidatura sul C3. In caso di mancata assegnazione si procederà con l'alternativa.

== Diario di bordo
Resta da redigere il diario di bordo del 2/11/2026, elencando quanto fatto e quanto programmato; non è un lavoro impegnativo, perché per ora non resta molto da fare se non attendere i verbali firmati e l'esito dell'assegnazione.

= Decisioni
#decisioni(
  [La lettera di presentazione indica numero, nome e azienda del capitolato scelto (C3, FossDot, Uranion), i link alla repository e al sito, l'elenco dei documenti con i relativi link, il costo stimato di 11.040 € e la data di consegna prevista del 26/03/2027.],
  [Nella lettera si inseriscono sia il link alla repository sia i link diretti ai singoli documenti, per ora puntando ai sorgenti Typst.],
  [I ruoli ruotano ogni due settimane e a ogni rotazione ciascun componente avanza di un ruolo secondo l'ordine della tabella dei ruoli del preventivo; le regole iniziali potranno essere modificate con l'azienda.],
  [La lettera è inviata al professore via email, senza allegati, con i link alla documentazione, entro venerdì 30/10/2026.],
  [I PDF dei verbali firmati dalle aziende sono inseriti nella stessa cartella del relativo sorgente.],
  [La lettera di presentazione si trova in una cartella dedicata dentro candidatura; il branch originale di Matteo Angelini è abbandonato.],
  [Il verbale di oggi va redatto perché la riunione precede la consegna dei documenti.],
  [Il gruppo conferma la candidatura sul C3, con il C7 come alternativa già indicata nella valutazione dei capitolati.],
)

= Attività da svolgere
#azioni(
  ([Verificare che la repository sia accessibile al professore], [Matilde Pedrocchi], [30/10/2026]),
  ([Inviare la lettera di presentazione al professore, con i link alla documentazione], [Matilde Pedrocchi], [30/10/2026]),
  ([Compilare il PDF della lettera di presentazione e renderlo disponibile sul sito], [Francesco Bassani], [30/10/2026]),
  ([Inserire nelle cartelle dei verbali esterni i PDF firmati dalle aziende, appena ricevuti], [Matilde Pedrocchi], [Alla ricezione]),
  ([Automatizzare la compilazione e la pubblicazione dei PDF sul sito, con anteprima per ogni pull request], [Francesco Bassani], [Da definire]),
  ([Redigere e pubblicare il verbale della riunione], [Francesco Bassani], [29/10/2026]),
  ([Redigere il diario di bordo del 2/11/2026], [Da indicare], [02/11/2026]),
)

= Prossima riunione
Lunedì 2/11/2026 alle 15:00, su Discord, come da incontro fisso settimanale. Martedì 3/11/2026, a lezione, sono attesi i risultati dell'assegnazione. La lettera di presentazione va inviata entro venerdì 30/10/2026 alle 17:00.
