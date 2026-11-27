#import "/templates/documento.typ": documento, tabella, todo, colore-primario, colore-sfondo
#import "/templates/gantt.typ": gantt

#show: documento.with(
  titolo: "Piano di Progetto",
  sottotitolo: "Ingegneria del Software · a.a. 2026/2027",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "0.1",
  data: "2026-11-23",
  uso: "Esterno",
  redattori: ("Matilde Pedrocchi",),
  verificatori: ("Alessandro Zanier",),
  registro: (
    ("0.1", "2026-11-23", "Matilde Pedrocchi", "Alessandro Zanier", "Prima stesura del documento e aggiunta primo sprint"),
  ),
)

#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: set text(size: 10pt)
#show figure: set block(breakable: false)
#set table.cell(breakable: false)
#let tab(al, ..args) = { set table(align: al); tabella(..args) }

// Scheda di un rischio
#let scheda-rischio(codice, nome, descrizione, probabilita, impatto, mitigazione) = {
  let righe = (
    ("Codice", codice),
    ("Nome", nome),
    ("Descrizione", descrizione),
    ("Probabilità", probabilita),
    ("Impatto", impatto),
    ("Mitigazione", mitigazione),
  )
  figure(
    kind: table,
    caption: [Rischio #codice],
    {
      set text(size: 10pt, hyphenate: false)
      set par(justify: false)
      table(
        columns: (3.2cm, 1fr),
        align: (x, _) => if x == 0 { left + horizon } else { left + top },
        // stessi bordi, spaziature e righe alternate di tabella() nel template
        stroke: 0.5pt + colore-primario.lighten(55%),
        inset: (x: 7pt, y: 6pt),
        fill: (x, y) => if x == 0 { colore-primario } else if calc.odd(y) { colore-sfondo } else { white },
        ..righe.map(r => (text(fill: white, weight: "bold")[#r.at(0)], r.at(1))).flatten(),
      )
    },
  )
}

// Costo orario per ruolo
#let costo-orario = (
  Responsabile: 30, Amministratore: 20, Analista: 25,
  Progettista: 25, Programmatore: 15, Verificatore: 15,
)

// Numeri
#let num(x) = str(x).replace(".", ",")
#let eur(x) = {
  let c = int(calc.round(x * 100))
  let e = calc.quo(c, 100)
  let cent = calc.rem(c, 100)
  let resto = calc.rem(e, 1000)
  let intero = if e >= 1000 {
    str(calc.quo(e, 1000)) + "." + (if resto < 100 { "0" } else { "" }) + (if resto < 10 { "0" } else { "" }) + str(resto)
  } else { str(e) }
  intero + "," + (if cent < 10 { "0" } else { "" }) + str(cent) + " €"
}

// Tabella del preventivo di uno sprint
#let preventivo-sprint(righe, didascalia) = {
  let ore = righe.map(r => r.at(2)).sum()
  let costo = righe.map(r => r.at(2) * costo-orario.at(r.at(0))).sum()
  figure(
    tab((left, left, center, center, center),
      (3cm, 1fr, 1.4cm, 2.8cm, 2.8cm),
      ("Ruolo", "Membro", "Ore", "Costo orario", "Costo"),
      (
        ..righe.map(r => (
          [#r.at(0)], [#r.at(1)], [#num(r.at(2))],
          [#eur(costo-orario.at(r.at(0)))], [#eur(r.at(2) * costo-orario.at(r.at(0)))],
        )).flatten(),
        [*Totale*], [], [*#num(ore)*], [], [*#eur(costo)*],
      ),
    ),
    kind: table,
    supplement: [Tabella],
    caption: didascalia,
  )
}



#v(1cm)
#heading(numbering: none, outlined: false)[Elenco delle tabelle]
#outline(title: none, target: figure.where(kind: table))

= Introduzione

== Scopo del documento
Il Piano di Progetto è un documento in cui viene descritto in modo chiaro e dettagliato:
- La pianificazione temporale del progetto nel lungo e nel breve periodo
- Rischi attesi e metodi adottati per mitigarli
- Costo e impegno complessivo previsto
Tutto ciò viene fatto allo scopo di tenere traccia delle attività svolte, delle risorse consumate e di impostare un meccanismo di automiglioramento incrementale. Per altri aspetti organizzativi più precisi si fa riferimento al documento _Norme di Progetto_.

== Scopo del prodotto
Il prodotto da realizzare, denominato SpecCheck, è un pacchetto di skill, comandi, tool e almeno un plugin per OpenCode, distribuito come prodotto unico con script di installazione. Verifica la tracciabilità tra casi d'uso, requisiti e codice sorgente di un progetto software esterno, e riporta i risultati in una dashboard.

== Glossario
Per evitare ambiguità, tutti i termini tecnici e acronimi sono definiti nel _Glossario_. I termini presenti in quest'ultimo saranno segnalati con la seguente forma: termine#super[G]. 

== Riferimenti
=== Normativi
- #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C9-SpecCheck.pdf")[Capitolato C9 - SpecCheck, Zucchetti S.p.A.]\ 
  (Ultima consultazione 2026-11-18)
- #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/PD1.pdf")[Regolamento del Progetto Didattico a.a. 2026/2027] \
  (Ultima consultazione 2026-11-18)

=== Informativi
- #link("https://hex4dev.github.io/docs/pdf/candidatura/dichiarazione-impegni/dichiarazione-impegni.pdf")[Dichiarazione di Impegni, versione 2.0] \
  (Ultima consultazione 2026-11-18)
- #link("https://hex4dev.github.io/docs/pdf/candidatura/valutazione-capitolati/valutazione-capitolati.pdf")[Valutazione dei Capitolati, versione 2.0] \
  (Ultima consultazione 2026-11-18) 

= Analisi dei rischi
In questa sezione vengono analizzati i rischi che il gruppo prevede di incontrare durante il progetto e sono associati alle misure scelte per prevenirli o contenerli. 

Ogni rischio è descritto in una scheda e identificato da un codice formato dalla lettera R e da un numero progressivo (R01, R02, ...). Probabilità di accadimento e impatto sono stimati su una scala a tre valori: bassa, media, alta.

I rischi sono raggruppati in tre categorie: tecnologici, legati ai requisiti e organizzativi. All'inizio di ogni sprint si indicano i rischi attesi e al termine quelli effettivamente incontrati, valutando l'efficacia delle misure adottate.

== Rischi tecnologici

=== R01 – Tecnologie nuove per il gruppo
\
#scheda-rischio(
  "R01",
  "Tecnologie nuove per il gruppo",
  [Il gruppo non ha esperienza nell'estensione di OpenCode con skill, comandi e plugin, nella lettura di formati come Mermaid e XMI, né nell'uso di modelli di linguaggio all'interno di uno strumento di sviluppo. Il tempo di apprendimento può sottrarre ore alle attività produttive e causare errori e lunghe sessioni di debug.],
  "Alta",
  "Media",
  [Nel primo sprint si sceglie un referente per ciascuna area (OpenCode e plugin, lettura dei formati, confronto con il modello di linguaggio, dashboard e installazione). Il referente è riportato nel Piano di Progetto e prepara materiale per gli altri componenti. Il PoC, tra S3 e S5, verifica la tenuta delle tecnologie scelte e OpenSpec è studiato come esempio di architettura.],
)

=== R02 – Risultati non deterministici
\
#scheda-rischio(
  "R02",
  "Risultati non deterministici",
  [Le skill si appoggiano a un modello di linguaggio, quindi possono dare esiti diversi a ogni esecuzione, segnalare discrepanze inesistenti o non rilevarne di reali.],
  "Alta",
  "Alta",
  [Le parti che devono dare risultati ripetibili, cioè tracciamento e dashboard, sono affidate a un componente di appoggio (plugin o eseguibile), come richiede il capitolato. I risultati delle skill sono prodotti in forma strutturata, con il riferimento al punto del documento o del codice, e sono provati più volte su un progetto con discrepanze note.],
)

=== R03 – Strumenti in rapida evoluzione
\
#scheda-rischio(
  "R03",
  "Strumenti in rapida evoluzione",
  [OpenCode e gli strumenti collegati cambiano rapidamente: le interfacce per skill e plugin potrebbero variare durante il progetto, rendendo necessarie modifiche al codice già scritto.],
  "Media",
  "Alta",
  [Si fissa e si documenta una versione di riferimento di OpenCode. Le dipendenze da OpenCode sono concentrate in pochi punti del codice e gli aggiornamenti sono valutati a inizio sprint.],
)

=== R04 – Limiti dei modelli di linguaggio
\
#scheda-rischio(
  "R04",
  "Limiti dei modelli di linguaggio",
  [I modelli di piccole dimensioni messi a disposizione da Zucchetti possono dare risultati più deboli, mentre sui modelli di grandi dimensioni c'è un limite massimo di costo.],
  "Media",
  "Media",
  [Sviluppo e prove ripetute avvengono con i modelli piccoli, che non hanno limiti di utilizzo. I modelli grandi sono riservati a prove mirate, con consumi controllati. Al modello si passa solo il contesto necessario.],
)

== Rischi legati ai requisiti

=== R05 – Requisiti obbligatori non modificabili
\
#scheda-rischio(
  "R05",
  "Requisiti obbligatori non modificabili",
  [Il progetto è esplorativo e i requisiti obbligatori non possono essere modificati in corso d'opera: un'ipotesi rivelatasi troppo ambiziosa lascerebbe poco margine di correzione.],
  "Alta",
  "Alta",
  [Il PoC su lettura dei diagrammi e confronto è svolto prima della RTB, come consiglia il capitolato. I requisiti obbligatori sono resi precisi e verificabili nell'Analisi dei Requisiti. I requisiti opzionali sono affrontati solo dopo l'MVP e abbandonati se il costo si avvicina al limite.],
)

=== R06 – Materiale da verificare mancante
\
#scheda-rischio(
  "R06",
  "Materiale da verificare mancante",
  [Il capitolato non fornisce un progetto con casi d'uso, requisiti e codice di buona qualità su cui provare SpecCheck.],
  "Media",
  "Alta",
  [In S2 si sceglie un progetto preesistente o un esempio pubblico, come suggerisce il capitolato. Si prepara inoltre un piccolo progetto di prova con discrepanze inserite apposta. Più avanti si provano anche i documenti di questo progetto.],
)

=== R07 – Qualità della verifica difficile da misurare
\
#scheda-rischio(
  "R07",
  "Qualità della verifica difficile da misurare",
  [Il capitolato non fissa soglie di accettazione e parla solo di adeguata copertura con test automatici; falsi positivi e falsi negativi delle skill sono difficili da quantificare.],
  "Media",
  "Media",
  [Metriche sulle segnalazioni corrette, mancate ed errate e una soglia di copertura dei test sono proposte a Zucchetti entro la RTB e riportate nel Piano di Qualifica.],
)

== Rischi organizzativi

=== R08 – Festività, sessione d'esame e impegni individuali
\
#scheda-rischio(
  "R08",
  "Festività, sessione d'esame e impegni individuali",
  [Le festività di fine anno, la sessione d'esame invernale e gli altri impegni dei componenti riducono la disponibilità oraria del gruppo.],
  "Alta",
  "Media",
  [Il preventivo prevede meno ore da S4 a S7, recuperate in S9 e S10. Un calendario condiviso delle indisponibilità è usato nell'assegnazione dei ruoli.],
)

=== R09 – Indisponibilità prolungata di un componente
\
#scheda-rischio(
  "R09",
  "Indisponibilità prolungata di un componente",
  [Un componente può restare a lungo indisponibile per motivi personali, di salute o di studio, lasciando scoperte le attività che gli erano affidate.],
  "Media",
  "Alta",
  [Più componenti possono ricoprire lo stesso ruolo e nessun prodotto è affidato a una sola persona. Il lavoro è ripianificato e riportato nel Piano di Progetto.],
)

=== R10 – Squilibrio delle ore tra componenti o ruoli
\
#scheda-rischio(
  "R10",
  "Squilibrio delle ore tra componenti o ruoli",
  [La rotazione dei ruoli, decisa sprint per sprint, può portare a scarti di ore tra i componenti o rispetto alla ripartizione prevista per ruolo.],
  "Media",
  "Media",
  [Ore e ruolo sono registrati e il registro per componente e per ruolo è aggiornato a ogni sprint. Le assegnazioni sono scelte in modo da ridurre gli scarti rispetto alle ore previste.],
)

=== R11 – Stime imprecise per inesperienza
\
#scheda-rischio(
  "R11",
  "Stime imprecise per inesperienza",
  [Il gruppo non ha esperienza nella stima dell'impegno di attività nuove, per cui preventivi di sprint e di periodo possono risultare sovrastimati o sottostimati.],
  "Alta",
  "Media",
  [A ogni sprint si redigono consuntivo e retrospettiva e si aggiorna il preventivo a finire nel Piano di Progetto, così da correggere le stime successive.],
)

=== R12 – Comunicazione con la proponente
\
#scheda-rischio(
  "R12",
  "Comunicazione con la proponente",
  [Il capitolato non indica una cadenza di incontri né forme di supporto da parte di Zucchetti: chiarimenti e validazioni potrebbero arrivare in ritardo.],
  "Media",
  "Media",
  [In S1 si propone un allineamento ogni due settimane. Le domande sono raccolte e inviate per e-mail al referente indicato nel capitolato e i verbali esterni sono inviati alla proponente per approvazione.],
)

= Stima dei costi di sviluppo

== Preventivo costi
Qui viene indicata la stima di ore necessarie per il completamento del progetto e il conseguente costo. In fase di candidatura è stata predisposta la seguente divisione iniziale delle ore per ruolo, ma il gruppo si riserva di effettuare delle modidiche in base alle necessità progettuali, mantenendo in ogni caso il vincolo di non superare il costo complessivo di 11.040,00 € dichiarato nel documento _Dichiarazione degli Impegni_ presentato alla candidatura.
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

== Ripartizione oraria per membro
In fase di candidatura, all'interno del documento _Dichiarazione degli Impegni_, per rispettare il più possibile principio di equità sia nel carico di lavoro che nella rotazione dei ruoli, è stata definita la seguente matrice di divisione oraria. Questa matrice rappresenta lo scenario ideale. Il numero di ore effettivo potrà discostarsi dal valore quì dichiarato, purché vengano rispettati i due vincoli cardine:
- 90 ore produttive per ogni membro
- Rotazione di ogni membro su tutti i ruoli.
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

= Pianificazione a lungo termine

== Requirements and Technology Baseline
Le attività previste per la revisione RTB (Requirements and Technology Baseline) sono le seguenti:
- Analisi dei requisiti
- Prima fase di progettazione
- Sviluppo del PoC
Di seguito è riportato un calendario di massima stabilito nella _Dichiarazione degli Impegni_.
#show figure: set block(breakable: true)
#figure(
  tab((center, center, center, center, left),
    (1.4cm, 2.5cm, 2.5cm, 1.2cm, 1fr),
    ("Sprint", "Data inizio", "Data fine", "Ore", "Attività principali"),
    (
      [S1], [2026-11-11], [2026-11-22], [42], [Avvio: primo contatto con Zucchetti e proposta della cadenza degli incontri; studio del capitolato e di OpenCode (skill, comandi, plugin); scelta dei referenti per area; tracciamento su GitHub; bozze di _Norme di Progetto_ e _Piano di Progetto_],
      [S2], [2026-11-23], [2026-12-06], [56], [Casi d'uso e requisiti, con i nove requisiti obbligatori resi verificabili e gli opzionali classificati; scelta del progetto per le verifiche; stato dell'arte su OpenSpec, Spec-kit e raccolte di skill],
      [S3], [2026-12-07], [2026-12-20], [58], [_Analisi dei Requisiti_; scelte tecnologiche definitive; avvio del PoC: lettura dei diagrammi dei casi d'uso],
      [S4], [2026-12-21], [2027-01-03], [42], [PoC: prima skill che confronta casi d'uso e specifiche dei requisiti (festività)],
      [S5], [2027-01-04], [2027-01-17], [42], [PoC: segnalazione delle discrepanze su un caso di prova, con modelli grandi e piccoli; _Piano di Qualifica_ (rientro dalle festività)],
      [S6], [2027-01-18], [2027-01-31], [48], [Completamento dei documenti e revisione RTB; avvio della progettazione (sessione d'esame)]
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Calendario di massima RTB],
) <tab-calendario>
#show figure: set block(breakable: false)

== Product Baseline
Le attività previste per la revisione PB (Product Baseline) sono le seguenti:
- Proseguimento della progettazione
- Sviluppo dell'MVP
Di seguito è riportato un calendario di massima stabilito nella _Dichiarazione degli Impegni_.
#show figure: set block(breakable: true)
#figure(
  tab((center, center, center, center, left),
    (1.4cm, 2.5cm, 2.5cm, 1.2cm, 1fr),
    ("Sprint", "Data inizio", "Data fine", "Ore", "Attività principali"),
    (
      [S7], [2027-02-01], [2027-02-14], [46], [Correzioni dopo la RTB; progettazione architetturale di skill, comandi, componente di appoggio e installazione (sessione d'esame)],
      [S8], [2027-02-15], [2027-02-28], [56], [Progettazione di dettaglio; codifica della lettura di casi d'uso e specifiche e del loro confronto (sessione d'esame)],
      [S9], [2027-03-01], [2027-03-14], [70], [Codifica della lettura del codice e del confronto con le specifiche; dashboard a caratteri; test automatici],
      [S10], [2027-03-15], [2027-04-02], [80], [Completamento e verifica dell'MVP; script di installazione; prova sul progetto di riferimento con Zucchetti; _Specifica Architetturale_, _Manuale Utente_ e manuale per chi estende skill, comandi e tool; revisione PB e consegna (Pasqua)],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Calendario di massima PB],
) <tab-calendario>
#show figure: set block(breakable: false)

= Pianificazione per periodo

== Sprint 1

=== Informazioni generali e attività da svolgere

#show figure: set block(breakable: true)
#figure(
  tab((center, center, center, center, left),
    (3cm, 3cm, 5cm, 5cm),
    ("Data inizio", "Data fine", "Ore preventivate", "Costo previsto"),
    (
      [2026-11-11], [2026-11-22], [42], [930,00 €],
    ),
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Sprint 1],
) <tab-calendario>
#show figure: set block(breakable: false)

Il primo sprint dura dodici giorni invece di due settimane. Il gruppo parte mercoledì 2026-11-11 e allinea la chiusura al lunedì successivo alla fine dello sprint, giorno della riunione settimanale. Nello sprint non si progetta né si scrive codice, quindi non sono previsti Progettisti né Programmatori.

Le attività che il gruppo prevede di svolgere sono:
- Primo incontro con Zucchetti
- Studio del capitolato e del funzionamento di OpenCode e OpenSpec
- Scelta dei referenti per area
- Prime ipotesi sul progetto da usare per le verifiche, primi casi d'uso e domande per Zucchetti
- Impostazione del tracciamento su GitHub
- Bozze di _Norme di Progetto_ e _Piano di Progetto_
- Verifica dei documenti prodotti nello sprint

=== Preventivo
#preventivo-sprint(
  (
    ("Responsabile", "Matilde Pedrocchi", 7),
    ("Amministratore", "Alessandro Zanier", 7),
    ("Analista", "Francesco Bassani", 8),
    ("Analista", "Alessandro Ravenna", 8),
    ("Verificatore", "Matteo Angelini", 6),
    ("Verificatore", "Andrea Nogara", 6),
  ),
  [Preventivo dello Sprint 1],
)

=== Rischi attesi
I rischi che il gruppo si aspetta di incontrare in questo sprint sono:
- *R01 – Tecnologie nuove per il gruppo*: studio di OpenCode e dei suoi meccanismi di estensione
- *R11 – Stime imprecise per inesperienza*: primo preventivo di sprint del gruppo
- *R12 – Comunicazione con la proponente*: primo contatto con Zucchetti

=== Consuntivo
#preventivo-sprint(
  (
    ("Responsabile", "Matilde Pedrocchi", 6),
    ("Amministratore", "Alessandro Zanier", 7),
    ("Analista", "Francesco Bassani", 10),
    ("Analista", "Alessandro Ravenna", 10),
    ("Verificatore", "Matteo Angelini", 5),
    ("Verificatore", "Andrea Nogara", 4),
  ),
  [Consuntivo dello Sprint 1],
)

Durante questo sprint il gruppo ha speso 25,00 € in più rispetto a quanto preventivato.

#gantt(
  "2026-11-11",
  "2026-11-22",
  (
    (nome: "Organizzazione del primo incontro con Zucchetti", inizio: "2026-11-11", fine: "2026-11-13", chi: "Matilde Pedrocchi"),
    (nome: "Piano di Progetto", inizio: "2026-11-14", fine: "2026-11-22", chi:"Matilde Pedrocchi"),
    (nome: "Norme di Progetto", inizio: "2026-11-11", fine: "2026-11-16", chi:"Alessandro Zanier"),
    (nome: "Automazione approvazione del responsabile su GitHub", inizio: "2026-11-16", fine: "2026-11-20", chi:"Alessandro Zanier"),
    (nome: "Analisi dei Requisiti", inizio: "2026-11-16", fine: "2026-11-22", chi:"Francesco Bassani, Alessandro Ravenna"),
    (nome: "Glossario", inizio:"2026-11-18", fine:"2026-11-22", chi: "Francesco Bassani"),
    (nome:"Studio OpenCode", inizio:"2026-11-14", fine:"2026-11-22", chi:"Francesco Bassani, Alessandro Ravenna"),
    (nome: "Fine sprint", data: "2026-11-22", milestone: true),
  ),
  didascalia: [Diagramma di Gantt dello Sprint 1],
)

=== Rischi incontrati
I rischi incontrati dal gruppo durante questo sprint sono:
- *R01 – Tecnologie nuove per il gruppo*: lo studio di OpenCode sta richiedendo più tempo di quanto previsto
- *R11 – Stime imprecise per inesperienza*: le ore produttive di alcuni ruoli, in particolare analisti e verificatori, sono state rispettivamente sottostimate e sovrastimate.
I rischio R12 non è stato al momento incontrato. Con la proponente si è accordato un secondo incontro quando il gruppo avrà ulteriormente approfondito tecnologie e raccolto una quantità soddisfacente di casi d'uso, per poi discuterne insieme.

=== Retrospettiva
Durante questo sprint sono state svolte tutte le attività programmate, con l'eccezione della ricerca di un progetto su cui poi effettuare la fase di verifica. Questa attività verrà riprogrammata per uno sprint successivo e dopo un ulteriore incontro con la proponente, siccome il gruppo ritiene che sia prematuro intraprenderla prima di aver approfondito a sufficienza le tecnologie richieste dal capitolato.
È stato inoltre redatta la prima versione del Glossario, attività che inizialmente non era stata programmata. 

Il gruppo ha havuto difficoltà nell'accorgersi dell'apertura di pull request, lasciandole quindi non visionate per un certo lasso di tempo.

=== Misure correttive
Il gruppo ha deciso che, per fare in modo che le pull request vengano visionate il prima possibile, chi le apre debba avvisare il resto del gruppo tramite il canale concordato.

=== Aggiornamento del preventivo a finire
#figure(
  table(
    columns: (2fr, 1fr),
    align: (left, center),
    stroke: 0.5pt + luma(180),
    fill: (_, y) => if y == 0 { colore-primario } else if calc.odd(y) { luma(248) } else { white },
    
    table.header(
      text(fill: white, weight: "bold")[Voce],
      text(fill: white, weight: "bold")[Valore],
    ),

    [Preventivo iniziale],          [11.040,00 €],
    [Rimanente prima dello sprint], [11.040,00 €],
    [Consuntivo sprint],            [955,00 €],
    [Preventivo a finire],          [10.085,00 €],
  ),
  kind: table,
  supplement: [Tabella],
  caption: [Preventivo e consuntivo dei costi],
)