#import "/templates/documento.typ": documento, tabella, colore-sfondo

#show: documento.with(
  titolo: "Dichiarazione degli impegni",
  sottotitolo: "Ingegneria del Software · a.a. 2026/2027",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "1.1",
  data: "2026-11-09",
  uso: "Esterno",
  redattori: ("Alessandro Zanier", "Andrea Nogara", "Francesco Bassani"),
  verificatori: ("Francesco Bassani", "Alessandro Ravenna"),
  registro: (
    ("1.1", "2026-11-09", "Francesco Bassani", "Alessandro Ravenna", "Adattamento al capitolato C9 – SpecCheck"),
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

#v(0.2cm)
#heading(numbering: none, outlined: false)[Elenco delle tabelle]
#outline(title: none, target: figure.where(kind: table))

= Introduzione

== Scopo del documento
Questo documento raccoglie gli impegni che Hex4dev assume per il capitolato *C9 – SpecCheck: sviluppo di skill per OpenCode per la verifica della tracciabilità end-to-end da casi d'uso a requisiti e codice sorgente*, proposto da Zucchetti S.p.A. Descrive come il gruppo intende distribuire il proprio tempo tra i ruoli del progetto, quanto costerà il prodotto, come saranno organizzati i ruoli nel corso del lavoro, da quali tecnologie intende partire, quale calendario il gruppo si propone di seguire e quali rischi prevede, e si chiude con il riepilogo degli impegni: data di consegna, ore e costo complessivo. È destinato al Prof. Tullio Vardanega e al Prof. Riccardo Cardin.

Le cifre qui riportate sono il punto di partenza del _Piano di Progetto_: dopo l'aggiudicazione il gruppo vi dettaglierà la pianificazione sprint per sprint e, alla fine di ogni periodo, confronterà ore e costi effettivi con questo preventivo.

== Criteri di verifica
Chi verifica il documento controlla i punti seguenti e ne riporta l'esito nel registro delle modifiche.
+ Ogni componente ha 90 ore e il totale del gruppo è 540 ore.
+ Le ore per ruolo coincidono nella ripartizione per componente, nel preventivo per ruolo e nella somma dei due periodi.
+ Il costo di ogni ruolo è il prodotto di ore e costo orario; la somma dei costi è 11.040,00 € ed è uguale alla somma dei costi dei due periodi.
+ Le ore degli sprint nel calendario sommano a 540 e, sommate per periodo, coincidono con la tabella dei periodi.
+ I ruoli iniziali rispettano le regole di organizzazione dei ruoli e le loro ore coincidono con quelle previste per il primo sprint.
+ Le date degli sprint sono consecutive, dal 2026-11-11 al 2027-04-02, e la data di consegna coincide con quella degli impegni assunti.
+ Ogni affermazione sul prodotto trova riscontro nel capitolato C9, e ogni decisione organizzativa nei verbali interni o in questo documento.
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

*Motivazione della ripartizione.* SpecCheck è un pacchetto di skill, comandi, tool e almeno un plugin per OpenCode, installabile come prodotto unico, che verifica la tracciabilità di un progetto software esterno. Esso legge i diagrammi e la documentazione dei casi d'uso, le specifiche dei requisiti e il codice, li confronta e mostra in una dashboard le discrepanze. Programmatore (26,7%) e Progettista (22,2%) hanno le quote più alte. Al ruolo di Progettista è assegnato un peso maggiore poiché il capitolato richiede la separazione accurata di due tipi di componenti: le skill, che sfruttano un LLM per leggere e confrontare testi e codice, dalle parti che devono dare risultati ripetibili, come il tracciamento e la dashboard, da realizzare come plugin o eseguibile di appoggio, sul modello di OpenSpec. Il capitolato chiede inoltre un'architettura robusta, in quanto il codice sarà rivisto ed esteso a ogni passaggio, dal PoC all'MVP.

*Programmatore e Verificatore.* Il gruppo non ha ritenuto di ripartire in modo paritario le ore dei due ruoli e ha fissato un rapporto di 1 ora di Programmatore ogni 0,75 ore di Verificatore (144 contro 108). Poiché il codice non è più scritto interamente a mano, al Programmatore è affidata la responsabilità di svolgere già una prima verifica di ciò che produce; il Verificatore scrive i test, controlla che la copertura raggiunga la soglia che sarà fissata nel _Piano di Qualifica_, e verifica i documenti. Nel C9 il suo lavoro ha due parti specifiche: il capitolato chiede, soprattutto dall'MVP in poi, un'adeguata copertura con test automatici, perché il sistema sarà rivisto spesso; inoltre i risultati delle skill dipendono dal modello di linguaggio e non sono deterministici, andranno quindi valutati su un progetto di prova con discrepanze note, contando segnalazioni corrette, mancate ed errate, anche con i modelli più piccoli messi a disposizione da Zucchetti. Per questo la sua quota (20,0%) resta alta pur essendo inferiore a quella del Programmatore.

*Analista, Responsabile e Amministratore.* L'Analista ha il 13,3% delle ore, quasi tutte prima della RTB. I nove requisiti obbligatori del capitolato non si potranno modificare in corso d'opera e vanno resi precisi e verificabili fin dall'inizio: quali formati dei diagrammi si leggono (per esempio Mermaid o XMI), che cosa significa che una specifica corrisponde a un caso d'uso, come vengono segnalate le discrepanze. Spetta all'analisi anche la scelta del progetto da usare come materiale di verifica, che il capitolato lascia al gruppo. Responsabile (10,0%) e Amministratore (7,8%) lavorano in ogni sprint, ma con un carico contenuto: il Responsabile è il ruolo più costoso e il suo tempo va limitato al coordinamento, mentre una parte degli strumenti dell'Amministratore, come il repository e il sito della documentazione, è già stata predisposta durante la candidatura.

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

*I due periodi.* Il primo periodo porta alla Requirements and Technology Baseline: requisiti, scelte tecnologiche e un PoC che, come consiglia il capitolato, esplora soprattutto la lettura dei diagrammi dei casi d'uso e gli algoritmi di confronto. L'Analista vi concentra quasi tutte le sue ore (64 su 72), e anche Responsabile e Amministratore vi pesano di più in proporzione (19,4% delle ore del periodo contro 15,9% nel secondo), perché in questa fase si impostano strumenti, norme e pianificazione. Il secondo periodo porta alla Product Baseline: progettazione e codifica dell'MVP, che realizza i requisiti obbligatori, con la quota principale del Programmatore (88 ore) e una verifica che si sposta dai documenti ai test automatici e alla qualità delle segnalazioni. Il primo periodo ha più ore in totale (288 contro 252) ma meno ore per sprint, circa 48 contro circa 63, perché comprende un primo sprint di soli dodici giorni, le festività di fine anno e l'inizio della sessione d'esame. La ripartizione per sprint e per ruolo non è fissata qui: dipende dalle assegnazioni decise a ogni sprint e sarà riportata nel _Piano di Progetto_.

= Organizzazione dei ruoli <sez-ruoli>

*Sprint e incontri.* Il lavoro è organizzato in dieci sprint di due settimane, che iniziano di lunedì (salvo il primo, che parte mercoledì 2026-11-11). Il capitolato non indica una cadenza di incontri con la proponente: nel primo sprint il gruppo proporrà a Zucchetti un allineamento ogni due settimane, verso la fine di ogni sprint, così da mostrare l'avanzamento e portare le indicazioni ricevute nella pianificazione dello sprint successivo. All'interno del gruppo resta l'incontro fisso settimanale, deciso il 2026-10-26, il lunedì alle 15:00 su Discord: nei lunedì di inizio sprint diventa la riunione di chiusura dello sprint precedente e di pianificazione del nuovo. Con circa 4,4 ore settimanali a testa, due settimane sono sufficienti per completare e verificare un incremento piccolo ma concreto, mentre dieci sprint permettono a ciascuno il tempo di ricoprire tutti i ruoli.

*Tracciamento del lavoro.* Ogni attività è una issue su GitHub, assegnata a un componente e associata allo sprint, con il ruolo con cui viene svolta e le ore impiegate. Da qui il Responsabile ricava a fine sprint il consuntivo e il registro delle ore per componente e per ruolo. Ogni modifica a documenti e codice avviene su un proprio branch e viene integrata nel ramo principale tramite pull request, solo dopo l'approvazione di un Verificatore, come deciso dal gruppo il 2026-10-26.

*Regole.* I ruoli non sono assegnati in anticipo per tutto il progetto: il gruppo li decide alla fine di ogni sprint, in base alle attività del successivo, alle disponibilità di ciascuno e alle ore già svolte in ogni ruolo.
+ Le assegnazioni dello sprint successivo si decidono nella riunione di chiusura dello sprint, si registrano nel verbale e si riportano nel _Piano di Progetto_.
+ Ogni componente ricopre un solo ruolo per sprint. Uno stesso ruolo può essere ricoperto da più componenti, e un ruolo può restare scoperto negli sprint in cui non serve. In ogni sprint opera sempre uno e un solo Responsabile, uno e un solo Amministratore, e almeno un Verificatore.
+ Nessuno ricopre lo stesso ruolo per più di due sprint consecutivi, così che la rotazione proceda per tutti.
+ Il Responsabile aggiorna a ogni sprint il registro delle ore per componente e per ruolo, ricavato dalle issue. A ogni sprint il Responsabile assegna le issue privilegiando chi è più lontano dalle ore previste nella tabella #ref(<tab-ore>, supplement: none), in modo che alla fine del progetto ognuno abbia ricoperto tutti e sei i ruoli in modo equo con gli altri componenti del gruppo.
+ Nessuno verifica un prodotto di cui è autore, né approva una pull request che contiene modifiche proprie.
+ Il Responsabile dello sprint aggiorna il diario di bordo ed è l'unico che approva il rilascio dei prodotti.

*Ruoli iniziali.* Per il primo sprint il gruppo ha stabilito le assegnazioni della tabella #ref(<tab-iniziali>, supplement: none). Lo sprint è dedicato all'avvio: non si progetta né si scrive codice, per cui non sono previsti Progettisti né Programmatori, mentre due componenti lavorano come Analisti e due come Verificatori.

#figure(
  tab((left, left, center, left),
    (3cm, 4.4cm, 1.6cm, 1fr),
    ("Ruolo", "Componenti", "Ore", "Attività nel primo sprint"),
    (
      [Responsabile], [Matilde Pedrocchi], [7], [Pianificazione iniziale e bozza del _Piano di Progetto_; primo contatto con Zucchetti e proposta della cadenza degli incontri],
      [Amministratore], [Alessandro Zanier], [7], [Impostazione del tracciamento su GitHub (issue, sprint, ore e ruoli); repository e sito; bozza delle _Norme di Progetto_],
      [Analista], [Francesco Bassani, Alessandro Ravenna], [16], [Studio del capitolato e del funzionamento di OpenCode; prime ipotesi sul progetto da usare per le verifiche; primi casi d'uso; domande per Zucchetti],
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

Il capitolato fissa lo strumento, OpenCode, e indica come spunto alcuni sistemi per la gestione delle specifiche (OpenSpec, Spec-kit, il metodo BMAD), alcune raccolte di skill e strumenti testuali per i diagrammi UML come PlantUML e UMLet. Il gruppo parte da queste indicazioni e fissa le scelte definitive entro lo sprint S3, dopo lo stato dell'arte; il PoC ne verifica la tenuta prima della RTB. Le scelte che il capitolato lascia aperte saranno condivise con Zucchetti.

#figure(
  tab((left, left, left),
    (3.6cm, 1fr, 4.2cm),
    ("Livello", "Orientamento iniziale", "Da decidere entro S3"),
    (
      [Strumento], [OpenCode, indicato dal capitolato; SpecCheck ne estende le funzioni senza modificarlo], [Versione di riferimento],
      [Skill e comandi], [Skill e comandi per le attività affidate al modello di linguaggio: lettura di casi d'uso, specifiche e codice e loro confronto], [Organizzazione delle skill e dei comandi],
      [Componente di appoggio], [Plugin per OpenCode o eseguibile richiamato da skill e comandi, per le parti che devono dare risultati ripetibili (tracciamento e dashboard), sul modello di OpenSpec], [Plugin, eseguibile o entrambi; linguaggio],
      [Formati di ingresso], [Diagrammi dei casi d'uso in Mermaid o XMI; documentazione dei casi d'uso e specifiche in Markdown; lettura di immagini PNG o JPEG da esplorare], [Formati supportati nell'MVP],
      [Modelli], [Modelli di grandi dimensioni messi a disposizione da Zucchetti con un limite di costo e modelli piccoli come Gemma 4 26B o Qwen 3.8 27B senza limiti], [Modelli di riferimento per sviluppo e test],
      [Dashboard], [A caratteri, nel terminale in cui lavora OpenCode; la versione grafica in HTML è un requisito opzionale], [Libreria per l'interfaccia testuale],
      [Installazione], [Script bash o PowerShell che aggiunge a OpenCode tutti i componenti di SpecCheck], [Sistemi operativi supportati],
      [Materiale di verifica], [Un progetto preesistente o un esempio pubblico di buona qualità, con casi d'uso, requisiti e codice, come suggerisce il capitolato], [Progetto di riferimento],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Orientamento tecnologico iniziale],
) <tab-tecnologie>

= Calendario di massima

#show figure: set block(breakable: true)
#figure(
  tab((center, center, center, left),
    (1.4cm, 5cm, 1.2cm, 1fr),
    ("Sprint", "Date", "Ore", "Attività principali"),
    (
      table.cell(colspan: 4, fill: colore-sfondo.darken(8%))[*Periodo 1 – Requirements and Technology Baseline (RTB)*],
      [S1], [2026-11-11 – 2026-11-22], [42], [Avvio: primo contatto con Zucchetti e proposta della cadenza degli incontri; studio del capitolato e di OpenCode (skill, comandi, plugin); scelta dei referenti per area; tracciamento su GitHub; bozze di _Norme di Progetto_ e _Piano di Progetto_],
      [S2], [2026-11-23 – 2026-12-06], [56], [Casi d'uso e requisiti, con i nove requisiti obbligatori resi verificabili e gli opzionali classificati; scelta del progetto per le verifiche; stato dell'arte su OpenSpec, Spec-kit e raccolte di skill],
      [S3], [2026-12-07 – 2026-12-20], [58], [_Analisi dei Requisiti_; scelte tecnologiche definitive; avvio del PoC: lettura dei diagrammi dei casi d'uso],
      [S4], [2026-12-21 – 2027-01-03], [42], [PoC: prima skill che confronta casi d'uso e specifiche dei requisiti (festività)],
      [S5], [2027-01-04 – 2027-01-17], [42], [PoC: segnalazione delle discrepanze su un caso di prova, con modelli grandi e piccoli; _Piano di Qualifica_ (rientro dalle festività)],
      [S6], [2027-01-18 – 2027-01-31], [48], [Completamento dei documenti e revisione RTB; avvio della progettazione (sessione d'esame)],
      table.cell(colspan: 4, fill: colore-sfondo.darken(8%))[*Periodo 2 – Product Baseline (PB)*],
      [S7], [2027-02-01 – 2027-02-14], [46], [Correzioni dopo la RTB; progettazione architetturale di skill, comandi, componente di appoggio e installazione (sessione d'esame)],
      [S8], [2027-02-15 – 2027-02-28], [56], [Progettazione di dettaglio; codifica della lettura di casi d'uso e specifiche e del loro confronto (sessione d'esame)],
      [S9], [2027-03-01 – 2027-03-14], [70], [Codifica della lettura del codice e del confronto con le specifiche; dashboard a caratteri; test automatici],
      [S10], [2027-03-15 – 2027-04-02], [80], [Completamento e verifica dell'MVP; script di installazione; prova sul progetto di riferimento con Zucchetti; _Specifica Architetturale_, _Manuale Utente_ e manuale per chi estende skill, comandi e tool; revisione PB e consegna (Pasqua)],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Sprint, ore e attività principali],
) <tab-calendario>
#show figure: set block(breakable: false)

Il calendario segue le due fasi indicate dal capitolato: per il PoC si esplorano soprattutto la lettura dei diagrammi dei casi d'uso e gli algoritmi di confronto, per l'MVP si realizzano tutti i requisiti obbligatori con test automatici. I requisiti opzionali, cioè dashboard grafica, verifica della copertura del codice da parte delle specifiche e lettura da PDF, si affrontano solo se resta tempo dopo l'MVP; il capitolato permette al gruppo di modificarli, mentre i requisiti obbligatori restano fissi.

Le ore per sprint tengono conto della durata e del periodo dell'anno. S1 dura dodici giorni; S4 e S5 cadono durante le festività e subito dopo, pertanto sono gli sprint con meno ore; da S6 a S8, durante la sessione d'esame invernale, il carico resta contenuto. Le ore crescono in S9 e S10, dopo la sessione: S9 è lo sprint più intenso, circa 5,8 ore a settimana per componente, mentre S10 dura circa tre settimane, comprende Pasqua e Pasquetta (2027-03-28 e 2027-03-29), la prova finale con Zucchetti e la consegna. La milestone RTB è prevista alla fine di S6 (2027-01-31) e la PB alla fine di S10 (2027-04-02); le date delle revisioni saranno concordate con i docenti.

= Rischi attesi e misure di mitigazione

I rischi sono divisi in tre gruppi: tecnologici, legati ai requisiti, e organizzativi. Per ciascun rischio sono indicate probabilità e impatto stimati e le misure con cui il gruppo intende prevenirlo o contenerlo; il _Piano di Progetto_ ne seguirà l'andamento a ogni periodo.

#figure(
  tab((left, left, center, center, left),
    (1.1cm, 4.5cm, 2.2cm, 1.7cm, 1fr),
    ("Id", "Rischio", "Probabilità", "Impatto", "Misure di mitigazione"),
    (
      [R01], [Tecnologie nuove per il gruppo: estensione di OpenCode con skill, comandi e plugin; lettura di formati come Mermaid e XMI; uso dei modelli di linguaggio dentro uno strumento], [Alta], [Media], [Un referente per ciascuna area (OpenCode e plugin, lettura dei formati, confronto con il modello di linguaggio, dashboard e installazione), scelto nel primo sprint e riportato nel _Piano di Progetto_, che prepara materiale per gli altri; PoC tra S3 e S5; studio di OpenSpec come esempio di architettura],
      [R02], [Risultati non deterministici: le skill possono dare esiti diversi a ogni esecuzione, segnalare discrepanze inesistenti o non vederne di reali], [Alta], [Alta], [Tracciamento e dashboard affidati al componente di appoggio, come chiede il capitolato; risultati delle skill in forma strutturata, con il riferimento al punto del documento o del codice; prove ripetute su un progetto con discrepanze note],
      [R03], [Strumenti in rapida evoluzione: le interfacce di OpenCode per skill e plugin possono cambiare durante il progetto], [Media], [Alta], [Versione di riferimento di OpenCode fissata e documentata; dipendenze da OpenCode concentrate in pochi punti del codice; aggiornamenti valutati a inizio sprint],
      [R04], [Modelli di linguaggio: risultati più deboli con i modelli piccoli e limite di costo sui modelli grandi], [Media], [Media], [Sviluppo e prove ripetute con i modelli piccoli, senza limiti; modelli grandi per prove mirate, con consumi controllati; al modello si passa solo il contesto necessario],
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
      [R05], [Progetto esplorativo con requisiti obbligatori non modificabili in corso d'opera: un'ipotesi troppo ambiziosa lascerebbe poco margine], [Alta], [Alta], [PoC su lettura dei diagrammi e confronto prima della RTB, come consiglia il capitolato; requisiti obbligatori resi precisi e verificabili nell'_Analisi dei Requisiti_; requisiti opzionali solo dopo l'MVP e rinunciabili se il costo si avvicina al limite],
      [R06], [Materiale da verificare: serve un progetto con casi d'uso, requisiti e codice di buona qualità, che il capitolato non fornisce], [Media], [Alta], [Scelta in S2 di un progetto preesistente o di un esempio pubblico, come suggerisce il capitolato; piccolo progetto di prova con discrepanze inserite apposta; più avanti, prove anche sui documenti di questo progetto],
      [R07], [Qualità della verifica difficile da misurare: il capitolato non fissa soglie di accettazione e parla solo di adeguata copertura con test automatici], [Media], [Media], [Metriche su segnalazioni corrette, mancate ed errate e soglia di copertura dei test proposte a Zucchetti entro la RTB e riportate nel _Piano di Qualifica_],
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
      [R08], [Festività di fine anno, sessione d'esame invernale e impegni individuali], [Alta], [Media], [Meno ore da S4 a S7 già nel preventivo, recuperate in S9 e S10; calendario condiviso delle indisponibilità, usato nelle assegnazioni dei ruoli],
      [R09], [Indisponibilità prolungata di un componente], [Media], [Alta], [Più componenti possono ricoprire lo stesso ruolo; nessun prodotto affidato a una sola persona; ripianificazione nel _Piano di Progetto_],
      [R10], [Squilibrio delle ore tra componenti o tra ruoli, dovuto alla rotazione decisa sprint per sprint], [Media], [Media], [Ore e ruolo registrati su ogni issue di GitHub; registro per componente e per ruolo aggiornato a ogni sprint; assegnazioni scelte per ridurre gli scarti rispetto alla tabella #ref(<tab-ore>, supplement: none)],
      [R11], [Stime imprecise per inesperienza], [Alta], [Media], [Consuntivo e retrospettiva a ogni sprint; aggiornamento del preventivo a finire nel _Piano di Progetto_],
      [R12], [Comunicazione con la proponente: il capitolato non indica cadenza di incontri né forme di supporto], [Media], [Media], [Proposta in S1 di un allineamento ogni due settimane; domande raccolte e inviate per e-mail al referente indicato nel capitolato; verbali esterni inviati alla proponente per l'approvazione],
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
      [Capitolato], [C9 – SpecCheck: sviluppo di skill per OpenCode per la verifica della tracciabilità end-to-end da casi d'uso a requisiti e codice sorgente (Zucchetti S.p.A.)],
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

*Data di consegna.* Il gruppo prevede di iniziare il giorno dopo l'aggiudicazione, e si impegna a consegnare entro venerdì 2027-04-02. Il calendario parte mercoledì 2026-11-11 e prevede venti settimane di lavoro, fino a martedì 2027-03-30, più tre giorni lavorativi di margine, compresi nell'ultimo sprint. Se la prova finale con Zucchetti si conclude prima, il gruppo consegna prima.

*Monte ore.* Ogni componente dedica al progetto 90 ore produttive, entro il limite massimo di 95 ore fissato dal regolamento, con una media di circa 4,4 ore per membro a settimana; il gruppo nel complesso 540 ore. Il preventivo riguarda solo il lavoro successivo all'aggiudicazione: le ore spese per la candidatura non sono incluse.

*Costo.* Il costo complessivo è di 11.040,00 €, somma dei costi per ruolo della tabella #ref(<tab-costi>, supplement: none). Il gruppo lo considera un limite da non superare: se il costo effettivo si avvicina a questa cifra prima della consegna, il gruppo rinuncia ai requisiti opzionali e concentra il lavoro su quelli obbligatori, che il capitolato non permette di modificare, invece di aumentare le ore.
