#import "/templates/verbale-interno.typ": *

#show: verbale-interno.with(
  numero: "VI-2026-10-28",
  data: "28/10/2026",
  ora-inizio: "16:00",
  ora-fine: "16:22",
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
+ Stato dei documenti: verbali, valutazione dei capitolati e sito web
+ Lettera di presentazione e modalità di consegna
+ Ripartizione delle ore tra i ruoli
+ Data di consegna prevista
+ Ripartizione dei compiti e prossimo incontro

= Resoconto
== Stato dei documenti
Il template dei verbali interni è considerato a posto. Il template dei verbali esterni verrà reso analogo a quello interno e, di conseguenza, verrà riscritto anche il verbale dell'incontro con l'azienda proponente; il lavoro è previsto tra oggi e domani.

La valutazione dei capitolati è completa in entrambe le metà. Resta solo da uniformare lo stile dei titoli, che in una metà usano i due punti e nell'altra il trattino. Il gruppo ha convenuto di sistemarlo perché una documentazione omogenea evita possibili osservazioni su nomi e coerenza; i due autori lo faranno subito dopo la riunione.

== Sito web della documentazione
Il sito non mostra ancora la valutazione dei capitolati. Al momento tutti i documenti sono raccolti in un'unica sezione; si intende suddividerli per fase (candidatura, RTB, PB), come fanno altri gruppi, e riordinare la struttura delle cartelle del repository, oggi un po' disordinata a livello radice. Per aggiungere un nuovo documento è sufficiente modificare un file di configurazione, quindi ciascuno potrà pubblicare in autonomia. Chi cura il sito lo sistemerà in serata e comunicherà al gruppo la procedura da seguire.

== Lettera di presentazione
La scadenza primaria è venerdì 30/10/2026 alle 17:00. La lettera va inviata via email al professore, non all'azienda proponente, perché è il professore ad assegnare i gruppi ai capitolati. Nella email basta indicare un unico link al sito web del gruppo, dove è raccolta tutta la documentazione, senza allegare i singoli file.

Poiché la lettera rimanda agli altri documenti, questi devono essere pronti prima: la valutazione dei capitolati, il preventivo dei costi con la dichiarazione degli impegni e i verbali. Uno scheletro della lettera è già stato avviato; la struttura risulta molto standard, con formule ricorrenti. La bozza sarà caricata subito dopo la riunione, il gruppo la revisionerà insieme e la invierà preferibilmente già venerdì mattina, senza attendere l'ultimo momento.

== Accesso a GitHub da riga di comando
Un componente non riesce a fare il push da WSL e riceve l'errore 401, perché GitHub non accetta più l'autenticazione con nome utente e password. Sono state indicate due soluzioni: installare il client di GitHub (GitHub CLI) ed effettuare l'accesso con esso, oppure configurare l'accesso tramite chiave SSH. In caso di difficoltà il componente chiederà aiuto in messaggio privato.

== Ripartizione delle ore tra i ruoli
Nei preventivi dei gruppi degli anni passati la ripartizione delle ore tra programmatore e verificatore è spesso paritaria. Il gruppo ha discusso come intendere i due ruoli. Poiché la scrittura del codice non è più interamente manuale, l'impegno del programmatore viene esteso a una prima verifica del proprio codice; la verifica svolta dal verificatore è quindi più leggera, ma comprende comunque la scrittura dei test e il controllo che la copertura del codice raggiunga la soglia stabilita. Il verificatore scrive quindi anche una parte di codice e il suo carico resta significativo, anche se inferiore a quello del programmatore. Per questo si è concordato un rapporto di 1 ora di programmatore ogni 0,75 ore di verificatore, evitando sia la parità sia un peso trascurabile del verificatore.

Ogni componente dovrà dedicare al progetto un monte ore individuale compreso tra 85 e 95 ore, senza poter superare il limite massimo. Si assume come tetto individuale circa 95 ore, da dividere poi tra i vari ruoli secondo il rapporto concordato. Il costo complessivo del preventivo dovrà inoltre superare la soglia minima prevista dal committente; è stata ricordata una cifra di circa 12.000 €, da verificare sul documento di riferimento. Nel preventivo sarà inserita una breve sezione che motiva il rapporto adottato, riportando le considerazioni emerse in questa riunione.

== Data di consegna prevista
Dai documenti di altri gruppi risulta che si calcolano di norma 20 settimane a partire dalla data di aggiudicazione del capitolato, con al massimo qualche giorno aggiuntivo. Il gruppo ha scelto di indicare 21 settimane. Con l'aggiudicazione prevista per il 3/11/2026, la consegna cade indicativamente a fine marzo 2027. È stato osservato che un lieve scostamento dal termine potrebbe essere tollerato, ma l'intenzione del gruppo è comunque consegnare prima. La timeline di 21 settimane sarà riportata nel preventivo e richiamata nella lettera di presentazione.

== Organizzazione del lavoro
La bozza del preventivo è a circa tre quarti; mancavano la ripartizione delle ore tra i ruoli, ora definita, e la stima dei costi. Il preventivo verrà completato il prima possibile, così da scrivere la lettera di presentazione appena disponibili entrambi i documenti. L'incontro per la bozza della lettera è fissato per domani alle 15:00 (valutata anche l'ipotesi delle 14:30, ma 15:00 va bene a tutti). Un componente non potrà partecipare, perché impegnato fino a circa le 20:10, ma leggerà in serata quanto scritto e darà il proprio parere per iscritto.

= Decisioni
#decisioni(
  [La ripartizione delle ore tra i ruoli adotta il rapporto di 1 ora di programmatore ogni 0,75 ore di verificatore, motivato nel preventivo con una breve sezione dedicata.],
  [Il monte ore individuale ha come tetto circa 95 ore (intervallo 85-95), da suddividere tra i ruoli secondo il rapporto concordato.],
  [La consegna è prevista a 21 settimane dalla data di aggiudicazione del capitolato (aggiudicazione prevista il 3/11/2026, consegna indicativamente a fine marzo 2027).],
  [La lettera di presentazione è inviata via email al professore, con un unico link al sito web del gruppo che raccoglie la documentazione, entro venerdì 30/10/2026 alle 17:00, preferibilmente al mattino.],
  [Gli stili dei titoli della valutazione dei capitolati sono uniformati.],
  [I documenti sul sito sono suddivisi per fase (candidatura, RTB, PB) e la struttura delle cartelle del repository è riordinata.],
  [Il template dei verbali esterni è reso analogo a quello dei verbali interni e il verbale dell'incontro con l'azienda è riscritto di conseguenza.],
  [Domani, 29/10/2026 alle 15:00 su Discord, il gruppo si riunisce per completare la bozza della lettera di presentazione.],
)

= Attività da svolgere
#azioni(
  ([Uniformare lo stile dei titoli della valutazione dei capitolati], [Alessandro Ravenna, Francesco Bassani], [28/10/2026]),
  ([Completare il preventivo: ripartizione delle ore tra i ruoli, costi, timeline di 21 settimane e sezione che motiva il rapporto tra programmatore e verificatore], [Alessandro Zanier, Andrea Nogara], [29/10/2026]),
  ([Sistemare il sito: aggiungere la valutazione dei capitolati, suddividere i documenti per fase, riordinare le cartelle e spiegare al gruppo come pubblicare], [Alessandro Zanier], [28/10/2026]),
  ([Adeguare il template dei verbali esterni a quello interno e riscrivere il verbale dell'incontro con l'azienda], [Da indicare], [29/10/2026]),
  ([Caricare la bozza della lettera di presentazione con i link ai documenti], [Da indicare], [28/10/2026]),
  ([Redigere e caricare il verbale della riunione], [Francesco Bassani], [28/10/2026]),
  ([Revisionare insieme la bozza della lettera di presentazione], [Tutti], [29/10/2026]),
  ([Inviare la lettera di presentazione al professore], [Da indicare], [30/10/2026]),
)

= Prossima riunione
Giovedì 29/10/2026 alle 15:00, su Discord, per completare la bozza della lettera di presentazione. Il successivo incontro fisso è lunedì 2/11/2026 alle 15:00. La candidatura va consegnata entro venerdì 30/10/2026 alle 17:00.
