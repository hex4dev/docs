#import "/templates/documento.typ": documento, tabella, colore-sfondo

#show: documento.with(
  titolo: "Dichiarazione degli impegni",
  sottotitolo: "Ingegneria del Software · a.a. 2026/2027",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "1.0",
  data: "2026-11-05",
  uso: "Esterno",
  redattori: ("Alessandro Zanier", "Andrea Nogara", "Francesco Bassani"),
  verificatori: ("Francesco Bassani", "Alessandro Ravenna"),
  registro: (
    ("1.0", "2026-11-03", "Francesco Bassani", "Alessandro Ravenna", "Riscrittura completa per il capitolato C7 – SmartDashboard"),
    ("0.2", "2026-10-29", "Andrea Nogara", "Alessandro Ravenna", "Continuazione stesura"),
    ("0.1", "2026-10-28", "Alessandro Zanier", "Francesco Bassani", "Prima stesura"),
  ),
)

// Le tabelle sono figure numerate, con didascalia sopra
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: set text(size: 10pt)
#show figure: set block(breakable: false)
#set table.cell(breakable: false)
#let tab(al, ..args) = { set table(align: al); tabella(..args) }

#v(0.6cm)
#heading(numbering: none, outlined: false)[Elenco delle tabelle]
#outline(title: none, target: figure.where(kind: table))

= Introduzione

== Scopo del documento
Questo documento raccoglie gli impegni che Hex4dev assume per il capitolato *C7 – SmartDashboard: piattaforma di Business Intelligence self-service potenziata da AI*, proposto da Ergon Informatica Srl. Descrive come il gruppo intende distribuire il proprio tempo tra i ruoli del progetto, quanto costerà il prodotto, come saranno organizzati i ruoli nel corso del lavoro, da quali tecnologie intende partire, quale calendario il gruppo si propone di seguire e quali rischi prevede, e si chiude con il riepilogo degli impegni: data di consegna, ore e costo complessivo. È destinato al Prof. Tullio Vardanega e al Prof. Riccardo Cardin.

Le cifre qui riportate sono il punto di partenza del _Piano di Progetto_: dopo l'aggiudicazione il gruppo vi dettaglierà la pianificazione sprint per sprint e, alla fine di ogni periodo, confronterà ore e costi effettivi con questo preventivo.

== Criteri di verifica
Chi verifica il documento controlla i punti seguenti e ne riporta l'esito nel registro delle modifiche.
+ Ogni componente ha 90 ore e il totale del gruppo è 540 ore.
+ Le ore per ruolo coincidono nella ripartizione per componente, nel preventivo per ruolo e nella somma dei due periodi.
+ Il costo di ogni ruolo è il prodotto di ore e costo orario; la somma dei costi è 11.040,00 € ed è uguale alla somma dei costi dei due periodi.
+ Le ore degli sprint nel calendario sommano a 540 e, sommate per periodo, coincidono con la tabella dei periodi.
+ I ruoli iniziali rispettano le regole di organizzazione dei ruoli e le loro ore coincidono con quelle previste per il primo sprint.
+ Le date degli sprint sono consecutive, dal 2026-11-11 al 2027-04-02, e la data di consegna coincide con quella degli impegni assunti.
+ Ogni affermazione sul prodotto trova riscontro nel capitolato C7 o nel verbale dell'incontro con Ergon del 2026-10-28, e ogni decisione organizzativa nei verbali interni o in questo documento.
+ Ogni versione del registro delle modifiche ha un autore e un verificatore diversi.

= Ripartizione delle ore

#figure(
  tab((left, center, center, center, center, center, center, center),
    (4cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    ("Componente", "Re", "Am", "An", "Pg", "Pr", "Ve", "Totale"),
    (
      [Matteo Angelini], [9], [7], [12], [20], [24], [18], [*90*],
      [Francesco Bassani], [9], [7], [12], [20], [24], [18], [*90*],
      [Andrea Nogara], [9], [7], [12], [20], [24], [18], [*90*],
      [Matilde Pedrocchi], [9], [7], [12], [20], [24], [18], [*90*],
      [Alessandro Ravenna], [9], [7], [12], [20], [24], [18], [*90*],
      [Alessandro Zanier], [9], [7], [12], [20], [24], [18], [*90*],
      [*Totale*], [*54*], [*42*], [*72*], [*120*], [*144*], [*108*], [*540*],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Ore produttive preventivate per componente e per ruolo],
) <tab-ore>

Re = Responsabile, Am = Amministratore, An = Analista, Pg = Progettista, Pr = Programmatore, Ve = Verificatore.

Ogni componente si impegna per 90 ore e ricopre, nel corso del progetto, tutti e sei i ruoli. Il gruppo ha scelto la stessa ripartizione per tutti: i ruoli non sono fissati in anticipo per l'intero progetto ma assegnati sprint per sprint (sezione #ref(<sez-ruoli>, supplement: none)), e una quota uguale per ciascuno è il riferimento più semplice per decidere le assegnazioni e per controllare che la rotazione resti equa. Le ore sono quindi un obiettivo per componente: alla fine del progetto le ore effettive in un ruolo potranno discostarsi di qualche ora da quelle della tabella, mentre il totale di 90 ore per componente resta fisso. Gli scostamenti per ruolo sono registrati a ogni consuntivo nel _Piano di Progetto_.

= Preventivo dei costi

#figure(
  tab((left, center, center, center, center),
    (1fr, 1fr, 1fr, 1fr, 1.2fr),
    ("Ruolo", "Ore", "Quota ore", "Costo orario", "Costo"),
    (
      [Responsabile], [54], [10,0%], [30,00 €], [1.620,00 €],
      [Amministratore], [42], [7,8%], [20,00 €], [840,00 €],
      [Analista], [72], [13,3%], [25,00 €], [1.800,00 €],
      [Progettista], [120], [22,2%], [25,00 €], [3.000,00 €],
      [Programmatore], [144], [26,7%], [15,00 €], [2.160,00 €],
      [Verificatore], [108], [20,0%], [15,00 €], [1.620,00 €],
      [*Totale*], [*540*], [*100%*], [], [*11.040,00 €*],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Preventivo dei costi per ruolo],
) <tab-costi>

*Perché questa ripartizione.* SmartDashboard copre l'intero percorso del dato: recupero dal gestionale, archivio dei dati grezzi, data warehouse con modello dimensionale, una web application per costruire dashboard in modalità drag & drop e un layer di intelligenza artificiale che genera visualizzazioni da richieste in linguaggio naturale. La maggior parte del lavoro è quindi di realizzazione e progettazione: Programmatore (26,7%) e Progettista (22,2%) hanno le quote più alte. Il Progettista pesa molto perché il capitolato chiede livelli con responsabilità separate, un modello dimensionale per il data warehouse e, come requisito desiderabile, una sorgente dati sostituibile, decisioni che conviene prendere con cura prima di scrivere il codice.

*Programmatore e Verificatore.* Il gruppo non ha ripartito in modo paritario le ore dei due ruoli e ha fissato un rapporto di 1 ora di Programmatore ogni 0,75 ore di Verificatore (144 contro 108). Poiché il codice non è più scritto interamente a mano, il Programmatore svolge già una prima verifica di ciò che produce; il Verificatore scrive i test, controlla che la copertura raggiunga la soglia che sarà fissata nel _Piano di Qualifica_ e verifica i documenti. Nel C7 ha in più un compito specifico: le risposte del modello di linguaggio non si possono validare in modo deterministico, e come concordato con Ergon si costruiscono casi di test con richieste di esempio e una valutazione qualitativa delle risposte. Per questo la sua quota (20,0%) resta alta pur essendo inferiore a quella del Programmatore.

*Analista, Responsabile e Amministratore.* L'Analista ha il 13,3% delle ore, quasi tutte prima della RTB. Il capitolato elenca molte funzionalità (libreria di widget con tabelle pivot e mappe, filtri, esportazione, versione mobile, quattro capacità AI) e raccomanda di classificare i requisiti in obbligatori, desiderabili e facoltativi per non arrivare a molte funzionalità abbozzate: è un lavoro di analisi che va fatto bene e presto. Responsabile (10,0%) e Amministratore (7,8%) lavorano in ogni sprint, ma con un carico contenuto: il Responsabile è il ruolo più costoso e il suo tempo va limitato al coordinamento, mentre una parte degli strumenti dell'Amministratore, come il repository e il sito della documentazione, è già stata predisposta durante la candidatura.

#figure(
  tab((left, center, center, center, center, center, center, center, center),
    (4cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 3cm),
    ("Periodo", "Re", "Am", "An", "Pg", "Pr", "Ve", "Ore", "Costo"),
    (
      [Periodo 1 (S1–S6, RTB)], [31], [25], [64], [56], [56], [56], [288], [6.110,00 €],
      [Periodo 2 (S7–S10, PB)], [23], [17], [8], [64], [88], [52], [252], [4.930,00 €],
      [*Totale*], [*54*], [*42*], [*72*], [*120*], [*144*], [*108*], [*540*], [*11.040,00 €*],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Ore e costi preventivati per periodo],
) <tab-periodi>

*I due periodi.* Il primo periodo porta alla Requirements and Technology Baseline: requisiti concordati con Ergon, scelte tecnologiche e un PoC che dimostri il percorso del dato dal dump fino a un grafico. L'Analista vi concentra quasi tutte le sue ore (64 su 72), e anche Responsabile e Amministratore vi pesano di più in proporzione (19,4% delle ore del periodo contro 15,9% nel secondo), perché in questa fase si impostano strumenti, norme e pianificazione. Il secondo periodo porta alla Product Baseline: progettazione e codifica dell'MVP, con la quota principale del Programmatore (88 ore) e una verifica che si sposta dai documenti al codice e alle risposte del layer AI. Il primo periodo ha più ore in totale (288 contro 252) ma meno ore per sprint, circa 48 contro circa 63, perché comprende un primo sprint di soli dodici giorni, le festività di fine anno e l'inizio della sessione d'esame. La ripartizione per sprint e per ruolo non è fissata qui: dipende dalle assegnazioni decise a ogni sprint e sarà riportata nel _Piano di Progetto_.

= Organizzazione dei ruoli <sez-ruoli>

*Sprint e incontri.* Il lavoro è organizzato in dieci sprint di due settimane, che iniziano di lunedì (salvo il primo, che parte mercoledì 2026-11-11). La durata coincide con la cadenza dell'allineamento ricorrente che Ergon propone ogni quindici giorni: il gruppo chiederà di fissarlo verso la fine di ogni sprint, così da mostrare l'avanzamento e portare le indicazioni ricevute nella pianificazione dello sprint successivo. All'interno del gruppo resta l'incontro fisso settimanale, deciso il 2026-10-26, il lunedì alle 15:00 su Discord: nei lunedì di inizio sprint diventa la riunione di chiusura dello sprint precedente e di pianificazione del nuovo. Con circa 4,4 ore settimanali a testa, due settimane bastano per completare e verificare un incremento piccolo ma concreto, e dieci sprint lasciano a ciascuno il tempo di ricoprire tutti i ruoli.

*Tracciamento del lavoro.* Ogni attività è una issue su GitHub, assegnata a un componente e associata allo sprint, con il ruolo con cui viene svolta e le ore impiegate. Da qui il Responsabile ricava a fine sprint il consuntivo e il registro delle ore per componente e per ruolo. Ogni modifica a documenti e codice avviene su un proprio branch e viene integrata nel ramo principale tramite pull request, solo dopo l'approvazione di un Verificatore, come deciso dal gruppo il 2026-10-26.

*Regole.* I ruoli non sono assegnati in anticipo per tutto il progetto: il gruppo li decide alla fine di ogni sprint, in base alle attività del successivo, alle disponibilità di ciascuno e alle ore già svolte in ogni ruolo.
+ Le assegnazioni dello sprint successivo si decidono nella riunione di chiusura dello sprint, si registrano nel verbale e si riportano nel _Piano di Progetto_.
+ Ogni componente ricopre un solo ruolo per sprint. Uno stesso ruolo può essere ricoperto da più componenti, e un ruolo può restare scoperto negli sprint in cui non serve; il Responsabile invece è sempre uno solo.
+ Nessuno ricopre lo stesso ruolo per più di due sprint consecutivi, così che la rotazione proceda per tutti.
+ Il Responsabile aggiorna a ogni sprint il registro delle ore per componente e per ruolo, ricavato dalle issue: a ogni assegnazione si privilegia chi è più lontano dalle ore previste nella tabella #ref(<tab-ore>, supplement: none), in modo che alla fine del progetto ognuno abbia ricoperto tutti e sei i ruoli.
+ Nessuno verifica un prodotto di cui è autore, né approva una pull request che contiene modifiche proprie.
+ Il Responsabile dello sprint aggiorna il diario di bordo ed è l'unico che approva il rilascio dei prodotti.

*Ruoli iniziali.* Per il primo sprint il gruppo ha già stabilito le assegnazioni della tabella #ref(<tab-iniziali>, supplement: none). Lo sprint è dedicato all'avvio: non si progetta né si scrive codice, e per questo non sono previsti Progettisti né Programmatori, mentre due componenti lavorano come Analisti e due come Verificatori.

#figure(
  tab((left, left, center, left),
    (3cm, 4.4cm, 1.6cm, 1fr),
    ("Ruolo", "Componenti", "Ore", "Attività nel primo sprint"),
    (
      [Responsabile], [Matilde Pedrocchi], [7], [Pianificazione iniziale e bozza del _Piano di Progetto_; organizzazione dei primi incontri con Ergon],
      [Amministratore], [Alessandro Zanier], [7], [Impostazione del tracciamento su GitHub (issue, sprint, ore e ruoli); repository e sito; bozza delle _Norme di Progetto_],
      [Analista], [Francesco Bassani, Alessandro Ravenna], [16], [Studio del capitolato; richiesta a Ergon dei dati del caso di studio; primi casi d'uso; domande per il primo incontro],
      [Progettista], [–], [–], [Non previsto nel primo sprint],
      [Programmatore], [–], [–], [Non previsto nel primo sprint],
      [Verificatore], [Matteo Angelini, Andrea Nogara], [12], [Verifica dei documenti prodotti nello sprint],
      [*Totale*], [], [*42*], [],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Ruoli iniziali (sprint S1)],
) <tab-iniziali>

Le ore di Analisti e Verificatori sono il totale del ruolo, divise in parti uguali tra i due componenti.

= Orientamento tecnologico

Il capitolato lascia libera la scelta delle tecnologie e ne suggerisce alcune. Il gruppo parte da quei suggerimenti, che riducono il tempo di ricerca e su cui Ergon può dare supporto, e fissa le scelte definitive entro lo sprint S3, dopo lo stato dell'arte; il PoC ne verifica la tenuta prima della RTB. Un'alternativa a un suggerimento del capitolato sarà adottata solo se motivata e condivisa con Ergon.

#figure(
  tab((left, left, left),
    (3.6cm, 1fr, 4.2cm),
    ("Livello", "Orientamento iniziale", "Da decidere entro S3"),
    (
      [Recupero dei dati], [Caricamento del dump testuale fornito da Ergon per sviluppo e test, separato dal gestionale reale], [Eventuale connettore (ODBC o middleware JSON)],
      [Dati grezzi e configurazioni], [Database relazionale per l'archivio dei dati grezzi e per utenti e dashboard salvate], [PostgreSQL, MySQL o MariaDB],
      [Data warehouse], [DuckDB, consigliato dal capitolato e preferito da Ergon, con modello dimensionale a stella; accesso tramite un livello di astrazione sulla sorgente], [Struttura del modello dimensionale],
      [Trasformazione dei dati], [Python, con una libreria di manipolazione dati], [Polars o pandas; eventuale orchestrazione],
      [Backend], [API REST tra frontend e dati: il frontend non interroga mai direttamente il data warehouse], [Linguaggio e framework],
      [Frontend], [Web application responsive con libreria di grafici e layout a griglia per il drag & drop], [React, Angular o Vue; librerie di grafici e di layout],
      [Layer AI], [Modello di linguaggio commerciale via API, con le chiavi fornite da Ergon; nessun modello locale, sconsigliato da Ergon per requisiti hardware e tempi], [Provider (GPT o Claude) e libreria di integrazione],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Orientamento tecnologico iniziale],
) <tab-tecnologie>

= Calendario di massima

#figure(
  tab((center, center, center, left),
    (1.4cm, 5cm, 1.2cm, 1fr),
    ("Sprint", "Date", "Ore", "Attività principali"),
    (
      table.cell(colspan: 4, fill: colore-sfondo.darken(8%))[*Periodo 1 – Requirements and Technology Baseline (RTB)*],
      [S1], [2026-11-11 – 2026-11-22], [42], [Avvio: primo incontro con Ergon e richiesta dei dati del caso di studio; studio del capitolato; scelta dei referenti per area; tracciamento su GitHub; bozze di _Norme di Progetto_ e _Piano di Progetto_],
      [S2], [2026-11-23 – 2026-12-06], [56], [Casi d'uso e requisiti, classificati in obbligatori, desiderabili e facoltativi; analisi dei dati del caso di studio; stato dell'arte su BI e interrogazione in linguaggio naturale],
      [S3], [2026-12-07 – 2026-12-20], [58], [_Analisi dei Requisiti_; scelte tecnologiche definitive; avvio del PoC: caricamento dei dati e primo modello dimensionale],
      [S4], [2026-12-21 – 2027-01-03], [42], [PoC: API e prima dashboard con alcuni widget (festività)],
      [S5], [2027-01-04 – 2027-01-17], [42], [PoC: prima richiesta in linguaggio naturale tradotta in un grafico; _Piano di Qualifica_ (rientro dalle festività)],
      [S6], [2027-01-18 – 2027-01-31], [48], [Completamento dei documenti e revisione RTB; avvio della progettazione (sessione d'esame)],
      table.cell(colspan: 4, fill: colore-sfondo.darken(8%))[*Periodo 2 – Product Baseline (PB)*],
      [S7], [2027-02-01 – 2027-02-14], [46], [Correzioni dopo la RTB; progettazione architetturale dei tre livelli e del layer AI (sessione d'esame)],
      [S8], [2027-02-15 – 2027-02-28], [56], [Progettazione di dettaglio; codifica di pipeline dei dati, API e costruttore di dashboard (sessione d'esame)],
      [S9], [2027-03-01 – 2027-03-14], [70], [Codifica della libreria di widget, dei filtri e dell'esportazione; generazione di visualizzazioni da richieste in linguaggio naturale; test],
      [S10], [2027-03-15 – 2027-04-02], [80], [Completamento e verifica dell'MVP; validazione con Ergon sui dati del caso di studio; _Specifica Architetturale_ e _Manuale Utente_; revisione PB e consegna (Pasqua)],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Sprint, ore e attività principali],
) <tab-calendario>

Il calendario segue l'approccio consigliato dal capitolato: prima una piattaforma di Business Intelligence funzionante dal dato alla dashboard, poi la capacità AI centrale, cioè la generazione di visualizzazioni da richieste in linguaggio naturale. Insight automatici, assistente nella costruzione delle dashboard e spiegazione degli indicatori sono estensioni: se ne valuterà l'inserimento tra i requisiti con Ergon, in base al tempo che resterà dopo l'MVP.

Le ore per sprint tengono conto della durata e del periodo dell'anno. S1 dura dodici giorni; S4 cade durante le festività e S5 subito dopo, e sono gli sprint con meno ore; da S6 a S8, nella sessione d'esame invernale, il carico resta contenuto. Le ore crescono in S9 e S10, dopo la sessione: S9 è lo sprint più intenso, circa 5,8 ore a settimana per componente, mentre S10 dura circa tre settimane, comprende Pasqua e Pasquetta (2027-03-28 e 2027-03-29), la validazione con Ergon e la consegna. La milestone RTB è prevista alla fine di S6 (2027-01-31) e la PB alla fine di S10 (2027-04-02); le date delle revisioni saranno concordate con i docenti.

= Rischi attesi e misure di mitigazione

I rischi sono divisi in tre gruppi: tecnologici, legati ai requisiti e organizzativi. Per ciascuno sono indicate probabilità e impatto stimati e le misure con cui il gruppo intende prevenirlo o contenerlo; il _Piano di Progetto_ ne seguirà l'andamento a ogni periodo.

#figure(
  tab((left, left, center, center, left),
    (1.1cm, 4.5cm, 2.2cm, 1.7cm, 1fr),
    ("Id", "Rischio", "Probabilità", "Impatto", "Misure di mitigazione"),
    (
      [R01], [Tecnologie nuove per il gruppo: modellazione dimensionale, DuckDB, trasformazione dei dati in Python, librerie di grafici e di layout drag & drop], [Alta], [Media], [Un referente per ciascuna area (dati ed ETL, backend, frontend, layer AI), scelto nel primo sprint e riportato nel _Piano di Progetto_, che prepara materiale per gli altri; PoC sui dati del caso di studio tra S3 e S5; preferenza per le tecnologie suggerite dal capitolato, salvo alternative motivate],
      [R02], [Affidabilità del layer AI: richieste interpretate male o risposte incoerenti, senza un metodo deterministico per validarle], [Alta], [Alta], [L'AI lavora solo su dati e metadati esposti dalla piattaforma e le interrogazioni non arrivano mai al frontend, come chiede il capitolato; controlli sulle interrogazioni generate prima di eseguirle; casi di test con richieste di esempio e valutazione qualitativa concordata con Ergon],
      [R03], [Qualità dei dati del caso di studio: campi senza descrizione o valori da ricavare, come negli esempi di dati grezzi del capitolato], [Media], [Alta], [Richiesta del dump in S1 e analisi appena ricevuto, entro S2 se i tempi di Ergon lo consentono; nel frattempo dati di prova costruiti dal gruppo sul modello degli esempi del capitolato; regole di pulizia e trasformazione documentate; chiarimenti con Ergon sui campi dubbi],
      [R04], [Uso dei modelli tramite API: costi delle chiamate e invio di dati aziendali a un servizio esterno], [Media], [Media], [Chiavi di licenza fornite da Ergon; al modello si inviano solo i dati necessari alla singola richiesta; consumi controllati durante i test],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Rischi tecnologici],
) <tab-rischi-tec>

#figure(
  tab((left, left, center, center, left),
    (1.1cm, 4.5cm, 2.2cm, 1.7cm, 1fr),
    ("Id", "Rischio", "Probabilità", "Impatto", "Misure di mitigazione"),
    (
      [R05], [Ambito molto ampio: pipeline dei dati, costruttore di dashboard, libreria di widget, versione mobile e quattro capacità AI], [Alta], [Alta], [Requisiti classificati in obbligatori, desiderabili e facoltativi nell'_Analisi dei Requisiti_; prima la BI, poi la capacità AI centrale, poi le estensioni; server MCP e funzionalità aggiuntive solo se resta tempo; rinegoziazione al ribasso se il costo si avvicina al limite],
      [R06], [Prestazioni e usabilità: tempi di caricamento su dataset di dimensioni significative, confronto implicito con prodotti come Power BI e Tableau], [Media], [Media], [Soglie concordate con Ergon entro la RTB e riportate nel _Piano di Qualifica_; misure sui dati del caso di studio],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Rischi legati ai requisiti],
) <tab-rischi-req>

#figure(
  tab((left, left, center, center, left),
    (1.1cm, 4.5cm, 2.2cm, 1.7cm, 1fr),
    ("Id", "Rischio", "Probabilità", "Impatto", "Misure di mitigazione"),
    (
      [R07], [Festività di fine anno, sessione d'esame invernale e impegni individuali], [Alta], [Media], [Meno ore da S4 a S7 già nel preventivo, recuperate in S9 e S10; calendario condiviso delle indisponibilità, usato nelle assegnazioni dei ruoli],
      [R08], [Indisponibilità prolungata di un componente], [Media], [Alta], [Più componenti possono ricoprire lo stesso ruolo; nessun prodotto affidato a una sola persona; ripianificazione nel _Piano di Progetto_],
      [R09], [Squilibrio delle ore tra componenti o tra ruoli, dovuto alla rotazione decisa sprint per sprint], [Media], [Media], [Ore e ruolo registrati su ogni issue di GitHub; registro per componente e per ruolo aggiornato a ogni sprint; assegnazioni scelte per ridurre gli scarti rispetto alla tabella #ref(<tab-ore>, supplement: none)],
      [R10], [Stime imprecise per inesperienza], [Alta], [Media], [Consuntivo e retrospettiva a ogni sprint; aggiornamento del preventivo a finire nel _Piano di Progetto_],
      [R11], [Comunicazione con la proponente limitata agli incontri periodici], [Bassa], [Media], [Allineamento ogni quindici giorni con ordine del giorno inviato in anticipo; incontri aggiuntivi e chiarimenti per e-mail o messaggistica, come offerto da Ergon],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Rischi organizzativi],
) <tab-rischi-org>

= Impegni assunti

#figure(
  tab((left, left),
    (1fr, 2fr),
    ("Voce", "Impegno"),
    (
      [Capitolato], [C7 – SmartDashboard: piattaforma di Business Intelligence self-service potenziata da AI (Ergon Informatica Srl)],
      [Componenti del gruppo], [6],
      [Data di consegna], [2027-04-02],
      [Ore produttive per componente], [90],
      [Ore produttive complessive], [540],
      [Costo complessivo], [11.040,00 €],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Impegni assunti dal gruppo],
) <tab-impegni>

*Data di consegna.* Il gruppo prevede di iniziare il giorno dopo l'aggiudicazione, e si impegna a consegnare entro venerdì 2027-04-02. Il calendario parte mercoledì 2026-11-11 e prevede venti settimane di lavoro, fino a martedì 2027-03-30, più tre giorni lavorativi di margine, compresi nell'ultimo sprint. Se la validazione con Ergon si conclude prima, il gruppo consegna prima.

*Monte ore.* Ogni componente dedica al progetto 90 ore produttive, entro il limite massimo di 95 ore fissato dal regolamento, in media circa 4,4 ore a settimana; il gruppo nel complesso 540 ore. Il preventivo riguarda solo il lavoro successivo all'aggiudicazione: le ore spese per la candidatura non sono incluse.

*Costo.* Il costo complessivo è di 11.040,00 €, somma dei costi per ruolo della tabella #ref(<tab-costi>, supplement: none). Il gruppo lo considera un limite da non superare: se il costo effettivo si avvicina a questa cifra prima della consegna, il gruppo concorda con Ergon una riduzione dei requisiti invece di aumentare le ore.
