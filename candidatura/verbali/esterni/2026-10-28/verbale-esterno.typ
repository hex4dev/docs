#import "/templates/verbale-esterno.typ": *

#show: verbale-esterno.with(
  numero: "VE-2026-10-28",
  azienda: "Ergon",
  data: "28/10/2026",
  ora-inizio: "14:00",
  ora-fine: "14:20",
  luogo: "Online (Microsoft Teams)",
  oggetto: "Incontro esplorativo",
  verbalizzante: "Matilde Pedrocchi",
  presenti-interni: ("Francesco Bassani", "Matteo Angelini", "Matilde Pedrocchi", "Alessandro Ravenna"),
  assenti-interni: ("Alessandro Zanier", "Andrea Nogara"),
  presenti-esterni: ("Gianluca Carlesso",),
)

= Ordine del giorno
+ Priorità tra piattaforma BI e funzionalità AI  
+ Gestione delle chiamate API e dei relativi limiti
+ Scelta dei modelli IA e sconsigliabilità delle versioni offline
+ Politiche di privacy e minimizzazione dei dati inviati ai modelli
+ Modalità di fornitura dei dati tramite dump di testo e separazione dal gestionale
+ Condivisione dei report tramite PDF o Excel
+ Eventuale integrazione con un server MCP dedicato
+ Flessibilità nella scelta delle tecnologie
+ Validazione e coerenza delle risposte LLM
+ Incontri e comunicazione con l'azienda

= Resoconto
== Priorità tra piattaforma BI e funzionalità AI
Si è discusso se dare priorità a una piattaforma AI più ricca di funzionalità o a una base più solida. È stato stabilito di puntare inizialmente su una piattaforma BI solida, introducendo i layer di intelligenza artificiale in un secondo momento.
== Chiamate API e limiti
Le chiamate API verranno effettuate quando necessario per ottenere la risposta dal modello, senza imporre limiti rigidi a prescindere. L'impostazione di limiti orari può essere utile ma non essenziale. L'azienda fornirà apposite chiavi di licenza con credito.
== Scelta dei modelli di AI
Sono raccomandati i modelli ChatGPT o Claude, le cui prestazioni sono analoghe e la cui selezione è a discrezione del gruppo. È stato fortemente sconsigliato l'utilizzo di versioni locali dei modelli, a causa dei requisiti hardware elevati e delle tempistiche del progetto.   
== Privacy e gestione dei dati
L'utilizzo di chiavi di licenza aziendali garantisce che i provider non impieghino i dati inviati per l'addestramento dei propri modelli. Gli utenti finali saranno consapevoli della condivisione esterna tramite API. I dati inviati al modello dovranno essere strettamente necessari a soddisfare la specifica richiesta dell'utente.   
== Metodo di fornitura dei dati
I dati necessari per lo sviluppo della piattaforma saranno forniti tramite un dump contenente dati di testo. Questa attività di sviluppo rimarrà distaccata dal gestionale vero e proprio.   
== Metodi di condivisione
Non è prevista una condivisione diretta tra account per la visualizzazione dei dati. È sufficiente l'esportazione dei risultati in formato PDF o Excel. Ciascun utente disporrà delle proprie dashboard di visualizzazione e di permessi specifici sui dati accessibili.
== Integrazione con server MCP
L'integrazione con un server MCP dedicato non è attualmente inclusa nel capitolato. Viene considerata un'opzione interessante da valutare in corso d'opera in base alle tempistiche e alle possibilità del progetto.
== Tecnologie
Non sussistono vincoli tassativi e a prescindere sulle tecnologie da utilizzare. È stata espressa una preferenza iniziale per DuckDB sul data warehouse, ma non costituisce un vincolo stringente.   
== Coerenza delle risposte LLM
Non esiste un metodo deterministico predefinito per validare la coerenza delle risposte generate dai modelli. Si procederà creando test case empirici, fornendo un prompt iniziale e conducendo una valutazione qualitativa della risposta prodotta.   
== Organizzazione degli incontri
È prevista una riunione fissa a cadenza quindicinale. Il team aziendale resta disponibile per incontri di supporto aggiuntivi da concordare e per comunicazione tramite email, WhatsApp o Telegram.