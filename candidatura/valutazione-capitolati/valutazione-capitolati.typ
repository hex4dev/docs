// ============================================================
//  Valutazione Capitolati - candidatura del gruppo hex4dev
//
//  Compilazione dalla root del repository:
//    typst compile --root . valutazione-capitolati/valutazione-capitolati.typ
//
//  Ripartizione della scrittura (riunione del 26/10/2026):
//    - capitolati C0-C4: Alessandro Ravenna
//    - capitolati C5-C9: Francesco Bassani
//  Ogni scheda ha le stesse sezioni, da compilare al posto dei
//  segnaposto #todo[...] (evidenziati in giallo nel PDF).
// ============================================================

#import "/templates/documento.typ": documento, todo

#show: documento.with(
  titolo: "Valutazione Capitolati",
  sottotitolo: "Candidatura · Anno accademico 2026/2027",
  numero-gruppo: "14",
  versione: "0.2",
  data: "27/10/2026",
  redattori: ("Francesco Bassani", "Alessandro Ravenna"),
  verificatori: ("Alessandro Zanier", "Andrea Nogara"),
  registro: (
    ("0.2", "27/10/2026", "Francesco Bassani", "Alessandro Zanier, Andrea Nogara", "Valutazione dei capitolati da C5 a C9"),
    ("0.1", "27/10/2026", "Francesco Bassani", "—", "Creazione dello scheletro del documento"),
  ),
)

= Introduzione

== Scopo del documento
Questo documento presenta l'analisi dei capitolati d'appalto proposti per il progetto di Ingegneria del Software e le motivazioni che hanno portato il gruppo Hex4dev a candidarsi per uno di essi.

== Metodo di valutazione
Tutti i capitolati, da C0 a C9, sono descritti con la stessa scheda, in modo da poterli confrontare: informazioni generali, breve descrizione, aspetti positivi, criticità e valutazione finale.

= Analisi dei capitolati
Di seguito l'analisi dei dieci capitolati, da C0 a C9.


== C0 – AIRA

=== Informazioni generali
- *Titolo:* AIRA: AI Requests Automation
- *Proponente:* Sanmarco Informatica SPA
- *Referente:* Linda Benozzato, Luca Marcon, Alberto Veronese

=== Breve descrizione
Strumento multimodale basato su intelligenza artificiale che automatizza la gestione delle richieste dei clienti in ambito B2B (ordini, ticket di assistenza, appuntamenti, documenti contabili), oggi disperse tra e-mail con allegati PDF, note vocali WhatsApp, messaggi informali e foto di etichette e cataloghi. Il sistema monitora i canali, trascrive l'audio con speech-to-text, legge immagini e documenti con OCR, interpreta il contenuto con un LLM e lo trasforma in dati strutturati secondo template per tipologia. Le azioni risultanti partono in automatico come chiamate API REST verso portali B2B, ERP, CRM o ticketing, oppure come e-mail. È richiesta un'interfaccia amministrativa web per configurare i canali, consultare i log e gestire la persistenza; sono opzionali una dashboard analitica e le risposte automatiche al mittente.

=== Aspetti positivi
- Obiettivi e funzionalità ben delimitati: requisiti obbligatori e opzionali distinti, uno scenario d'uso concreto (monitoraggio di una casella e-mail e creazione dell'ordine tramite API REST) e un'architettura di riferimento, con raccomandazioni esplicite su modularità, scalabilità e test.
- Tema attuale e formativo: LLM, OCR e speech-to-text applicati a un problema aziendale reale, senza addestrare modelli, con orchestrazione tramite LangChain4j e integrazione con sistemi gestionali via API REST.
- Tecnologie consigliate chiare e documentate, con risorse indicate per ogni area (Java con Spring Boot, Angular e TypeScript, SQLite, MariaDB o PostgreSQL, Whisper, Tesseract, EasyOCR), tutte note e diffuse.
- Proponente strutturato e presente: tre referenti dedicati, metodologia Agile, supporto tecnico, assistenza nel setup degli ambienti e guida nella risoluzione delle criticità.

=== Criticità
- Ambito ampio: la pipeline deve gestire più canali (e-mail, WhatsApp, filesystem), trascrizione audio, OCR, interpretazione con LLM, filtro di sicurezza e integrazioni REST, oltre all'interfaccia amministrativa e ai test di unità e integrazione.
- Le integrazioni con ERP, CRM e portali B2B non sono descritte nel dettaglio: servirebbero API di prova o simulatori, e il capitolato non indica con quali sistemi reali ci si dovrà interfacciare.
- L'affidabilità dell'output degli LLM (ad esempio nella mappatura delle descrizioni sui codici articolo del catalogo) va gestita e verificata, e il filtro di ingresso deve garantire l'isolamento tra clienti per dati potenzialmente sensibili.
- Non sono specificati costi e accesso ai servizi AI e cloud; il canale «meeting» compare nello schema dell'architettura ma non tra i requisiti, e andrebbe chiarito con il proponente, e l'integrazione con WhatsApp richiede attenzione.

=== Valutazione finale
Capitolato ben documentato e ricco di spunti tecnici, con un proponente strutturato e un buon supporto, ma con un ambito ampio e con incertezze sulle integrazioni da chiarire. Dopo una attenta valutazione il gruppo ha deciso di scartarlo.

#pagebreak(weak: true)
== C1 – AURA: AI for Understanding, Reasoning and Automation

=== Informazioni generali
- *Titolo:* AURA: AI for Understanding, Reasoning and Automation
- *Proponente:* Vimar S.p.A.
- *Referente:* Mariano Sciacco, Domenico Bevilacqua

=== Breve descrizione
Vimar produce impianti domotici wireless in rete Bluetooth Mesh ed è tra i promotori dell'interfaccia REST KNX IoT 3rd-party API, che permette di leggere e comandare un impianto di casa. Il capitolato chiede un dimostratore che unisce IoT e intelligenza artificiale generativa: un server MCP (Model Context Protocol) che espone queste API a servizi AI commerciali come Claude, ChatGPT, Copilot o Gemini, un client MCP e un'infrastruttura cloud-ready a container (Docker, Infrastructure as Code, compatibile con AWS). L'utente, autenticato con il proprio account MyVimar tramite OAuth2, controlla in linguaggio naturale luci, tapparelle, termostati e sensori; il capitolato elenca 17 casi d'uso base e 21 avanzati (richieste ambigue, comandi estesi con conferma, errori) e alcune funzioni nice-to-have. Vimar fornisce a ogni gruppo un kit fisico di impianto.

=== Aspetti positivi
- Kit fisico fornito a ogni gruppo (gateway, attuatori, comando tapparelle, sensori di presenza, termostato, pulsante allarme): si lavora su un impianto reale e il risultato è facilmente dimostrabile.
- Requisiti molto dettagliati, con 38 casi d'uso di esempio e criteri di completamento distinti in obbligatori, opzionali e nice-to-have, oltre a deliverable chiari (architettura con modello C4, analisi tecnica, manuale di installazione, documentazione dei test).
- Tema molto attuale (MCP, agenti AI) che usa servizi AI esistenti invece di addestrare modelli, con uno stack consigliato accessibile (Python con FastMCP) e sviluppo assistito da strumenti GenAI esplicitamente incoraggiato.
- Supporto strutturato dal proponente: SAL bisettimanali, incontri di approfondimento tecnico e risorse AWS messe a disposizione se richieste.

=== Criticità
- Dipendenza da hardware e API del proponente: la documentazione KNX IoT è accessibile dopo registrazione e firma di un documento d'uso, e il kit è uno solo per gruppo, con il rischio di rallentamenti nello sviluppo e nei test.
- Soglie di test impegnative: copertura minima del 75% su unità e integrazione e dell'80% sugli end-to-end (con estensione opzionale al 90%); i test sulle conversazioni sono resi difficili dal comportamento non deterministico degli LLM.
- Competenze nuove da acquisire (KNX IoT, OAuth2, MCP, Docker e Infrastructure as Code) e vincolo di usare il meccanismo di Subscription invece del polling, con ricadute sull'architettura.
- Tre componenti obbligatorie (infrastruttura, MCP server e client, agente AI) e un numero elevato di casi d'uso da gestire; costi di LLM e cloud non quantificati nel capitolato.

=== Valutazione finale
Capitolato concreto e ben strutturato, con hardware reale, requisiti dettagliati e un proponente molto presente, ma con un carico di test elevato e una forte dipendenza da kit e API di Vimar. Per questo motivo il gruppo ha deciso di scartarlo.

#pagebreak(weak: true)
== C2 – NEXUM Concierge

=== Informazioni generali
- *Titolo:*  Concierge
- *Proponente:* Eggon S.r.l. (Padova)
- *Referente:* Gianpaolo Ferrarin

=== Breve descrizione
NEXUM è la piattaforma di Eggon per la comunicazione aziendale e i servizi HR, composta da un backoffice amministrativo e da una PWA per il personale. Il capitolato chiede di integrare nella PWA un assistente conversazionale (Concierge) con quattro capacità: rispondere su regolamenti e procedure caricati dal backoffice (RAG, con citazione delle fonti e astensione quando le informazioni non bastano), spiegare l'uso di NEXUM a partire dai manuali, consultare i dati personali su ferie e permessi tramite servizi autorizzati, preparare e registrare richieste con riepilogo e conferma esplicita dell'utente. L'MVP è limitato all'area ferie e permessi e può usare servizi NEXUM di prova o simulatori; il percorso prevede POC, realizzazione del percorso completo e verifica finale.

=== Aspetti positivi
- Perimetro dell'MVP molto circoscritto (solo ferie e permessi), con criteri di accettazione, rischi e mitigazioni già esplicitati e quattro capacità ben distinte che condividono chat, contesto e controlli.
- Libertà nella scelta di stack, modelli e servizi, concordati con Eggon, con API documentate o simulatori conformi al contratto di integrazione forniti dal proponente.
- Tema attuale e formativo: RAG, tool use, gestione del contesto del dialogo, astensione e valutazione separata di recupero, risposte ed esecuzione; effort di riferimento dichiarato (circa 3.360 ore, pari a 7 persone per 480 ore ciascuna).
- Coordinamento chiaro: call settimanali o bisettimanali (con possibilità di incontri dal vivo), gruppo Telegram per le comunicazioni rapide, uso di strumenti come Claude Code o Codex incoraggiato e documentazione dei precedenti progetti con UNIPD disponibile.

=== Criticità
- Le soglie quantitative di prestazione non sono ancora definite e il documento è ancora in evoluzione (versione 9 del 13 ottobre 2026).
- Dipendenza dal contratto di integrazione e dalle API o dai simulatori di Eggon, da concordare nella Fase 1; il significato dei dati e degli stati usati nei conteggi di ferie e permessi è demandato al proponente.
- Valutare la qualità del recupero delle informazioni, delle citazioni e dell'astensione è difficile e richiede dati di prova e referenti per la validazione; il modello non deve inventare dati né sostituirsi ai servizi nei conteggi.
- Molti requisiti trasversali (autorizzazioni, conferme, tracciabilità, elaborazioni asincrone, separazione tra aziende) pur in un dominio ristretto, con consumi e costi dei servizi AI da monitorare come parte della valutazione.

=== Valutazione finale
Capitolato molto chiaro su perimetro, accettazione e rischi, con libertà tecnologica su un tema attuale, ma con soglie di prestazione e integrazioni ancora da concordare e con la difficoltà di dimostrare la correttezza delle risposte. Il gruppo ha deciso di scartare questo capitolto.

#pagebreak(weak: true)
== C3 – FossDot

=== Informazioni generali
- *Titolo:* FossDot:  Smart Speaker Open Source estensibile e rispettoso della privacy
- *Proponente:* Uranion EMEA Ltd
- *Referente:* Andrea Dorigo

=== Breve descrizione
Gli smart speaker commerciali sono dispositivi chiusi, legati al cloud del produttore e a un solo assistente, con poca trasparenza sui dati inviati ai server. Il capitolato chiede di realizzare FossDot, un ecosistema open source completo con quattro componenti: scelta dell'hardware (scheda, array di microfoni, altoparlante) con distinta base e prototipo; firmware embedded per wake word, streaming audio e riproduzione, con Rust preferenziale; servizio di bridging con pipeline STT, LLM e TTS, provider AI configurabili e client MCP; interfaccia web per registrare e configurare più dispositivi. L'MVP richiede il flusso «wake word, domanda, risposta vocale» su un dispositivo fisico, mentre la consegna completa aggiunge più provider AI, Skills e Agents, multi-dispositivo, aggiornamenti OTA e STT/TTS locale. Il progetto va rilasciato con licenza Apache 2.0 o MIT e resta di proprietà del gruppo.

=== Aspetti positivi
- Progetto open source con licenza permissiva e proprietà del gruppo: il lavoro può essere inserito nel curriculum e il gruppo può contribuire a un repository pubblico.
- Prodotto tangibile e dimostrabile, su temi attuali (AI, MCP, privacy) e con tecnologie varie, tra cui Rust embedded, wake word, speech-to-text e text-to-speech.
- Libertà tecnologica con riferimenti utili già indicati (openWakeWord, faster-whisper, Piper, Ollama, Axum) e obiettivi graduati: un MVP ben definito e una consegna completa a cui il gruppo può decidere se arrivare.
- Supporto della proponente con sessioni tecniche e architetturali su richiesta, incontri di stato avanzamento e competenze di agentic coding messe a disposizione dei gruppi.

=== Criticità
- Ambito molto vasto (hardware, firmware, server, interfaccia web, MCP, multi-dispositivo): anche l'MVP è impegnativo e le stime di tempo sono difficili.
- Competenze di embedded, audio e Rust poco comuni nel percorso di studi, con sviluppo, debug e testing su dispositivo fisico più onerosi; per il firmware la copertura di test va concordata caso per caso.
- Il capitolato non indica che l'hardware sia fornito dalla proponente: scelta e costi dei componenti sembrano a carico del gruppo, e andrebbe chiarito.
- Proponente a distanza (Londra e sede di Roma), con comunicazioni via chat, e-mail e videochiamate e incontri in presenza solo se necessari; i flussi vocali sono dati personali (GDPR) e servono costi per provider AI e servizi cloud, con copertura di riferimento di almeno l'80% sul software.

=== Valutazione finale
Capitolato ambizioso e vario dal punto di vista tecnico, con un forte valore di portfolio grazie alla licenza open source, ma con un ambito molto ampio e una componente hardware ed embedded difficile da stimare. Il gruppo ha selezionato questo capitolato come prima scelta.

#pagebreak(weak: true)
== C4 – Gestione veicoli e servizi post-vendita

=== Informazioni generali
- *Titolo:* Gestione Veicoli e Servizi Post-Vendita
- *Proponente:* M31 S.r.l. (Padova)
- *Referente:* Cristian Pirlog

=== Breve descrizione
Nel settore automotive le informazioni su modelli, veicoli venduti, manutenzioni e campagne di richiamo sono frammentate tra sistemi diversi. Il capitolato chiede una piattaforma distribuita, organizzata in servizi, che supporti tre soggetti: la casa automobilistica (catalogo modelli, veicoli, concessionarie, campagne di richiamo), le concessionarie (vendite, proprietari, richieste di manutenzione) e i proprietari dei veicoli (dati del veicolo, richiesta di appuntamenti, notifiche). Sono richiesti tre interfacce web distinte, API sicure e versionate, comunicazione sincrona e a eventi, autenticazione con ruoli e separazione dei dati tra organizzazioni. I dati dei veicoli possono essere inseriti a mano o simulati, senza integrare veicoli reali; il percorso prevede analisi dello stato dell'arte, PoC e MVP con un test book dettagliato.

=== Aspetti positivi
- Requisiti molto dettagliati, con distinzione chiara tra funzionalità minime e opzionali, deliverable per ogni fase (stato dell'arte, PoC, MVP) e un elenco preciso dei test da svolgere.
- Nessun hardware né integrazione con veicoli reali: si lavora con dati simulati o inseriti manualmente, e il dominio è facile da comprendere.
- Stack moderno e molto richiesto nel mondo del lavoro (microservizi, comunicazione a eventi con NATS o Kafka, Kubernetes, Angular, Nest.js) e occasione di fare esperienza con sicurezza, ruoli e separazione dei dati.
- Azienda con sede a Padova, con un referente indicato nel documento e una forte attenzione dichiarata alla qualità del codice e ai test.

=== Criticità
- Complessità architetturale elevata: microservizi, event broker, Kubernetes su GCP, più database (PostgreSQL, MongoDB, Redis) e tre frontend Angular.
- Stack molto ampio (TypeScript, Go, NATS o Kafka, Angular e altri strumenti) con molte tecnologie da apprendere; eventuali alternative vanno motivate e accettate da M31.
- Rischio di sovradimensionamento: il dominio è in gran parte gestionale e il valore funzionale è basso rispetto all'effort richiesto per l'infrastruttura distribuita; poco spazio per l'intelligenza artificiale.
- Molti test e documenti richiesti (test book, API, manuali, diagrammi C4), con copertura minima ancora da concordare; il documento non descrive le modalità di incontri e avanzamenti con il proponente.

=== Valutazione finale
Capitolato molto ben specificato e senza dipendenze da hardware, con punto di forza soprattutto architetturale, ma con una complessità infrastrutturale elevata rispetto al valore funzionale del dominio. Il gruppo ha deciso di scartare questo capitolato.

#pagebreak(weak: true)
== C5 – RareCare

=== Informazioni generali
- *Titolo:* RareCare: Piattaforma AI per la raccolta dati e il supporto decisionale nelle malattie rare
- *Proponente:* Miriade S.r.l. (Thiene, VI)
- *Referente:* Emanuele Righetto (coordinatore), Jessica Dalla Fontana (dominio clinico)

=== Breve descrizione
Piattaforma digitale con assistente virtuale basato su intelligenza artificiale (RareCare Navigator) a supporto delle famiglie e della rete di cura nella gestione delle malattie rare, a partire dalla sindrome di Sanfilippo. Comprende un assistente conversazionale RAG che risponde solo sulla base di fonti verificate, checklist e scadenze con promemoria, un hub di coordinamento con permessi granulari tra medico, scuola e terapisti e un fascicolo digitale cifrato. L'architettura deve essere modulare, per poter essere estesa ad altre patologie, e il prototipo è validato sul campo con l'associazione Sanfilippo Fighters.

=== Aspetti positivi
- Impatto sociale concreto e dominio motivante: il prodotto affianca il lavoro del Care Navigator e riduce il carico organizzativo di famiglie fragili.
- Tecnologie moderne e spendibili: LLM, RAG, estrazione di entità con NLP, architettura cloud serverless su AWS, modellazione domain-driven e design a plugin.
- Supporto ampio e concreto di Miriade: mentorship su cloud e AI, supporto UX e UI, mediazione del dominio clinico, formazione iniziale e disponibilità a negoziare il perimetro del progetto.
- Requisiti ben distinti tra funzionali, opzionali, tecnici e non funzionali, con un'architettura di riferimento non vincolante e un percorso incrementale suggerito (MVP ed evoluzioni successive).

=== Criticità
- Trattamento di dati sanitari di minori (art. 9 GDPR): servono privacy by design, DPIA, cifratura, tracciamento degli accessi e un modello di autorizzazione per paziente che vada oltre il semplice RBAC.
- Alcuni requisiti sono difficili da soddisfare alla lettera: la cifratura «end-to-end» è in tensione con le funzioni AI che leggono i dati lato server, e le risposte «prive di allucinazioni» non sono pienamente raggiungibili.
- Rischio regolatorio (EU AI Act, MDR): il perimetro deve restare su orientamento e informazione, senza indicazioni diagnostiche o terapeutiche.
- Forte orientamento ai servizi AWS (Lambda, Bedrock, Cognito), con rischio di vendor lock-in e costi da presidiare; ambito ampio (18 requisiti) e dominio clinico nuovo da apprendere, con strumenti limitati per l'italiano (Comprehend Medical supporta solo l'inglese).

=== Valutazione finale
Capitolato di forte impatto sociale e con un supporto molto ampio da parte del proponente, ma con un'elevata complessità su sicurezza, privacy e conformità normativa e con un dominio sensibile che richiede cautela costante. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C6 – Caching semantico e dashboard FinOps per LiteLLM

=== Informazioni generali
- *Titolo:* Sistema AI di caching semantico e dashboard FinOps
- *Proponente:* Var Group
- *Referente:* Alessio Borgheresi, Stefano Dindo, Laura Ferretti, Michele Massaro

=== Breve descrizione
Estensione di LiteLLM, il proxy open source che instrada le richieste verso più provider di modelli linguistici ed è già in produzione in Var Group, con due componenti originali. Il primo è un livello di caching semantico, basato su embedding e ricerca per similarità, che riconosce domande equivalenti anche se formulate in modo diverso e riduce le chiamate ai modelli. Il secondo è una dashboard FinOps che attribuisce i costi a team, progetti e utenti, gestisce budget e avvisi, calcola il risparmio ottenuto dalla cache e prevede la spesa mensile. Il risultato atteso è un MVP end-to-end con proxy, cache e dashboard.

=== Aspetti positivi
- Problema attuale e concreto, quello del controllo dei costi dell'AI generativa in azienda, con risultati misurabili (risparmio di token e costi, latenza).
- Ambito ben delimitato: due componenti su una base esistente (LiteLLM, da non reinventare), con uno stack consigliato chiaro e diffuso (Python, FastAPI, Docker, Redis, PostgreSQL, un vector database, React).
- Competenze trasferibili e richieste dal mercato su embedding, ricerca vettoriale, multi-tenancy e osservabilità dei costi.
- Percorso strutturato dal proponente: sessione di design thinking, formazioni dedicate (LiteLLM, embedding e caching, FinOps), stand-up periodici e momenti di domande e risposte, con deliverable definiti (architettura e ADR, requisiti, UML, MVP, test con copertura di almeno il 70%).

=== Criticità
- Dipendenza da un progetto esterno: il lavoro si innesta su LiteLLM, il cui sviluppo upstream può cambiare, e le sue limitazioni note, come la multi-tenancy limitata, vanno aggirate o estese.
- La cache semantica non è deterministica: la scelta della soglia di similarità può far restituire risposte sbagliate, quindi occorre separare i test deterministici dalla valutazione probabilistica, con un impegno di verifica non banale.
- Il capitolato è presentato in forma di slide e dà meno dettaglio su requisiti numerati, distinzione tra obbligatori e opzionali, criteri di accettazione e dati di prova: il perimetro andrebbe chiarito con il proponente.
- È prevista una sessione di design thinking in presenza di tre ore, e i costi di embedding e di chiamate ai modelli vanno tenuti sotto controllo durante i test.

=== Valutazione finale
Capitolato tecnicamente interessante, ben delimitato e con un buon percorso di supporto, ma con un perimetro dei requisiti meno dettagliato nei documenti e una forte dipendenza da un componente esterno. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C7 – SmartDashboard

=== Informazioni generali
- *Titolo:* SmartDashboard: Piattaforma di Business Intelligence potenziata da AI
- *Proponente:* Ergon Informatica S.r.l. (Castelfranco Veneto, TV)
- *Referente:* Gianluca Carlesso

=== Breve descrizione
Piattaforma di Business Intelligence end-to-end che recupera i dati dal gestionale aziendale (ERP), li consolida in un data warehouse con modello dimensionale e li espone in una web app responsive in cui gli utenti costruiscono da soli le dashboard trascinando i widget (grafici, KPI, tabelle, pivot, mappe). Un layer di intelligenza artificiale basato su LLM genera visualizzazioni da richieste in linguaggio naturale, produce insight automatici, assiste nella costruzione delle dashboard e, come estensione, spiega gli indicatori su richiesta. Il proponente può fornire i dati di un caso di studio reale.

=== Aspetti positivi
- Ambito esclusivamente software, senza componenti hardware, con un dominio facilmente comprensibile e un caso d'uso reale legato a vendite, ordini e logistica di un'azienda.
- Pipeline completa e formativa: ingestione, ETL, modellazione dimensionale (star schema), API, frontend e integrazione di un LLM, con competenze di data engineering e di sviluppo web spendibili.
- Tecnologie libere e molto diffuse (Python, DuckDB, React o altri framework, API REST, LLM commerciali), senza stack vincolanti, e un approccio incrementale consigliato: prima la parte BI, poi le funzioni AI, con requisiti da classificare per priorità.
- Dati reali del proponente disponibili su richiesta per sviluppo e test, incontri di allineamento ogni quindici giorni e un referente disponibile per chiarimenti.

=== Criticità
- Ambito ampio: pipeline dati, web app con costruttore di dashboard drag and drop, libreria di widget con pivot e mappe e quattro capacità AI. Il rischio è realizzare molte funzionalità solo abbozzate, e l'analisi dei requisiti dovrà restringere il perimetro.
- Il confronto implicito con prodotti consolidati come Power BI e Tableau rende difficile ottenere una piattaforma altrettanto rifinita sul piano dell'usabilità.
- La generazione affidabile di visualizzazioni da linguaggio naturale è delicata (risposte errate dell'LLM, interrogazioni sui dati da non esporre al frontend, controlli di coerenza richiesti) e dipende da API commerciali con costi e limiti.
- Il capitolato non definisce requisiti numerati, criteri di accettazione o soglie di test; la qualità dei dati reali del gestionale può richiedere molto lavoro di pulizia e normalizzazione, e sono dichiarati incontri periodici ma non formazioni dedicate.

=== Valutazione finale
Capitolato interamente software, di dominio comprensibile e con un buon equilibrio tra dati e intelligenza artificiale, ma con un ambito ampio e una dipendenza dalla qualità dei dati reali. Il gruppo lo ha individuato come possibile capitolato di riserva.

#pagebreak(weak: true)
== C8 – Sonar

=== Informazioni generali
- *Titolo:* Sonar: Documentazione vivente di uno store Shopify
- *Proponente:* Halue S.r.l. Società Benefit (Parma e Abano Terme, PD)
- *Referente:* Valentino Baraldo

=== Breve descrizione
Applicazione web in sola lettura che si collega a uno store Shopify tramite custom app, ne scansiona configurazioni (app, webhook, campi personalizzati, funzioni, canali) e codice del tema attraverso le Admin API, e ricostruisce un grafo di entità e dipendenze indicando fonte e livello di confidenza di ogni informazione. Un motore di regole estensibile segnala orfani e codice morto; l'interfaccia permette di navigare il catalogo e il grafo, confrontare due snapshot ed esportare la documentazione in Markdown o HTML, pronta da consegnare a un fornitore subentrante.

=== Aspetti positivi
- Problema reale e ben argomentato, con un perimetro molto chiaro: sola lettura, solo Shopify, con indicazioni esplicite su ciò che è fuori ambito.
- Requisiti numerati e criteri di accettazione misurabili (copertura dei test almeno 70%, casi di test superati almeno 95%, falsi positivi ad alta severità non oltre il 10%), con la possibilità di concordare per iscritto una riduzione motivata dei requisiti obbligatori.
- Ambiente di lavoro autonomo e gratuito (development store Shopify, piani free di Vercel e Supabase), senza dipendere da dati o infrastrutture del proponente; l'uso di strumenti di AI nello sviluppo è esplicitamente ammesso.
- Molti temi di ingegneria del software (modello a grafo, rate limiting, analisi statica, architettura estensibile, ADR, diagrammi C4 e UML) e un processo di collaborazione descritto con precisione: incontri ogni due settimane e risposta entro un giorno lavorativo.

=== Criticità
- Stack tecnologico vincolante e specifico (Next.js su Vercel, Vercel Workflows, Supabase con Row Level Security, TypeScript, solo autenticazione Google), in parte recente: le deroghe vanno richieste entro l'analisi dei requisiti.
- I piani gratuiti hanno limiti concreti, come la sospensione dei progetti Supabase dopo una settimana di inattività e le soglie mensili di Vercel, che incidono su ri-scansioni pianificate e generazione di descrizioni; il consumo va monitorato.
- Ambito molto esteso: 20 requisiti funzionali obbligatori, oltre a quelli di qualità, sicurezza e non funzionali; il gruppo deve inoltre costruire e documentare da sé lo store Shopify di prova con la stratificazione da rilevare.
- Dominio specialistico da apprendere (Admin API di Shopify, metafield, codice Liquid) e analisi statica di codice reale e talvolta minificato; non sono previsti incontri in presenza né un canale di messaggistica condiviso.

=== Valutazione finale
Capitolato molto curato e con criteri di valutazione chiari, ma vincolato a uno stack e a un dominio molto specifici, con un ambito ampio e limiti dei piani gratuiti da presidiare. Per questi motivi il gruppo non lo ha selezionato.

#pagebreak(weak: true)
== C9 – SpecCheck

=== Informazioni generali
- *Titolo:* SpecCheck: Skills per OpenCode per la verifica della tracciabilità tra casi d'uso , requisiti e codice sorgente
- *Proponente:* Zucchetti S.p.A.
- *Referente:* Gregorio Piccoli

=== Breve descrizione
Pacchetto di skill, tool e almeno un plugin per OpenCode, l'harness per lo sviluppo assistito da LLM, che verifica la rispondenza tra casi d'uso, requisiti e codice di un progetto software esterno: legge diagrammi e documentazione dei casi d'uso e le specifiche dei requisiti, li confronta, ne verifica il riscontro nel codice e riporta in una dashboard le discrepanze. Il sistema si occupa solo della verifica, non della realizzazione, ed è distribuito come prodotto unico con un installer. Tra i requisiti opzionali ci sono una dashboard grafica, la verifica della copertura delle specifiche e la lettura da PDF.

=== Aspetti positivi
- Tema molto attuale e coerente con l'ingegneria del software: sviluppo assistito da AI e tracciabilità tra casi d'uso, requisiti e codice, un problema di verifica diventato centrale ora che la scrittura del codice è automatizzata.
- Competenze molto aggiornate su agenti, skill, plugin e gestione del contesto per LLM, con strumenti di riferimento come OpenSpec.
- Accesso offerto dall'azienda sia a modelli di grandi dimensioni, con un tetto di costo, sia a modelli più piccoli senza limiti, e titolo preferenziale per la pubblicazione open source del risultato.
- Requisiti obbligatori chiari e in numero contenuto (nove), con fasi PoC e MVP ben distinte e requisiti opzionali modificabili dai gruppi vincitori.

=== Criticità
- Progetto dichiaratamente molto esplorativo: parte dei risultati dipende dalle capacità degli LLM, non deterministiche e non garantite, e la verifica richiede componenti deterministiche (plugin o applicativo esterno) accanto alle skill.
- I requisiti obbligatori non sono modificabili in corso d'opera, quindi un'ipotesi rivelatasi troppo ambiziosa lascerebbe poco margine.
- Dipendenza da OpenCode e da strumenti in rapida evoluzione, con il rischio che le interfacce di skill e plugin cambino; serve inoltre un progetto di prova con casi d'uso, requisiti e codice da verificare.
- Il capitolato non indica cadenza di incontri, supporto o formazione da parte del proponente, né soglie quantitative di accettazione (parla solo di «adeguata copertura»); la qualità della verifica (falsi positivi e negativi) è difficile da misurare.

=== Valutazione finale
Capitolato innovativo e molto pertinente al corso, con un buon accesso ai modelli, ma con un alto grado di incertezza dovuto alla natura esplorativa e alla dipendenza dagli LLM, e con meno indicazioni sul supporto del proponente. Per questi motivi il gruppo non lo ha selezionato.

= Capitolato selezionato

== Valutazioni finali
Il gruppo ha scelto il capitolato C3 – FossDot come prima scelta per la candidatura, [inserire qui il motivo principale]. Come seconda scelta ha individuato il C7 – SmartDashboard, interamente software, con un percorso incrementale chiaro e un proponente disponibile al confronto. Gli altri capitolati non sono stati selezionati per ambito troppo ampio, vincoli tecnologici o forte dipendenza da componenti esterni.
