// ============================================================
//  Glossario – Hex4dev, capitolato C9 SpecCheck (Zucchetti S.p.A.)
//
//  Compilare dalla root del repository con:
//    typst compile --root . common/glossario/glossario.typ
//
//  Le voci sono definite una sola volta nell'elenco `voci`, in qualsiasi
//  ordine: ordinamento alfabetico, raggruppamento per lettera e indice
//  delle lettere sono generati da lì.
//
//  Per aggiungere una voce:
//    voce("Termine", sigla: "ABC", cat: "Prodotto" | "Strumenti" | "Processo",
//         fonte: ("CAP", "AdR"), vedi: ("Altro termine",),
//         aperto: [testo del punto aperto], nota: [termini da non confondere])[
//      Definizione.
//    ]
//  Nel testo, `#vd("Termine")` crea un rimando cliccabile alla voce;
//  `#vd("Termine", [forma flessa])` usa un testo diverso dal nome della voce.
//  Un rimando a una voce inesistente blocca la compilazione.
// ============================================================

#import "/templates/documento.typ": documento, tabella, colore-primario, colore-scuro, colore-accento, colore-sfondo

#show: documento.with(
  titolo: "Glossario",
  sottotitolo: "Capitolato C9 – SpecCheck · Zucchetti S.p.A.",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "0.1",
  data: "2026-11-26",
  uso: "Esterno",
  redattori: ("Francesco Bassani",),
  verificatori: (),
  registro: (
    ("0.1", "2026-11-26", "Francesco Bassani", "—", "Prima stesura: struttura del documento e termini già in uso nei documenti del gruppo"),
  ),
)

// ------------------------------------------------------------
//  Stili e componenti locali
// ------------------------------------------------------------
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: set text(size: 10pt)
#let tab(al, ..args) = { set table(align: al); tabella(..args) }

#let colore-aperto = rgb("#C98A00")

#let _slug(t) = "g-" + lower(t).replace(regex("[^a-z0-9]+"), "-")

// Rimando a una voce del glossario
#let vd(termine, ..testo) = {
  let t = testo.pos()
  link(label(_slug(termine)), emph(if t.len() == 0 { termine } else { t.first() }))
}

#let voce(termine, sigla: none, cat: "Prodotto", fonte: (), vedi: (), aperto: none, nota: none, corpo) = (
  termine: termine, sigla: sigla, cat: cat, fonte: fonte, vedi: vedi, aperto: aperto, nota: nota, corpo: corpo,
)

#let _etichetta(cat) = box(
  fill: colore-sfondo, stroke: 0.5pt + colore-primario.lighten(55%),
  inset: (x: 5pt, y: 2.5pt), radius: 2pt,
  text(size: 7.5pt, weight: "semibold", fill: colore-primario)[#upper(cat)],
)

#let _mostra(e) = block(width: 100%, above: 1.35em, below: 0pt, breakable: false, {
  [#metadata(e.termine)#label(_slug(e.termine))]
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    {
      text(size: 11.5pt, weight: "bold", fill: colore-scuro, e.termine)
      if e.sigla != none { h(0.4em); text(size: 10.5pt, weight: "semibold", fill: colore-primario)[(#e.sigla)] }
    },
    _etichetta(e.cat),
  )
  set par(spacing: 0.6em)
  set block(spacing: 0.45em)
  line(length: 100%, stroke: 0.4pt + colore-primario.lighten(70%))
  e.corpo
  if e.nota != none {
    v(0.2em)
    block(width: 100%, inset: (left: 8pt, y: 2pt), stroke: (left: 2pt + colore-accento),
      text(size: 10pt)[*Da distinguere.* #e.nota])
  }
  if e.aperto != none {
    v(0.2em)
    block(width: 100%, fill: rgb("#FFF7DC"), inset: 6pt, radius: 2pt, stroke: (left: 2.5pt + colore-aperto),
      text(size: 10pt)[#text(fill: colore-aperto, weight: "bold")[Punto aperto.] #e.aperto])
  }
  let meta = ()
  if e.fonte.len() > 0 { meta.push([*Fonte:* #e.fonte.join(", ")]) }
  if e.vedi.len() > 0 { meta.push([*Vedi anche:* #e.vedi.map(t => vd(t)).join(", ")]) }
  if meta.len() > 0 {
    v(0.25em)
    set par(justify: false)
    text(size: 8.5pt, fill: colore-scuro.lighten(15%), meta.join(h(1.2em)))
  }
})

// ------------------------------------------------------------
//  Voci
// ------------------------------------------------------------
#let voci = (

  // ---------------- Prodotto e dominio ----------------

  voce("SpecCheck", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("OpenCode", "Catena di tracciabilità", "Dashboard"))[
    Prodotto richiesto dal capitolato C9: un pacchetto unico di estensioni di #vd("OpenCode") (#vd("Skill", [skill]), #vd("Comando", [comandi]), #vd("Tool", [tool]) e almeno un #vd("Plugin", [plugin])) che, all'interno di un #vd("Progetto verificato", [progetto verificato]), controlla la tracciabilità tra casi d'uso, specifiche dei requisiti e codice sorgente e ne riporta lo stato in una #vd("Dashboard", [dashboard]). SpecCheck verifica e non realizza: non genera né modifica gli artefatti del progetto che controlla.
  ],

  voce("Catena di tracciabilità", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Tracciabilità", "Verifica casi d'uso – requisiti", "Verifica requisiti – codice"))[
    Sequenza di artefatti che SpecCheck controlla, nell'ordine in cui vengono prodotti: #vd("Caso d'uso", [casi d'uso]) → #vd("Specifica dei requisiti", [specifiche dei requisiti]) → #vd("Codice sorgente", [codice sorgente]). Ogni passaggio della catena corrisponde a una delle due verifiche del prodotto.
  ],

  voce("Tracciabilità", sigla: "end-to-end", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Catena di tracciabilità", "Tracciamento"),
    nota: [la _tracciabilità_ è una proprietà degli artefatti, mentre il #vd("Tracciamento", [tracciamento]) è l'attività, o la tabella, che la documenta.])[
    Proprietà per cui ogni elemento di un livello della catena (un caso d'uso, una specifica, una parte di codice) può essere ricondotto agli elementi corrispondenti degli altri livelli. È _end-to-end_ quando il collegamento copre l'intera #vd("Catena di tracciabilità", [catena]), dal caso d'uso fino al codice.
  ],

  voce("Tracciamento", cat: "Processo", fonte: ("AdR", "VI-2026-11-11"), vedi: ("Tracciabilità", "Requisito", "Decisione"))[
    Attività che registra in modo esplicito i collegamenti tra elementi, e tabella che ne è il risultato. Nell'_Analisi dei requisiti_ collega ogni #vd("Requisito", [requisito]) alla #vd("Fonte", [fonte]) da cui discende e al #vd("Caso d'uso", [caso d'uso]) che lo motiva; nei verbali collega ogni #vd("Decisione", [decisione]) alle #vd("Attività", [attività]) che la attuano.
  ],

  voce("Progetto verificato", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Progetto di riferimento", "Fonte"),
    nota: [il _progetto verificato_ è un ruolo (qualunque progetto su cui SpecCheck viene usato); il #vd("Progetto di riferimento", [progetto di riferimento]) è il progetto concreto scelto dal gruppo per provare il prodotto.])[
    Progetto software esterno a SpecCheck, gestito dallo sviluppatore con OpenCode, di cui SpecCheck controlla la tracciabilità. Contiene i tre gruppi di artefatti della catena e prosegue il proprio sviluppo indipendentemente dalle verifiche.
  ],

  voce("Progetto di riferimento", cat: "Prodotto", fonte: ("AdR", "VE-2026-11-13"), vedi: ("Progetto verificato",))[
    Progetto ben documentato, con casi d'uso, diagrammi UML e specifiche almeno in parte formali, su cui il gruppo prova e dimostra le verifiche di SpecCheck. Zucchetti non ne fornisce uno: il gruppo può usare un proprio progetto o un esempio pubblico di buona qualità; il referente ha proposto in alternativa un progetto didattico dell'Università di Pisa. La scelta è pianificata nello sprint S2.
  ],

  voce("Fonte", cat: "Prodotto", fonte: ("AdR",), vedi: ("Progetto verificato", "Requisito"),
    nota: [nell'_Analisi dei requisiti_ «fonte» indica anche l'origine di un requisito (il capitolato, la presentazione, una decisione interna), identificata da una sigla come C-O1 o INT. Il contesto distingue i due significati.])[
    Artefatto del #vd("Progetto verificato", [progetto verificato]) che SpecCheck legge per eseguire le verifiche: #vd("Diagramma dei casi d'uso", [diagrammi]) e #vd("Documentazione aggiuntiva", [documentazione aggiuntiva]) dei casi d'uso, #vd("Specifica dei requisiti", [specifiche dei requisiti]) e #vd("Codice sorgente", [codice sorgente]). Lo sviluppatore ne indica la posizione nella configurazione (UC2).
  ],

  voce("Caso d'uso", sigla: "UC", cat: "Prodotto", fonte: ("AdR",), vedi: ("Attore", "Scenario principale", "Diagramma dei casi d'uso"))[
    Descrizione di un'interazione tra uno o più #vd("Attore", [attori]) e il sistema, vista dall'esterno, che porta a un risultato utile per l'attore principale. Nell'_Analisi dei requisiti_ ogni caso d'uso ha un codice `UC[n]` (i sottocasi `UC[n].[m]`) ed è descritto da una scheda con attori, #vd("Precondizione", [precondizioni]), #vd("Postcondizione", [postcondizioni]), scenario principale ed #vd("Estensione", [estensioni]). I casi d'uso sono anche il primo anello della #vd("Catena di tracciabilità", [catena]) che SpecCheck verifica nei progetti altrui.
  ],

  voce("Attore", cat: "Prodotto", fonte: ("AdR",), vedi: ("Caso d'uso", "Sviluppatore", "Modello LLM"))[
    Entità esterna al sistema che interagisce con esso in un caso d'uso. L'attore _principale_ avvia l'interazione per ottenere un risultato; un attore _secondario_ partecipa fornendo un servizio. Per SpecCheck l'attore principale è lo #vd("Sviluppatore", [sviluppatore]) e l'attore secondario è il #vd("Modello LLM", [modello LLM]); OpenCode non è un attore, ma la piattaforma su cui il prodotto opera.
  ],

  voce("Sviluppatore", cat: "Prodotto", fonte: ("AdR",), vedi: ("Attore",))[
    Attore principale di SpecCheck: la persona che lavora al progetto verificato con OpenCode e che installa il prodotto, ne configura le fonti, avvia le verifiche e consulta la dashboard. Chi estende skill, comandi e tool del prodotto ha un manuale dedicato, ma non è un attore distinto.
  ],

  voce("Modello LLM", cat: "Prodotto", fonte: ("AdR",), vedi: ("LLM", "Attore"))[
    Attore secondario di SpecCheck: il #vd("LLM", [modello di linguaggio]), esterno al prodotto e raggiunto tramite OpenCode, a cui sono affidate la lettura delle fonti e le valutazioni di #vd("Rispondenza", [rispondenza]).
  ],

  voce("Diagramma dei casi d'uso", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("UML", "Mermaid", "XMI", "PlantUML"))[
    Diagramma #vd("UML") che rappresenta gli attori, i casi d'uso di un sistema e le relazioni tra di essi: #vd("Associazione", [associazione]), #vd("Inclusione", [inclusione]), #vd("Estensione", [estensione]) e #vd("Generalizzazione", [generalizzazione]). Nel progetto verificato è una delle fonti di SpecCheck, letta da file in un formato testuale.
  ],

  voce("Associazione", cat: "Prodotto", fonte: ("AdR",), vedi: ("Diagramma dei casi d'uso", "Attore"),
    nota: [nella verifica casi d'uso – requisiti si parla di «associazione» anche per il collegamento che SpecCheck stabilisce tra un caso d'uso e le specifiche che lo realizzano (UC5.1).])[
    Relazione di un diagramma dei casi d'uso che collega un attore a un caso d'uso a cui partecipa. Si disegna come una linea continua.
  ],

  voce("Inclusione", sigla: "«include»", cat: "Prodotto", fonte: ("AdR",), vedi: ("Estensione", "Diagramma dei casi d'uso"))[
    Relazione tra casi d'uso per cui un caso d'uso contiene sempre il comportamento di un altro, che viene così descritto una sola volta e riusato. Si disegna come una freccia tratteggiata con etichetta «include», diretta verso il caso d'uso incluso.
  ],

  voce("Estensione", sigla: "«extend»", cat: "Prodotto", fonte: ("AdR",), vedi: ("Inclusione", "Scenario principale"),
    nota: [nella scheda di un caso d'uso la voce «Estensioni» elenca invece gli _scenari alternativi_ allo scenario principale (errori, condizioni particolari), che non sempre corrispondono a una relazione «extend» nel diagramma.])[
    Relazione tra casi d'uso per cui un caso d'uso aggiunge comportamento a un altro solo al verificarsi di una condizione. Si disegna come una freccia tratteggiata con etichetta «extend», diretta dal caso d'uso che estende verso quello esteso; ad esempio UC9 estende le operazioni che leggono le fonti.
  ],

  voce("Generalizzazione", cat: "Prodotto", fonte: ("AdR",), vedi: ("Diagramma dei casi d'uso",))[
    Relazione per cui un attore o un caso d'uso specializza un altro più generale, ereditandone le caratteristiche e aggiungendone di proprie. Si disegna come una freccia continua con punta triangolare vuota, diretta verso l'elemento più generale.
  ],

  voce("Scenario principale", cat: "Prodotto", fonte: ("AdR",), vedi: ("Caso d'uso", "Estensione"))[
    Sequenza numerata di passi che descrive lo svolgimento normale di un caso d'uso, quando tutto procede come previsto. Le deviazioni da questa sequenza sono descritte nelle #vd("Estensione", [estensioni]) della scheda.
  ],

  voce("Precondizione", cat: "Prodotto", fonte: ("AdR",), vedi: ("Postcondizione", "Caso d'uso"))[
    Condizione che deve essere vera prima che un caso d'uso possa iniziare, ad esempio «le fonti sono configurate (UC2)».
  ],

  voce("Postcondizione", cat: "Prodotto", fonte: ("AdR",), vedi: ("Precondizione", "Caso d'uso"))[
    Condizione che risulta vera al termine dello scenario principale di un caso d'uso, ad esempio «per ogni specifica è salvato un esito».
  ],

  voce("Documentazione aggiuntiva", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Diagramma dei casi d'uso", "Markdown"))[
    Testo, in formato Markdown, che accompagna i diagrammi dei casi d'uso del progetto verificato e ne completa la descrizione. SpecCheck la associa al caso d'uso del diagramma a cui si riferisce (UC3.2).
  ],

  voce("Specifica dei requisiti", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Requisito", "Catena di tracciabilità", "OpenSpec"),
    nota: [le _specifiche dei requisiti_ sono artefatti del progetto verificato, che SpecCheck legge; i #vd("Requisito", [requisiti]) con codici RF, RQ e RV sono invece quelli di SpecCheck stesso, definiti nell'_Analisi dei requisiti_.])[
    Documento testuale del progetto verificato che descrive i requisiti da realizzare, più orientato all'implementazione rispetto ai casi d'uso. È il secondo anello della #vd("Catena di tracciabilità", [catena]); per l'MVP si assume che sia in formato Markdown.
  ],

  voce("Codice sorgente", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Catena di tracciabilità", "Verifica requisiti – codice"))[
    Ultimo anello della catena: il codice del progetto verificato, da cui SpecCheck ricava una descrizione del comportamento del programma (UC6) da confrontare con le specifiche dei requisiti.
  ],

  voce("Verifica casi d'uso – requisiti", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Rispondenza", "Discrepanza", "Esito"))[
    Prima delle due verifiche di SpecCheck (UC5): per ogni caso d'uso individua le specifiche dei requisiti che lo realizzano (UC5.1) e valuta se descrivono lo stesso comportamento (UC5.2). Lo sviluppatore la avvia con un comando dedicato.
  ],

  voce("Verifica requisiti – codice", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Esito", "Discrepanza"))[
    Seconda verifica di SpecCheck (UC7): confronta il comportamento del programma, ricavato dal codice sorgente, con ogni specifica dei requisiti e ne stabilisce l'#vd("Esito", [esito]). Lo sviluppatore la avvia con un comando dedicato.
  ],

  voce("Rispondenza", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Discrepanza", "Verifica casi d'uso – requisiti"))[
    Corrispondenza di contenuto tra due descrizioni dello stesso comportamento poste a livelli diversi della catena, ad esempio tra un caso d'uso, descrittivo e visto dall'esterno, e la specifica che lo realizza, più orientata all'implementazione.
  ],

  voce("Discrepanza", cat: "Prodotto", fonte: ("AdR",), vedi: ("Rispondenza", "Esito", "Dashboard"))[
    Mancata rispondenza rilevata da una verifica, oppure rispondenza che la verifica non è riuscita a stabilire. Ogni discrepanza indica gli elementi coinvolti (caso d'uso, specifica, file) e la motivazione, ed è messa in evidenza nella dashboard.
  ],

  voce("Esito", cat: "Prodotto", fonte: ("AdR",), vedi: ("Discrepanza", "Dashboard", "Falso positivo e falso negativo"),
    aperto: [il capitolato non definisce i valori possibili. Resta da chiarire con Zucchetti se servano esiti intermedi, come «parzialmente implementata» (questione Q4 dell'_Analisi dei requisiti_).])[
    Risultato di una verifica su un singolo elemento, salvato in forma strutturata e persistente perché la dashboard possa leggerlo. Per una specifica dei requisiti l'esito è _implementata_, _non implementata_ oppure _non determinabile_.
  ],

  voce("Falso positivo e falso negativo", cat: "Prodotto", fonte: ("AdR",), vedi: ("Esito", "LLM"),
    aperto: [i criteri con cui Zucchetti valuterà la qualità delle verifiche, e quindi il peso dei due tipi di errore, sono da concordare (questione Q4).])[
    Errori di una verifica. Un _falso positivo_ segnala una discrepanza che non esiste; un _falso negativo_ non segnala una discrepanza che esiste, ad esempio dichiarando implementata una specifica che non lo è. Con un LLM non deterministico entrambi sono possibili e vanno misurati.
  ],

  voce("Dashboard", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Esito", "Discrepanza", "Deterministico"))[
    Vista riassuntiva degli esiti delle verifiche: mostra quali casi d'uso sono stati rilevati nelle specifiche e quali specifiche nel codice, e mette in evidenza le discrepanze. Nella versione obbligatoria è consultabile a caratteri, nel terminale in cui opera OpenCode (UC8); una dashboard grafica, ad esempio una pagina HTML, è opzionale (UC11). Deve essere prodotta da un plugin o da un applicativo esterno, non dal modello di linguaggio.
  ],

  voce("Copertura", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Test automatico", "Piano di qualifica"),
    nota: [la _copertura del codice da parte delle specifiche_ (requisito opzionale RF-38, UC12) misura quanta parte del codice deriva da una specifica; la _copertura dei test_ (RQ-01) misura quanta parte del codice di SpecCheck è esercitata dai test automatici.],
    aperto: [il capitolato chiede un'«adeguata copertura» dei test senza quantificarla: la soglia sarà fissata nel _Piano di qualifica_ e concordata con Zucchetti (questione Q9).])[
    Misura di quanta parte di un insieme di elementi è raggiunta da un altro insieme. Nel progetto il termine ha due usi distinti, indicati sotto.
  ],

  voce("Deterministico", cat: "Prodotto", fonte: ("CAP", "AdR", "VE-2026-11-13"), vedi: ("LLM", "Dashboard", "Tool", "Plugin"))[
    Detto di un procedimento che, a parità di ingressi, produce sempre lo stesso risultato. Un LLM non lo è: le parti di SpecCheck che richiedono precisione e ripetibilità, come la dashboard e la lettura dei file, sono affidate a componenti deterministiche (#vd("Tool", [tool]), #vd("Plugin", [plugin]) o applicativi esterni). Come ripartire le verifiche tra LLM e componente deterministica non è fissato a priori: per Zucchetti è una domanda di ricerca a cui il progetto deve rispondere.
  ],

  voce("Requisito", cat: "Prodotto", fonte: ("AdR",), vedi: ("Classe di un requisito", "Specifica dei requisiti", "Tracciamento"))[
    Capacità o condizione che SpecCheck deve soddisfare, definita nell'_Analisi dei requisiti_ con un codice, una #vd("Classe di un requisito", [classe]), una descrizione e le fonti da cui discende. Per tipo si distinguono requisiti _funzionali_ (RF, che cosa il sistema fa), _di qualità_ (RQ, come lo fa e con quale documentazione e test), _di vincolo_ (RV, limiti imposti alla realizzazione) e _prestazionali_ (tempi e risorse; il capitolato non ne indica).
  ],

  voce("Classe di un requisito", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("Requisito", "Capitolato"))[
    Grado di necessità di un requisito. _Obbligatorio_ (O): richiesto dal capitolato e non modificabile in corso d'opera. _Desiderabile_ (D): non strettamente necessario, ma con un valore aggiunto riconoscibile. _Opzionale_ (P): realizzabile se il tempo lo consente; i requisiti opzionali possono essere modificati, eliminati o integrati dal gruppo.
  ],

  voce("Script di installazione", cat: "Prodotto", fonte: ("CAP", "AdR"), vedi: ("SpecCheck", "OpenCode"))[
    Script che aggiunge a OpenCode, in una sola operazione, tutte le componenti di SpecCheck (UC1). È richiesto per almeno una tra le shell bash e PowerShell; averlo per entrambe è desiderabile.
  ],

  // ---------------- Strumenti e tecnologie ----------------

  voce("OpenCode", cat: "Strumenti", fonte: ("CAP", "VE-2026-11-13"), vedi: ("Harness", "Skill", "Comando", "Tool", "Plugin"),
    aperto: [la versione di riferimento di OpenCode e i sistemi operativi da supportare sono da fissare entro lo sprint S3 (questione Q8).])[
    #vd("Harness") open source per lo sviluppo assistito da LLM, usato da terminale, su cui SpecCheck si installa e di cui estende le funzioni senza modificarlo. È indicato dal capitolato e consigliato da Zucchetti; include già alcuni modelli gratuiti.
  ],

  voce("Harness", sigla: "agent harness", cat: "Strumenti", fonte: ("AdR", "VE-2026-11-13"), vedi: ("OpenCode", "Agente", "Contesto"))[
    Sistema che avvolge un LLM e lo rende un #vd("Agente", [agente]) operativo: gestisce il #vd("Contesto", [contesto]), mette a disposizione strumenti per leggere e modificare file ed eseguire comandi, e sostiene la pianificazione e la produzione del codice. #vd("OpenCode") è l'harness su cui opera SpecCheck; la compatibilità con altri harness non è richiesta.
  ],

  voce("Agente", sigla: "AI agent", cat: "Strumenti", fonte: ("VE-2026-11-13",), vedi: ("Harness", "LLM"))[
    Sistema basato su un LLM che porta a termine un compito in più passi, decidendo quali strumenti usare e agendo sui file del progetto, ad esempio eseguendo i task di una modifica proposta.
  ],

  voce("LLM", sigla: "Large Language Model", cat: "Strumenti", fonte: ("CAP", "AdR", "VE-2026-11-13"), vedi: ("Modello LLM", "Deterministico", "Modello di piccole dimensioni"))[
    Modello di linguaggio di grandi dimensioni, addestrato su grandi quantità di testo e codice, che genera testo in risposta a una richiesta in linguaggio naturale. Non è #vd("Deterministico", [deterministico]) e, davanti a una specifica ambigua, tende a scioglierla con interpretazioni proprie: per questo le sue valutazioni vanno affiancate da controlli formali.
  ],

  voce("Modello di piccole dimensioni", cat: "Strumenti", fonte: ("CAP", "AdR", "VE-2026-11-13"), vedi: ("LLM",),
    aperto: [modalità di accesso, limiti di costo e necessità di funzionare con i soli modelli piccoli sono da chiarire (questione Q7).])[
    LLM con un numero di parametri contenuto, eseguibile su hardware più modesto e a costo minore, in genere meno capace di un modello di grandi dimensioni. Zucchetti mette a disposizione, su richiesta e con limiti di utilizzo, modelli open source di questo tipo eseguiti sulle proprie GPU (ad esempio Gemma e Qwen); è desiderabile documentare il comportamento delle verifiche anche con questi modelli.
  ],

  voce("Contesto", cat: "Strumenti", fonte: ("AdR",), vedi: ("Harness", "LLM"))[
    Insieme delle informazioni che l'LLM riceve insieme a una richiesta: istruzioni, contenuto dei file, storia della conversazione. È limitato in dimensione, ed è compito dell'harness selezionare ciò che serve.
  ],

  voce("Skill", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Comando", "Tool", "Plugin"),
    aperto: [è da chiarire con Zucchetti se le verifiche debbano partire anche in automatico tramite skill o solo con comandi espliciti (questione Q6).])[
    File guida in linguaggio naturale che descrive all'LLM una procedura operativa. L'harness la attiva da sé quando la ritiene pertinente alla richiesta in corso.
  ],

  voce("Comando", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Skill", "Tool"))[
    Istruzione analoga a una #vd("Skill", [skill]), ma lanciata in modo esplicito dallo sviluppatore. In SpecCheck ogni verifica e l'apertura della dashboard partono da un comando dedicato.
  ],

  voce("Tool", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Skill", "Plugin", "Deterministico"))[
    Procedura esecutiva deterministica, ad esempio uno script, che l'LLM può richiamare per compiti operativi come la lettura di file o il salvataggio degli esiti.
  ],

  voce("Plugin", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Tool", "Dashboard", "Deterministico"),
    aperto: [non è ancora deciso se la componente deterministica sarà un plugin, un applicativo esterno o entrambi, né con quale linguaggio (questione Q5).])[
    Componente software che amplia le capacità di OpenCode e si occupa di elaborazioni complesse. Il prodotto ne deve comprendere almeno uno; può produrre la dashboard in alternativa a un applicativo esterno richiamato da skill e comandi.
  ],

  voce("OpenSpec", cat: "Strumenti", fonte: ("CAP", "VE-2026-11-13"), vedi: ("Sviluppo guidato dalle specifiche", "Agente"))[
    Sistema open source per la gestione delle specifiche, citato dal capitolato come esempio di architettura a comandi, skill ed eseguibile di appoggio. Organizza il lavoro in modifiche: la _proposta_ (`opsx propose`) genera da una richiesta in linguaggio naturale una cartella con proposta, requisito, design ed elenco dei task; l'_applicazione_ (`opsx apply`) fa eseguire i task all'agente; l'_archiviazione_ data la modifica e sincronizza le specifiche consolidate. Secondo Zucchetti gli manca un collegamento con i casi d'uso e una verifica formale del risultato, che è ciò che SpecCheck deve aggiungere.
  ],

  voce("Sviluppo guidato dalle specifiche", sigla: "spec-driven development", cat: "Strumenti", fonte: ("CAP", "VE-2026-11-13"), vedi: ("OpenSpec", "Specifica dei requisiti"))[
    Approccio allo sviluppo con agenti in cui si scrivono prima le specifiche di ciò che va realizzato e poi le si usa per guidare la generazione del codice. Il capitolato ne cita alcuni sistemi come spunto: OpenSpec, Spec-kit e il metodo BMAD.
  ],

  voce("UML", sigla: "Unified Modeling Language", cat: "Strumenti", fonte: ("CAP",), vedi: ("Diagramma dei casi d'uso", "XMI", "PlantUML", "UMLet"))[
    Linguaggio grafico standard, mantenuto dall'Object Management Group, per descrivere la struttura e il comportamento dei sistemi software attraverso diagrammi, tra cui il diagramma dei casi d'uso.
  ],

  voce("Mermaid", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("XMI", "PlantUML", "Diagramma dei casi d'uso"),
    aperto: [il formato atteso per l'MVP è da concordare (questione Q1); va inoltre verificato come rappresentare in Mermaid un diagramma dei casi d'uso. Nell'incontro VE-2026-11-13 Zucchetti ha citato come accettabili anche PlantUML, immagini PNG e ASCII art.])[
    Linguaggio testuale per descrivere diagrammi, che vengono disegnati a partire dal testo e possono essere incorporati nei file Markdown. È uno dei due formati indicati dal capitolato per i diagrammi dei casi d'uso.
  ],

  voce("XMI", sigla: "XML Metadata Interchange", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("UML", "Mermaid"),
    aperto: [vedi la voce #vd("Mermaid") (questione Q1).])[
    Formato standard basato su XML per scambiare modelli UML tra strumenti diversi. È il secondo formato indicato dal capitolato per i diagrammi dei casi d'uso.
  ],

  voce("PlantUML", cat: "Strumenti", fonte: ("CAP", "VE-2026-11-13"), vedi: ("UML", "Mermaid", "UMLet"))[
    Strumento open source che genera diagrammi UML, compresi quelli dei casi d'uso, da una descrizione testuale. Il capitolato lo indica tra gli strumenti testuali per i diagrammi.
  ],

  voce("UMLet", cat: "Strumenti", fonte: ("CAP",), vedi: ("UML", "PlantUML"))[
    Editor open source per diagrammi UML che salva i diagrammi in un formato testuale. Il capitolato lo indica tra gli strumenti per i diagrammi.
  ],

  voce("Markdown", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Documentazione aggiuntiva", "Specifica dei requisiti"))[
    Linguaggio di marcatura leggero, che formatta il testo semplice con pochi simboli (ad esempio `#` per i titoli). Per l'MVP è il formato atteso della documentazione dei casi d'uso e delle specifiche dei requisiti.
  ],

  voce("Open source", cat: "Strumenti", fonte: ("CAP", "AdR"), vedi: ("Repository",),
    aperto: [la licenza da adottare è da concordare con Zucchetti (questione Q12).])[
    Detto di un software il cui codice sorgente è pubblicato con una licenza che ne permette a chiunque l'uso, lo studio, la modifica e la redistribuzione. È desiderabile che SpecCheck sia pubblicato in un repository pubblico con una licenza di questo tipo.
  ],

  voce("Typst", cat: "Strumenti", fonte: ("NdP",), vedi: ("Template",))[
    Linguaggio di composizione tipografica con cui il gruppo scrive tutti i documenti. I sorgenti `.typ` si compilano in PDF dalla radice della repository con `typst compile --root .`.
  ],

  voce("Template", cat: "Strumenti", fonte: ("NdP",), vedi: ("Typst", "Registro delle modifiche"))[
    Modello Typst riutilizzabile, nella cartella `templates/` della repository, che fornisce copertina, intestazioni, stile e componenti comuni a un tipo di documento (documento generico, verbale interno ed esterno, diario di bordo).
  ],

  voce("Git", cat: "Strumenti", fonte: ("NdP",), vedi: ("GitHub", "Repository", "Commit", "Branch"))[
    Sistema distribuito di controllo di versione con cui il gruppo registra la storia delle modifiche al codice e alla documentazione.
  ],

  voce("GitHub", cat: "Strumenti", fonte: ("NdP",), vedi: ("Git", "Issue", "Pull request", "GitHub Project", "GitHub Actions"))[
    Piattaforma che ospita le repository Git e ne gestisce issue, pull request e automazioni. L'organizzazione del gruppo è `github.com/hex4dev`.
  ],

  voce("GitHub Project", cat: "Strumenti", fonte: ("VI-2026-11-16",), vedi: ("Issue", "Sprint"))[
    Strumento di GitHub per pianificare le attività: raccoglie le issue in viste per sprint, stato e responsabile. Il gruppo lo usa per pianificare il lavoro.
  ],

  voce("GitHub Actions", cat: "Strumenti", fonte: ("README",), vedi: ("Sito della documentazione", "Pull request"))[
    Servizio di GitHub che esegue automazioni (_workflow_) al verificarsi di eventi sulla repository. Nella repository della documentazione compila e pubblica il sito a ogni push su `main`, genera un'anteprima dei documenti nelle pull request e supporta l'approvazione dei rilasci.
  ],

  voce("Sito della documentazione", cat: "Strumenti", fonte: ("README", "VI-2026-11-11"), vedi: ("GitHub Actions", "Typst"))[
    Sito statico, pubblicato su GitHub Pages all'indirizzo `hex4dev.github.io/docs` e generato con Astro, che raccoglie i PDF dei documenti del gruppo divisi per sezione (Candidatura, RTB) e per categoria.
  ],

  // ---------------- Processo e organizzazione ----------------

  voce("Hex4dev", cat: "Processo", fonte: ("NdP", "VI-2026-11-16"), vedi: ("Proponente", "Committente"))[
    Nome del gruppo 14 del corso di Ingegneria del Software, a.a. 2026/2027, composto da sei componenti. Nei documenti si scrive con l'iniziale maiuscola; il nome dell'organizzazione GitHub, `hex4dev`, resta in minuscolo perché non è modificabile.
  ],

  voce("Capitolato", cat: "Processo", fonte: ("CAP", "DI"), vedi: ("Proponente", "Classe di un requisito"))[
    Documento con cui un'azienda proponente descrive il prodotto che chiede di realizzare, con requisiti obbligatori, desiderabili e opzionali e vincoli di progetto. Il gruppo lavora sul capitolato C9 – _SpecCheck_ di Zucchetti S.p.A.
  ],

  voce("Proponente", cat: "Processo", fonte: ("CAP", "VE-2026-11-13"), vedi: ("Committente", "Capitolato"),
    nota: [la _proponente_ definisce il prodotto e ne valuta l'aderenza alle attese; il #vd("Committente", [committente]) valuta il progetto ai fini del corso.])[
    Azienda che propone il capitolato e segue il gruppo durante il progetto: per il C9 è Zucchetti S.p.A., rappresentata da un referente. Prima di ogni revisione con i docenti il gruppo si confronta con la proponente per verificare che il lavoro corrisponda alle sue aspettative.
  ],

  voce("Committente", cat: "Processo", vedi: ("Proponente", "Revisione"))[
    Nel progetto didattico, i docenti del corso di Ingegneria del Software: ricevono le consegne ufficiali del gruppo e ne valutano l'avanzamento nelle revisioni.
  ],

  voce("Candidatura", cat: "Processo", fonte: ("VI-2026-11-11", "NdP"), vedi: ("RTB", "Dichiarazione degli impegni"))[
    Fase iniziale del progetto, in cui il gruppo valuta i capitolati e presenta lettera di presentazione, valutazione dei capitolati e dichiarazione degli impegni per ottenere l'assegnazione di un capitolato. I suoi documenti sono nella cartella `candidatura/`.
  ],

  voce("Revisione", cat: "Processo", fonte: ("NdP", "VE-2026-11-13"), vedi: ("RTB", "PB", "Versione"),
    nota: [si parla di «revisione» anche per ogni modifica approvata di un documento, che ne incrementa la #vd("Versione", [versione]) e aggiunge una riga al #vd("Registro delle modifiche", [registro delle modifiche]).])[
    Momento di valutazione formale dell'avanzamento del progetto da parte dei docenti, al termine di un periodo di lavoro: le revisioni del progetto sono la #vd("RTB") e la #vd("PB").
  ],

  voce("RTB", sigla: "Requirements and Technology Baseline", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("PB", "PoC", "Revisione"))[
    Prima revisione di avanzamento: fissa i requisiti del prodotto, le scelte tecnologiche e un #vd("PoC") che ne dimostra la fattibilità. Chiude il primo periodo di lavoro (sprint S1–S6); i documenti prodotti per questa fase sono nella cartella `rtb/`.
  ],

  voce("PB", sigla: "Product Baseline", cat: "Processo", fonte: ("DI",), vedi: ("RTB", "MVP", "Revisione"))[
    Seconda revisione di avanzamento: valuta la progettazione e il prodotto realizzato, cioè l'#vd("MVP"). Chiude il secondo periodo di lavoro (sprint S7–S10), con consegna prevista il 2027-04-02.
  ],

  voce("PoC", sigla: "Proof of Concept", cat: "Processo", fonte: ("CAP", "DI", "VE-2026-11-13"), vedi: ("MVP", "RTB"))[
    Prototipo che dimostra la fattibilità delle parti più incerte del prodotto prima di realizzarlo. Per SpecCheck il capitolato consiglia di esplorare soprattutto la lettura dei diagrammi dei casi d'uso e gli algoritmi di confronto.
  ],

  voce("MVP", sigla: "Minimum Viable Product", cat: "Processo", fonte: ("CAP", "DI", "VE-2026-11-13"), vedi: ("PoC", "PB", "Classe di un requisito"))[
    Versione del prodotto che realizza tutti i requisiti obbligatori del capitolato ed è utilizzabile per lo scopo previsto. È l'oggetto della consegna finale.
  ],

  voce("Sprint", cat: "Processo", fonte: ("NdP", "DI", "VI-2026-11-16"), vedi: ("Ruolo", "Retrospettiva", "Periodo"))[
    Intervallo di lavoro di due settimane, con obiettivi pianificati all'inizio e verificati alla fine; gli sprint sono numerati S1, S2, … Nella prima riunione di ogni sprint il gruppo svolge la #vd("Retrospettiva", [retrospettiva]), assegna i ruoli e pianifica il lavoro. Il primo sprint va dal 2026-11-11 al 2026-11-22.
  ],

  voce("Periodo", cat: "Processo", fonte: ("DI",), vedi: ("Sprint", "RTB", "PB"))[
    Insieme di sprint che porta a una revisione. Il periodo 1 (S1–S6) termina con la RTB, il periodo 2 (S7–S10) con la PB.
  ],

  voce("Retrospettiva", cat: "Processo", fonte: ("VI-2026-11-16",), vedi: ("Sprint", "Consuntivo", "Diario di bordo"))[
    Momento, all'inizio di uno sprint, in cui il gruppo esamina come è andato lo sprint precedente (risultati, difficoltà, ore svolte) per migliorare il modo di lavorare.
  ],

  voce("Preventivo", cat: "Processo", fonte: ("DI",), vedi: ("Consuntivo", "Dichiarazione degli impegni"))[
    Stima iniziale di ore e costi del progetto, per ruolo e per periodo, riportata nella _Dichiarazione degli impegni_: 540 ore produttive in totale, 90 per componente.
  ],

  voce("Consuntivo", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Preventivo", "Piano di progetto"))[
    Rendiconto delle ore e dei costi effettivamente sostenuti in uno sprint, per componente e per ruolo, ricavato dalle issue e confrontato con il preventivo. È registrato nel verbale e nel _Piano di progetto_.
  ],

  voce("Ruolo", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Responsabile", "Amministratore", "Analista", "Progettista", "Programmatore", "Verificatore"))[
    Funzione di progetto ricoperta da un componente in uno sprint. I ruoli sono sei: #vd("Responsabile"), #vd("Amministratore"), #vd("Analista"), #vd("Progettista"), #vd("Programmatore") e #vd("Verificatore"). Ogni componente ricopre un solo ruolo per sprint e nessuno ricopre lo stesso ruolo per più di due sprint consecutivi; in ogni sprint ci sono un solo Responsabile, un solo Amministratore e almeno un Verificatore.
  ],

  voce("Responsabile", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Ruolo", "Approvazione a rilascio", "Diario di bordo"))[
    Ruolo che coordina il gruppo nello sprint: pianifica e assegna le attività, tiene i rapporti con la proponente e con i docenti attraverso l'indirizzo email del gruppo, aggiorna il registro delle ore e presenta il diario di bordo. È l'unico che approva il rilascio dei documenti.
  ],

  voce("Amministratore", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Ruolo", "Repository", "Norme di progetto"))[
    Ruolo che cura l'ambiente di lavoro del gruppo: strumenti, repository, sito, automazioni e tracciamento delle attività su GitHub, oltre alla stesura delle _Norme di progetto_. Può ricevere dal verbalizzante la delega a registrare le issue.
  ],

  voce("Analista", cat: "Processo", fonte: ("DI",), vedi: ("Ruolo", "Analisi dei requisiti"))[
    Ruolo che studia il capitolato e il dominio, individua i casi d'uso e definisce i requisiti nell'_Analisi dei requisiti_. Concentra le proprie ore nel primo periodo, prima della RTB.
  ],

  voce("Progettista", cat: "Processo", fonte: ("DI",), vedi: ("Ruolo", "Programmatore"))[
    Ruolo che definisce l'architettura del prodotto e le scelte tecniche con cui realizzare i requisiti.
  ],

  voce("Programmatore", cat: "Processo", fonte: ("DI",), vedi: ("Ruolo", "Progettista", "Test automatico"))[
    Ruolo che realizza il prodotto secondo la progettazione, insieme ai test automatici. Poiché il codice è prodotto anche con l'aiuto di agenti, gli è affidato soprattutto il governo e il controllo di ciò che viene generato.
  ],

  voce("Verificatore", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Ruolo", "Verifica", "Pull request"))[
    Ruolo che controlla i prodotti degli altri componenti prima che siano integrati: esamina le pull request, segnala i problemi all'autore e ne verifica la correzione. Nessuno verifica un proprio prodotto; il verificatore di un verbale deve aver partecipato alla riunione.
  ],

  voce("Verifica", cat: "Processo", fonte: ("NdP",), vedi: ("Verificatore", "Validazione", "Pull request"),
    nota: [le _verifiche_ di SpecCheck (#vd("Verifica casi d'uso – requisiti", [casi d'uso – requisiti]) e #vd("Verifica requisiti – codice", [requisiti – codice])) sono invece funzioni del prodotto, che controllano gli artefatti del progetto verificato.])[
    Processo che controlla che un prodotto del lavoro (documento o codice) sia corretto, coerente con le decisioni del gruppo e completo rispetto all'attività assegnata. Si svolge sulla pull request, prima del merge, ad opera di un verificatore diverso dall'autore.
  ],

  voce("Validazione", cat: "Processo", fonte: ("NdP",), vedi: ("Verifica", "Piano di qualifica"))[
    Processo che accerta che il prodotto finito soddisfi i requisiti e le attese della proponente. Criteri e modalità sono stabiliti nel _Piano di qualifica_.
  ],

  voce("Approvazione a rilascio", cat: "Processo", fonte: ("VI-2026-11-11", "VI-2026-11-16"), vedi: ("Responsabile", "Versione"))[
    Atto con cui il Responsabile in carica nello sprint autorizza la pubblicazione di un documento, dopo la verifica. È richiesta per ogni pubblicazione ed è riportata nel documento stesso.
  ],

  voce("Way of working", cat: "Processo", fonte: ("VI-2026-11-11",), vedi: ("Norme di progetto",))[
    Insieme delle regole e delle pratiche con cui il gruppo svolge il lavoro: strumenti, convenzioni, ruoli, processi di verifica. Per Hex4dev è descritto nelle _Norme di progetto_.
  ],

  voce("Norme di progetto", sigla: "NdP", cat: "Processo", fonte: ("NdP", "VI-2026-11-11"), vedi: ("Way of working", "Glossario"))[
    Documento che descrive il #vd("Way of working", [way of working]) di Hex4dev: processi primari, di supporto e organizzativi, convenzioni sui documenti, sulla repository e sul versionamento. Si trova in `common/norme-di-progetto/`.
  ],

  voce("Analisi dei requisiti", sigla: "AdR", cat: "Processo", fonte: ("AdR",), vedi: ("Requisito", "Caso d'uso", "Analista"))[
    Documento che descrive che cosa deve fare SpecCheck: utenti, casi d'uso, requisiti con le loro fonti, tracciamento e questioni aperte da sottoporre alla proponente. È il riferimento per la progettazione e per i test. Si trova in `rtb/analisi-dei-requisiti/`.
  ],

  voce("Piano di progetto", sigla: "PdP", cat: "Processo", fonte: ("DI", "NdP"), vedi: ("Preventivo", "Consuntivo", "Sprint"))[
    Documento che pianifica il progetto sprint per sprint: attività, ruoli, scadenze, rischi, preventivo e consuntivo di ore e costi.
  ],

  voce("Piano di qualifica", sigla: "PdQ", cat: "Processo", fonte: ("NdP", "AdR"), vedi: ("Verifica", "Validazione", "Copertura"))[
    Documento che fissa gli obiettivi di qualità del prodotto e dei processi e le strategie di verifica e validazione, compresi i test di sistema e di accettazione e la soglia di copertura dei test.
  ],

  voce("Glossario", cat: "Processo", fonte: ("VI-2026-11-11", "VI-2026-11-16", "NdP"), vedi: ("Norme di progetto",))[
    Il presente documento: definisce in modo univoco i termini usati nei documenti del gruppo. Si trova in `common/glossario/`.
  ],

  voce("Dichiarazione degli impegni", cat: "Processo", fonte: ("DI",), vedi: ("Preventivo", "Ruolo", "Candidatura"))[
    Documento della candidatura con cui il gruppo dichiara le ore che si impegna a svolgere, la loro ripartizione per ruolo e per periodo, il preventivo dei costi e la data di consegna.
  ],

  voce("Diario di bordo", cat: "Processo", fonte: ("NdP", "VI-2026-11-11"), vedi: ("Responsabile", "Retrospettiva"))[
    Breve resoconto presentato dal Responsabile dello sprint, che riassume attività completate, attività previste e difficoltà emerse. Il Responsabile può delegarne la stesura; i diari si trovano in `common/diari-di-bordo/AAAA-MM-GG/`.
  ],

  voce("Verbale", cat: "Processo", fonte: ("NdP",), vedi: ("Verbalizzante", "Decisione", "Attività"))[
    Documento che registra una riunione: partecipanti, ordine del giorno, resoconto, decisioni, attività assegnate e prossima riunione. È _interno_ (codice `VI-AAAA-MM-GG`) per le riunioni del solo gruppo ed _esterno_ (codice `VE-AAAA-MM-GG`) per gli incontri con la proponente o con altre entità esterne; quello esterno viene verificato prima dell'invio alla proponente.
  ],

  voce("Verbalizzante", cat: "Processo", fonte: ("NdP", "VI-2026-11-16"), vedi: ("Verbale", "Issue"))[
    Componente designato all'inizio di una riunione, o prima di un incontro esterno, per redigerne il verbale e registrare su GitHub le issue delle attività concordate.
  ],

  voce("Decisione", cat: "Processo", fonte: ("VI-2026-11-11", "VI-2026-11-16"), vedi: ("Attività", "Verbale", "Tracciamento"))[
    Scelta approvata dal gruppo in una riunione e registrata nel verbale con un identificativo progressivo (D1, D2, …). Ogni decisione rimanda alle attività che la attuano, oppure indica che non ne richiede.
  ],

  voce("Attività", cat: "Processo", fonte: ("NdP", "VI-2026-11-11"), vedi: ("Decisione", "Issue", "Verbale"))[
    Compito assegnato in una riunione, con responsabile e scadenza sempre definiti. Nel verbale ha un identificativo formato dal codice del verbale e da un progressivo (ad esempio `VI-2026-11-16-A2`), rimanda alla decisione da cui discende e, quando esiste, alla issue GitHub corrispondente.
  ],

  voce("Repository", cat: "Processo", fonte: ("NdP", "README"), vedi: ("Git", "Branch", "Sito della documentazione"))[
    Archivio versionato con Git che contiene i file di un progetto e la loro storia. La repository della documentazione è organizzata per fase e funzione: `common/` (documenti condivisi tra le fasi), `candidatura/`, `rtb/`, `templates/`, `assets/`, `scripts/` e `sito/`.
  ],

  voce("Branch", cat: "Processo", fonte: ("NdP", "VI-2026-11-16"), vedi: ("Pull request", "Merge", "Commit"))[
    Linea di sviluppo separata all'interno di una repository. Ogni modifica si sviluppa su un branch dedicato, con nome in minuscolo, parole separate da trattini e un prefisso facoltativo (ad esempio `documentazione/norme-di-progetto`), e viene integrata nel branch principale `main`; dopo il merge il branch è eliminato.
  ],

  voce("Commit", cat: "Processo", fonte: ("NdP",), vedi: ("Conventional Commits", "Branch", "Issue"))[
    Registrazione in Git di un insieme circoscritto di modifiche, accompagnata da un messaggio che le descrive. Il commit che completa un'attività aggiunge in coda `- Closes #N`, così che la issue `N` venga chiusa all'integrazione in `main`.
  ],

  voce("Conventional Commits", cat: "Processo", fonte: ("NdP",), vedi: ("Commit",))[
    Convenzione, versione 1.0.0, per scrivere i messaggi di commit nella forma `tipo: descrizione`. Il gruppo tiene il tipo in inglese (ad esempio `docs`, `fix`, `ci`) e la descrizione in italiano, con un verbo al participio passato: `docs: redatto verbale interno del 2026-11-11`.
  ],

  voce("Issue", cat: "Processo", fonte: ("NdP", "DI"), vedi: ("Attività", "Pull request", "GitHub Project"))[
    Scheda di GitHub che descrive un'attività, con responsabile, scadenza, sprint, ruolo con cui viene svolta e ore impiegate. Viene collegata alla pull request che la completa e si chiude al suo merge; dalle issue il Responsabile ricava il consuntivo delle ore.
  ],

  voce("Pull request", sigla: "PR", cat: "Processo", fonte: ("NdP",), vedi: ("Branch", "Merge", "Verifica", "Issue"))[
    Richiesta di integrare le modifiche di un branch nel branch `main`. È lo strumento con cui il verificatore esamina la modifica e segnala i problemi prima del merge; nessuno approva una pull request che contiene modifiche proprie.
  ],

  voce("Merge", cat: "Processo", fonte: ("NdP",), vedi: ("Pull request", "Branch"))[
    Integrazione delle modifiche di un branch in un altro, nel progetto in `main`, eseguita dopo la verifica della pull request.
  ],

  voce("Versione", cat: "Processo", fonte: ("NdP", "VI-2026-11-16"), vedi: ("Registro delle modifiche", "Approvazione a rilascio"))[
    Identificativo dello stato di un documento, nella forma `M.m`. Tutti i documenti partono da 0.1; la versione minore `m` cresce a ogni modifica, anche oltre il 9 (0.9 → 0.10); la versione maggiore `M` cresce all'approvazione per la pubblicazione o per modifiche sostanziali. La versione in copertina coincide con la prima riga del registro delle modifiche.
  ],

  voce("Registro delle modifiche", cat: "Processo", fonte: ("NdP",), vedi: ("Versione", "Verificatore"))[
    Tabella che precede l'indice di ogni documento e riporta, dalla più recente, le revisioni con versione, data, autore, verificatore e descrizione. Autore e verificatore di una revisione sono componenti diversi.
  ],

  voce("Test automatico", cat: "Processo", fonte: ("CAP", "AdR"), vedi: ("Copertura", "Piano di qualifica", "Deterministico"),
    aperto: [come trattare nei test i risultati non deterministici degli LLM è da chiarire con Zucchetti (questione Q9).])[
    Prova eseguita da un programma, senza intervento manuale, che controlla che il prodotto si comporti come atteso. Dall'MVP SpecCheck deve essere accompagnato da test automatici che ripetano i casi d'uso principali, così da poterlo verificare a ogni revisione.
  ],

  voce("Pattern architetturale", cat: "Processo", fonte: ("CAP", "AdR"), vedi: ("Progettista",))[
    Soluzione di progettazione consolidata per un problema ricorrente nell'organizzazione di un sistema software. Il capitolato chiede di adottare pattern di comprovata duttilità e robustezza, che permettano di rivedere ed estendere il codice a ogni iterazione.
  ],
)

// ------------------------------------------------------------
//  Ordinamento e raggruppamento
// ------------------------------------------------------------
#let _ordinate = voci.sorted(key: e => lower(e.termine))
#let _iniziale(e) = upper(e.termine.clusters().first())
#let _lettere = _ordinate.map(_iniziale).dedup()
#let _conta(cat) = voci.filter(e => e.cat == cat).len()

// ============================================================
= Introduzione

== Scopo del documento
Il _Glossario_ definisce in modo univoco i termini che compaiono nei documenti di Hex4dev per il capitolato C9 – _SpecCheck_ di Zucchetti S.p.A. Serve a chi legge un documento del gruppo senza aver partecipato al lavoro che lo ha prodotto, e al gruppo stesso per usare ogni termine sempre con lo stesso significato.

Il documento raccoglie tre famiglie di termini, indicate da un'etichetta accanto a ogni voce:
- *Prodotto*: il dominio di SpecCheck, cioè la tracciabilità tra casi d'uso, specifiche e codice, e i concetti dell'_Analisi dei requisiti_ (#_conta("Prodotto") voci);
- *Strumenti*: le tecnologie su cui il prodotto si basa e quelle che il gruppo usa per lavorare (#_conta("Strumenti") voci);
- *Processo*: l'organizzazione del progetto didattico e il _way of working_ del gruppo (#_conta("Processo") voci).

Questa prima versione contiene #voci.len() voci, ricavate dai documenti già prodotti. Le definizioni di dominio dipendono in parte dalle questioni ancora aperte con la proponente: le voci interessate lo segnalano.

== Come leggere una voce
Le voci sono in ordine alfabetico e raggruppate per lettera iniziale. Ognuna riporta:
- il *termine*, seguito tra parentesi dalla sigla o dalla forma estesa quando esiste, e la *famiglia* a cui appartiene;
- la *definizione*, riferita all'uso del termine nel progetto; i termini in _corsivo_ rimandano ad altre voci e sono collegamenti cliccabili;
- se il termine si presta a confusione, un riquadro *Da distinguere* che indica con quale altro significato non va confuso;
- se la definizione dipende da un punto non ancora chiarito, un riquadro *Punto aperto* con il riferimento alla questione corrispondente dell'_Analisi dei requisiti_;
- la *fonte*, cioè il documento da cui il termine e la sua definizione derivano (sigle nella @tab-fonti), e i rimandi alle voci collegate.

#figure(
  tab((left, left), (3.4cm, 1fr), ("Sigla", "Documento"), (
    [*CAP*], [Capitolato d'appalto C9 – _SpecCheck_, Zucchetti S.p.A., a.a. 2026/2027],
    [*AdR*], [_Analisi dei requisiti_, Hex4dev, versione 0.1 del 2026-11-15],
    [*NdP*], [_Norme di progetto_, Hex4dev, versione 0.3 del 2026-11-23],
    [*DI*], [_Dichiarazione degli impegni_, Hex4dev, versione 2.0 del 2026-11-09],
    [*VE-2026-11-13*], [Verbale esterno del primo incontro con Zucchetti, 2026-11-13],
    [*VI-2026-11-11*], [Verbale interno del 2026-11-11],
    [*VI-2026-11-16*], [Verbale interno del 2026-11-16],
    [*README*], [Descrizione della repository della documentazione (`README.md`)],
  )),
  kind: table,
  supplement: [Tabella],
  caption: [Sigle delle fonti],
) <tab-fonti>

== Aggiornamento del glossario
Il glossario segue le regole di gestione della configurazione delle _Norme di progetto_: ogni modifica si sviluppa su un branch dedicato, è verificata in una pull request da un componente diverso dall'autore e aggiunge una riga al registro delle modifiche. In particolare:
+ chi introduce in un documento un termine tecnico o di dominio non ancora definito lo aggiunge al glossario nella stessa pull request, oppure apre una issue per farlo;
+ quando un punto aperto viene chiarito con la proponente, la voce è aggiornata e il riquadro rimosso, con un rimando al verbale esterno che riporta la risposta;
+ un termine che cambia significato non viene duplicato: la voce esistente è riscritta e la modifica descritta nel registro.

== Riferimenti
=== Riferimenti normativi
- _Norme di progetto_, Hex4dev, versione 0.3.
- Capitolato d'appalto C9 – _SpecCheck: sviluppo di skill per OpenCode per la verifica della tracciabilità end-to-end da casi d'uso a requisiti e codice sorgente_, Zucchetti S.p.A.

=== Riferimenti informativi
- _Analisi dei requisiti_, Hex4dev, versione 0.1.
- _Dichiarazione degli impegni_, Hex4dev, versione 2.0.
- Verbali interni VI-2026-11-11 e VI-2026-11-16; verbale esterno VE-2026-11-13.
- OpenCode: #link("https://opencode.ai/"). OpenSpec: #link("https://openspec.dev/").
- Conventional Commits 1.0.0: #link("https://www.conventionalcommits.org/en/v1.0.0/").

// ============================================================
= Voci del glossario

#block(width: 100%, fill: colore-sfondo, inset: (x: 10pt, y: 8pt), radius: 3pt, {
  set par(justify: false)
  align(center, _lettere.map(l => link(label("lettera-" + l), text(size: 12pt, weight: "bold", fill: colore-primario)[#l])).join(h(0.9em)))
})

#for l in _lettere {
  [#metadata(l)#label("lettera-" + l)]
  heading(level: 2, numbering: none)[#l]
  for e in _ordinate.filter(e => _iniziale(e) == l) { _mostra(e) }
}
