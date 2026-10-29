#import "/templates/verbale-esterno.typ": *

#show: verbale-esterno.with(
  numero: "VE-2026-10-21",
  azienda: "Uranion",
  data: "21/10/2026",
  ora-inizio: "14:30",
  ora-fine: "16:00",
  luogo: "Online (Zoom)",
  oggetto: "Incontro esplorativo",
  verbalizzante: "Matilde Pedrocchi",
  presenti-interni: ("Francesco Bassani", "Alessandro Ravenna", "Alessandro Zanier", "Matteo Angelini", "Matilde Pedrocchi"),
  assenti-interni: ("Andrea Ravenna", ),
  presenti-esterni: ("Giacomo Cariello",),
)

= Ordine del giorno
+ Modalità di incontro e supporto
+ Selezione dell'hardware
+ Gestione di dispositivi multipli e wake word
+ Priorità delle caratteristiche
+ Dashboard
+ Utilizzo di servizi esterni, LLM locali e sviluppo di skill
+ Aspetto estetico del prodotto
+ Interoperabilità

= Resoconto della discussione

== Incontri e Supporto
Sono previsti incontri di allineamento bisettimanali per domande di consulto e chat di progetto su Mattermost. Quando si avrà l’oggetto fisico a disposizione si potranno organizzare workshop in presenza in caso di necessità. La sede a Piove di Sacco non è ancora operativa, ma è possibile noleggiare una sala o farsi ospitare
dall’Università di Padova. 

Il supporto non è delineato in modo rigido ma definito a seconda dei
bisogni

== Selezione dell'hardware
Il materiale hardware viene fornito dall'azienda, con l'accortezza di rimanere entro un certo budget, ma la scelta è a carico del gruppo con una certa libertà, rappresentando essa stessa uno scopo del progetto. Una selezione più economica permette di acquistare materiale per più dispositivi. È preferibile orientarsi su hardware compatibile con Linux o Android. La quantità e qualità della documentazione disponibile sono un criterio da tenere a mente durante la selezione.

== Dispositivi multipli e wake word
Sarebbe utile trovare un metodo per evitare la competizione tra dispositivi multipli che ascoltano lo stesso comando, sebbene si tratti di una caratteristica desiderabile ma non essenziale. Il rilevamento della wake word deve invece avvenire obbligatoriamente in locale.

== Priorità delle caratteristiche
Occorre assegnare diverse priorità alle caratteristiche valutandone la complessità tecnica caso per caso. È preferibile avere poche funzionalità ma fatte bene piuttosto che molte abbozzate. 

== Dashboard
Non è necessaria un'app dedicata, ma è ben accettata un'interfaccia responsive, multiutente, multidispositivo e con gestione di case diverse. Non è necessario fare un onboarding complesso come fa ad esempio Alexa.

== Servizi esterni
L'accesso a servizi esterni (Chiavi API, account dedicati, risorse cloud) verrà messo a disposizione purché ragionevole in termini di costi e aderenza al progetto. 

== LLM locali
L'uso di un LLM locale è una possibilità da valutare in base a hardware e costi (Ad esempio il supporto a Ollama), partendo prima da casi semplici e comuni. 

== Skill
La creazione di uno standard per skill personalizzate è incoraggiata ma non prioritaria, lasciando piena libertà in base al tempo disponibile per garantire un progetto funzionante.

== Aspetto
È possibile curare l'estetica del contenitore esterno dell'oggetto (Ad esempio facendo disegni o CAD per poi stamparlo in 3D), pur non rappresentando il punto di partenza del progetto.

== Interoperabilità
È utile abilitare la comunicazione tra più dispositivi FossDot.