#import "/templates/verbale-esterno.typ": *

#show: verbale-esterno.with(
  numero: "VE-2026-11-13",
  azienda: "Zucchetti",
  data: "13/11/2026",
  ora-inizio: "16:00",
  ora-fine: "16:58",
  luogo: "Online (Zoom)",
  oggetto: "Primo incontro di chiarimento sul capitolato",
  verbalizzante: "Alessandro Ravenna",
  presenti-interni: ("Alessandro Ravenna", "Andrea Nogara", "Alessandro Zanier", "Matilde Pedrocchi", "Francesco Bassani"),
  assenti-interni: ("Matteo Angelini",),
  presenti-esterni: ("Gregorio Piccoli",),
)

= Ordine del giorno
+ Incontri e comunicazione con l'azienda
+ Progetto di riferimento su cui testare il prodotto
+ Ripartizione delle verifiche tra LLM e sistema deterministico
+ Flessibilità nella scelta delle tecnologie
+ Accesso ai modelli LLM e scelta dell'agent harness
+ Dimostrazione del flusso di lavoro con OpenCode e OpenSpec
+ Integrazione dei casi d'uso nel flusso di specifica
+ Prossimi passi

= Resoconto
== Incontri e comunicazione con l'azienda
Il referente ha ricordato le tappe del progetto: prima la presentazione dei requisiti raccolti (documenti e casi d'uso, senza sviluppo), poi il POC (proof of concept), che serve a verificare la fattibilità delle parti previste, infine l'MVP (minimum viable product). Prima di ogni revisione con i docenti il gruppo deve obbligatoriamente confrontarsi con l'azienda, per verificare che il lavoro svolto corrisponda alle aspettative. Se si sospettano discrepanze rispetto a quanto discusso, è bene sentirsi in anticipo. Per il resto gli incontri si fissano quando il gruppo ne ha bisogno, cioè quando incontra dubbi che non riesce a risolvere da solo. Il primo contatto avviene via mail; per le riunioni vanno bene Zoom, Google Meet o altre piattaforme a scelta del gruppo.

== Progetto di riferimento su cui testare il prodotto
L'azienda non fornisce un progetto di prova. Il gruppo può usare un qualsiasi progetto ben documentato, anche uno proprio realizzato per altri corsi, purché abbia casi d'uso, diagrammi UML e specifiche un minimo formali. In alternativa il referente può fornire un progetto didattico dell'Università di Pisa completo di casi d'uso.

== Ripartizione delle verifiche tra LLM e sistema deterministico
Non è stabilita a priori: per l'azienda è una domanda di ricerca, e la risposta è attesa come risultato del progetto. Secondo il referente l'LLM è molto interessante, ma serve una forte verifica formale: l'LLM non è deterministico e, davanti a una specifica ambigua, tende a scioglierla con interpretazioni proprie. Il punto di partenza più promettente è tracciare come un caso d'uso si ritrova all'interno di un requisito.

== Flessibilità nella scelta delle tecnologie
Il gruppo può scegliere liberamente linguaggi e tecnologie (Python, TypeScript, JavaScript, Java, C\#, C++ ecc.), privilegiando quelli con cui ha più dimestichezza, così che la tecnologia non diventi un ostacolo al lavoro.

== Accesso ai modelli LLM e scelta dell'agent harness
L'azienda consiglia OpenCode come agent harness, che include già modelli gratuiti di buona qualità; trattandosi di codice senza segreti industriali, il loro uso non crea problemi. Su richiesta l'azienda può fornire una chiave d'accesso, con limiti di utilizzo, ai modelli open source (es. Qwen, Gemma) che gira sulle proprie GPU. La compatibilità con altri harness non è richiesta e la scelta spetta al gruppo.

== Dimostrazione del flusso di lavoro con OpenCode e OpenSpec
Il referente ha mostrato un'applicazione di prova generata interamente con OpenCode e OpenSpec, usando un modello GLM in esecuzione sui server aziendali. Il flusso mostrato è stato questo:
+ Proposta (`opsx propose`): a partire da una richiesta in linguaggio naturale, OpenSpec genera una cartella di modifica con proposta ampliata, requisito, design (analisi del codice, punti da modificare, rischi) ed elenco dei task.
+ Applicazione (`opsx apply`): l'agente esegue i task e applica la modifica al codice.
+ Archiviazione: la modifica viene archiviata con la data e le specifiche vengono sincronizzate nella cartella delle specifiche consolidate.
Il referente ha sottolineato il limite di questo flusso: mancano i casi d'uso e il formalismo. Proposta e design sono scritti in linguaggio naturale e quindi non sono verificabili; il risultato è controllato dai test, ma non da una verifica formale che confermi la modifica delle parti di codice previste.

== Integrazione dei casi d'uso nel flusso di specifica
L'azienda vorrebbe che proposte e specifiche includessero i casi d'uso, possibilmente accompagnati da un diagramma (PlantUML, PNG o anche ASCII art). Il percorso ideale prevede di raccogliere i casi d'uso in un documento, richiamarli nelle proposte e poter verificare quali sono già coperti da una specifica e quali no. In questo modo ogni requisito entra in un percorso tracciabile. Potrebbe essere utile anche una skill che controlli che gli interventi sul codice (es. i commit su Git) tocchino effettivamente le parti previste.

== Prossimi passi
Il gruppo svolgerà alcune prove con OpenCode e OpenSpec usando esempi propri, cercando di integrare i casi d'uso nel flusso. Successivamente fisserà un nuovo incontro con l'azienda per approfondire con domande più precise.
