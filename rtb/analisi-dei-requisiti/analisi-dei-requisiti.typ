// ============================================================
//  Analisi dei Requisiti – Capitolato C9 SpecCheck (Zucchetti S.p.A.)
//
//  Compilare dalla root del repository con:
//    typst compile --root . rtb/analisi-dei-requisiti/analisi-dei-requisiti.typ
//
//  I requisiti sono definiti una sola volta negli elenchi `rf`, `rq`, `rv`:
//  tabelle dei requisiti, tracciamento e riepilogo sono generati da lì.
//  Per aggiungere un requisito: aggiungere una riga all'elenco, con le fonti.
// ============================================================

#import "/templates/documento.typ": documento, tabella, colore-primario, colore-scuro, colore-accento, colore-sfondo

#show: documento.with(
  titolo: "Analisi dei Requisiti",
  sottotitolo: "Capitolato C9 – SpecCheck · Zucchetti S.p.A.",
  gruppo: "Hex4dev",
  numero-gruppo: "14",
  versione: "0.1",
  data: "2026-11-15",
  uso: "Esterno",
  redattori: ("Francesco Bassani",),
  verificatori: (),
  registro: (
    ("0.1", "2026-11-15", "Francesco Bassani", "—", "Prima bozza: descrizione del prodotto, casi d'uso, requisiti e tracciamento ricavati dal capitolato"),
  ),
)

// ------------------------------------------------------------
//  Stili locali
// ------------------------------------------------------------
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: set text(size: 10pt)
#show figure.where(kind: table): set block(breakable: true)
#show figure.where(kind: image): set block(breakable: false)
#let tab(al, ..args) = { set table(align: al); tabella(..args) }
#let figura-tab(didascalia, corpo) = figure(corpo, kind: table, supplement: [Tabella], caption: didascalia)

// ------------------------------------------------------------
//  Diagrammi dei casi d'uso (disegnati con primitive Typst)
// ------------------------------------------------------------
#let _seg(a, b, ..args) = place(top + left, line(
  start: (a.at(0) * 1cm, a.at(1) * 1cm),
  end: (b.at(0) * 1cm, b.at(1) * 1cm),
  ..args,
))

#let _attore(x, y, nome) = {
  let s = 0.9pt + colore-scuro
  place(top + left, dx: (x - 0.2) * 1cm, dy: (y - 0.75) * 1cm, circle(radius: 0.2cm, stroke: s, fill: white))
  _seg((x, y - 0.35), (x, y + 0.2), stroke: s)
  _seg((x - 0.32, y - 0.15), (x + 0.32, y - 0.15), stroke: s)
  _seg((x, y + 0.2), (x - 0.27, y + 0.62), stroke: s)
  _seg((x, y + 0.2), (x + 0.27, y + 0.62), stroke: s)
  place(top + left, dx: (x - 1.3) * 1cm, dy: (y + 0.72) * 1cm,
    box(width: 2.6cm, align(center, text(size: 8.5pt, weight: "semibold", fill: colore-scuro)[#nome])))
}

// casi: elenco di dizionari (id, nome, riga, col, sx, dx)
// relazioni: elenco di (da, a), disegnate come frecce tratteggiate «extend»
#let caso(id, nome, riga: auto, col: 0, sx: true, dx: false, opz: false) = (
  id: id, nome: nome, riga: riga, col: col, sx: sx, dx: dx, opz: opz,
)

// Freccia con punta aperta da a verso b
#let _freccia(a, b, tratteggio: false, punta: 0.28) = {
  let s = if tratteggio { (paint: colore-scuro, thickness: 0.8pt, dash: "dashed") } else { 0.9pt + colore-scuro }
  _seg(a, b, stroke: s)
  let ang = calc.atan2(b.at(0) - a.at(0), b.at(1) - a.at(1))
  for d in (-25deg, 25deg) {
    _seg(b, (b.at(0) - punta * calc.cos(ang + d), b.at(1) - punta * calc.sin(ang + d)), stroke: 0.9pt + colore-scuro)
  }
}

// Le associazioni terminano sul bordo dell'ellisse (mai dietro altri casi d'uso).
// Con due colonne, la seconda contiene i casi d'uso che estendono quelli della prima.
#let diagramma-uc(sistema, casi, relazioni: (), attore-sx: "Sviluppatore", attore-dx: none, colonne: 1, passo: 1.42) = {
  let ry = 0.56
  let (cxs, rx, bordo) = if colonne == 1 { ((8.0,), 3.3, (3.9, 12.1)) } else { ((5.9, 12.8), 2.3, (3.1, 15.6)) }
  let casi = casi.enumerate().map(((i, c)) => {
    let r = if c.riga == auto { i } else { c.riga }
    c + (cx: cxs.at(c.col), cy: 1.6 + r * passo)
  })
  let fondo = calc.max(..casi.map(c => c.cy)) + ry + 0.45
  let media(v) = v.sum() / v.len()
  let s-ass = 0.9pt + colore-scuro

  block(width: 16cm, height: fondo * 1cm + 0.2cm, breakable: false, {
    // confine del sistema
    place(top + left, dx: bordo.at(0) * 1cm, dy: 0.3cm, rect(
      width: (bordo.at(1) - bordo.at(0)) * 1cm, height: (fondo - 0.3) * 1cm,
      stroke: 1pt + colore-primario, fill: colore-sfondo, radius: 3pt,
    ))
    place(top + left, dx: (bordo.at(0) + 0.25) * 1cm, dy: 0.5cm,
      text(size: 9pt, weight: "bold", fill: colore-scuro)[#sistema])

    // casi d'uso
    for c in casi {
      place(top + left, dx: (c.cx - rx) * 1cm, dy: (c.cy - ry) * 1cm, ellipse(
        width: 2 * rx * 1cm, height: 2 * ry * 1cm,
        fill: white,
        stroke: if c.opz { (paint: colore-primario, thickness: 0.9pt, dash: "dashed") } else { 0.9pt + colore-primario },
      ))
      place(top + left, dx: (c.cx - rx + 0.45) * 1cm, dy: (c.cy - ry) * 1cm, box(
        width: (2 * rx - 0.9) * 1cm, height: 2 * ry * 1cm,
        align(center + horizon, {
          set par(justify: false, leading: 0.4em)
          text(size: 8pt, weight: "bold", fill: colore-scuro)[#c.id]
          linebreak()
          text(size: 8pt)[#c.nome]
        }),
      ))
    }

    // attori e associazioni: dall'attore al bordo del caso d'uso
    let collegati-sx = casi.filter(c => c.sx)
    if collegati-sx.len() > 0 {
      let y = media(collegati-sx.map(c => c.cy))
      for c in collegati-sx { _seg((1.75, y - 0.1), (c.cx - rx, c.cy), stroke: s-ass) }
      _attore(1.3, y, attore-sx)
    }
    let collegati-dx = casi.filter(c => c.dx)
    if attore-dx != none and collegati-dx.len() > 0 {
      let y = media(collegati-dx.map(c => c.cy))
      for c in collegati-dx { _seg((14.25, y - 0.1), (c.cx + rx, c.cy), stroke: s-ass) }
      _attore(14.7, y, attore-dx)
    }

    // estensioni: dal bordo sinistro del caso che estende al bordo destro del caso esteso
    for (da, a) in relazioni {
      let p = casi.find(c => c.id == da)
      let q = casi.find(c => c.id == a)
      let inizio = (p.cx - rx, p.cy)
      let punta = (q.cx + rx, q.cy)
      _freccia(inizio, punta, tratteggio: true)
      let (mx, my) = (inizio.at(0) * 0.42 + punta.at(0) * 0.58, inizio.at(1) * 0.42 + punta.at(1) * 0.58)
      place(top + left, dx: (mx - 0.8) * 1cm, dy: (my - 0.17) * 1cm,
        box(width: 1.6cm, align(center, box(fill: colore-sfondo, inset: (x: 2pt, y: 1.5pt),
          text(size: 7pt, fill: colore-scuro)[«extend»]))))
    }
  })
}

// Schema della catena di tracciabilità
#let schema-catena = block(width: 16cm, height: 5.9cm, breakable: false, {
  set par(justify: false, leading: 0.45em)
  let riquadro(x, y, w, h, colore, corpo) = place(top + left, dx: x * 1cm, dy: y * 1cm, rect(
    width: w * 1cm, height: h * 1cm, fill: colore, stroke: 0.9pt + colore-primario, radius: 3pt, inset: 4pt,
    align(center + horizon, text(size: 9pt, corpo)),
  ))
  let nota(x, y, w, corpo) = place(top + left, dx: x * 1cm, dy: y * 1cm,
    box(width: w * 1cm, align(center, text(size: 7.5pt, fill: colore-scuro, corpo))))
  // artefatti del progetto verificato
  riquadro(0, 0.5, 3.8, 1.3, colore-sfondo)[*Casi d'uso* \ diagrammi e documentazione]
  riquadro(6.1, 0.5, 3.8, 1.3, colore-sfondo)[*Specifiche dei requisiti* \ documenti testuali]
  riquadro(12.2, 0.5, 3.8, 1.3, colore-sfondo)[*Codice sorgente* \ comportamento del programma]
  _freccia((3.8, 1.15), (6.1, 1.15))
  _freccia((9.9, 1.15), (12.2, 1.15))
  nota(3.8, 0.62, 2.3)[tradotti in]
  nota(9.9, 0.62, 2.3)[realizzate da]
  // verifiche: ciascuna controlla un passaggio della catena
  _freccia((4.95, 2.75), (4.95, 1.25), tratteggio: true)
  _freccia((11.05, 2.75), (11.05, 1.25), tratteggio: true)
  riquadro(2.4, 2.75, 5.1, 1.15, white)[*Verifica 1* (UC5) \ casi d'uso – requisiti]
  riquadro(8.5, 2.75, 5.1, 1.15, white)[*Verifica 2* (UC7) \ requisiti – codice]
  nota(5.05, 2.05, 1.6)[controlla]
  nota(11.15, 2.05, 1.6)[controlla]
  // esiti verso la dashboard
  _freccia((4.95, 3.9), (4.95, 4.85))
  _freccia((11.05, 3.9), (11.05, 4.85))
  nota(5.05, 4.2, 1.2)[esiti]
  nota(11.15, 4.2, 1.2)[esiti]
  riquadro(2.4, 4.85, 11.2, 0.9, colore-accento.lighten(65%))[*Dashboard* (UC8) · stato della realizzazione e discrepanze]
})

// ------------------------------------------------------------
//  Scheda di un caso d'uso
// ------------------------------------------------------------
#let uc(id, titolo, principale: "Sviluppatore", secondari: "Nessuno", descrizione: none, pre: (), post: (), scenario: (), estensioni: none, nota: none) = {
  show: block.with(breakable: false, width: 100%)
  heading(level: 3, numbering: none)[#id – #titolo]
  set text(size: 10pt)
  set par(justify: false)
  let voce(t) = text(weight: "semibold", fill: colore-scuro)[#t]
  let righe = (
    voce[Attore principale], [#principale],
    voce[Attori secondari], [#secondari],
    voce[Descrizione], descrizione,
    voce[Precondizioni], list(..pre),
    voce[Postcondizioni], list(..post),
    voce[Scenario principale], enum(..scenario),
  )
  if estensioni != none { righe += (voce[Estensioni], list(..estensioni)) }
  if nota != none { righe += (voce[Note], nota) }
  table(
    columns: (3.4cm, 1fr),
    stroke: 0.5pt + colore-primario.lighten(55%),
    inset: (x: 7pt, y: 6pt),
    fill: (x, _) => if x == 0 { colore-sfondo } else { white },
    ..righe,
  )
}

// ------------------------------------------------------------
//  Requisiti: (codice, classe, descrizione, fonti)
//  Classe: O = obbligatorio, D = desiderabile, P = opzionale
// ------------------------------------------------------------
#let rf = (
  ("RF-01", "O", [SpecCheck si installa in OpenCode con un unico script, che aggiunge in una sola operazione tutte le componenti del prodotto (skill, comandi, tool e plugin).], ("C-PR", "UC1")),
  ("RF-02", "O", [Lo script di installazione è disponibile per almeno una tra le shell bash e PowerShell.], ("C-PR", "UC1")),
  ("RF-03", "D", [Lo script di installazione è disponibile sia per bash sia per PowerShell.], ("INT", "UC1")),
  ("RF-04", "O", [Al termine dell'installazione il sistema ne comunica l'esito e, in caso di errore, la causa.], ("INT", "UC1")),
  ("RF-05", "O", [Lo sviluppatore può indicare dove si trovano, nel progetto da verificare, i diagrammi dei casi d'uso, la documentazione aggiuntiva dei casi d'uso, le specifiche dei requisiti e il codice sorgente.], ("INT", "UC2")),
  ("RF-06", "O", [Il sistema legge i diagrammi dei casi d'uso da file in almeno un formato testuale tra Mermaid e XMI.], ("C-O1", "UC3.1")),
  ("RF-07", "O", [Dai diagrammi il sistema ricava gli attori, i casi d'uso e le relazioni tra di essi (associazione, inclusione, estensione, generalizzazione).], ("C-O1", "UC3.1")),
  ("RF-08", "D", [Il sistema legge i diagrammi dei casi d'uso sia in formato Mermaid sia in formato XMI.], ("C-O1", "UC3.1")),
  ("RF-09", "D", [Il sistema legge i diagrammi dei casi d'uso da file immagine in formato PNG o JPEG.], ("C-O1", "UC3.1")),
  ("RF-10", "O", [Il sistema legge la documentazione aggiuntiva dei casi d'uso da file in formato Markdown.], ("C-O2", "UC3.2")),
  ("RF-11", "O", [Il sistema associa la documentazione aggiuntiva al caso d'uso del diagramma a cui si riferisce e ne integra la descrizione.], ("C-O2", "UC3.2")),
  ("RF-12", "D", [Il sistema segnala i casi d'uso del diagramma privi di documentazione e la documentazione che non corrisponde ad alcun caso d'uso del diagramma.], ("INT", "UC3.2")),
  ("RF-13", "O", [Il sistema legge le specifiche dei requisiti da file in formato Markdown.], ("C-O3", "UC4")),
  ("RF-14", "O", [Il sistema individua i singoli requisiti contenuti nelle specifiche, ciascuno con il proprio identificativo (se presente) e la propria descrizione.], ("C-O3", "UC4")),
  ("RF-15", "O", [Per ogni caso d'uso il sistema individua le specifiche dei requisiti che lo realizzano; un caso d'uso può essere associato a più specifiche.], ("C-O4", "UC5.1")),
  ("RF-16", "O", [Il sistema segnala i casi d'uso per i quali non trova alcuna specifica dei requisiti.], ("C-O4", "UC5.1")),
  ("RF-17", "D", [Il sistema segnala le specifiche dei requisiti che non sono riconducibili ad alcun caso d'uso.], ("INT", "UC5.1")),
  ("RF-18", "O", [Per ogni associazione il sistema valuta se il testo del caso d'uso e quello delle specifiche descrivono lo stesso comportamento.], ("C-O5", "UC5.2")),
  ("RF-19", "O", [Il sistema segnala ogni mancata rispondenza tra caso d'uso e specifiche, compresi i casi in cui la rispondenza non è determinabile.], ("C-O5", "UC5.2")),
  ("RF-20", "O", [Ogni segnalazione indica gli elementi coinvolti (caso d'uso, specifica, file) e la motivazione.], ("C-O5", "C-O9", "UC5.2", "UC7")),
  ("RF-21", "O", [Il sistema legge il codice sorgente del progetto e ne ricava una descrizione del comportamento del programma.], ("C-O6", "UC6")),
  ("RF-22", "O", [Il sistema confronta il comportamento ricavato dal codice con le specifiche dei requisiti.], ("C-O7", "UC7")),
  ("RF-23", "O", [Per ogni specifica dei requisiti il sistema stabilisce un esito: implementata, non implementata oppure non determinabile.], ("C-O8", "UC7")),
  ("RF-24", "D", [Per ogni specifica rilevata nel codice il sistema indica i file che la realizzano.], ("INT", "UC7")),
  ("RF-25", "O", [Lo sviluppatore avvia ciascuna verifica (casi d'uso – requisiti, requisiti – codice) con un comando esplicito di OpenCode.], ("PRES", "UC5", "UC7")),
  ("RF-26", "D", [Lo sviluppatore avvia con un solo comando l'intera catena di verifica, dai casi d'uso al codice.], ("INT", "UC5", "UC7")),
  ("RF-27", "O", [Gli esiti delle verifiche sono salvati in forma strutturata e persistente, leggibile dalla componente che produce la dashboard.], ("C-O9", "INT", "UC5", "UC7")),
  ("RF-28", "O", [Il sistema presenta in una dashboard lo stato della realizzazione rispetto a quanto previsto dalle specifiche dei requisiti.], ("C-O9", "UC8.1")),
  ("RF-29", "O", [La dashboard mostra quali casi d'uso sono stati rilevati nelle specifiche dei requisiti e quali no.], ("C-O9", "UC8.1")),
  ("RF-30", "O", [La dashboard mostra quali specifiche dei requisiti sono state rilevate nel codice e quali no.], ("C-O9", "UC8.1")),
  ("RF-31", "O", [La dashboard mette in evidenza ogni discrepanza tra codice e specifiche, in modo che sia immediatamente riconoscibile.], ("C-O9", "UC8.2")),
  ("RF-32", "O", [La dashboard è consultabile a caratteri, nel terminale in cui opera OpenCode.], ("C-O9", "UC8")),
  ("RF-33", "O", [Se una fonte non è leggibile o è in un formato non supportato, il sistema lo segnala indicando il file interessato.], ("INT", "UC9")),
  ("RF-34", "O", [Se il modello di linguaggio non è disponibile, il sistema lo segnala e non registra come definitivi esiti parziali.], ("INT", "UC10")),
  ("RF-35", "P", [Il sistema presenta gli esiti delle verifiche in una dashboard grafica, ad esempio una pagina HTML.], ("C-P1", "UC11")),
  ("RF-36", "P", [Nella dashboard grafica lo sviluppatore esplora le discrepanze rilevate, fino al dettaglio della singola segnalazione.], ("C-P1", "UC11")),
  ("RF-37", "P", [Il sistema individua le parti del codice che non derivano da alcuna specifica dei requisiti.], ("C-P2", "UC12")),
  ("RF-38", "P", [Il sistema riporta la copertura del codice da parte delle specifiche dei requisiti.], ("C-P2", "UC12")),
  ("RF-39", "P", [Il sistema legge i casi d'uso e i relativi diagrammi da file in formato PDF.], ("C-P3", "UC13")),
  ("RF-40", "P", [Il sistema legge le specifiche dei requisiti da file in formato PDF.], ("C-P3", "UC13")),
)

#let rq = (
  ("RQ-01", "O", [A partire dall'MVP il prodotto è accompagnato da test automatici, con la copertura fissata nel _Piano di Qualifica_.], ("C-TE",)),
  ("RQ-02", "O", [I test automatici ripetono i casi d'uso principali del prodotto, così da poterlo verificare a ogni revisione.], ("C-TE",)),
  ("RQ-03", "O", [Il prodotto è accompagnato da un manuale per l'utilizzo.], ("C-DO",)),
  ("RQ-04", "O", [Il prodotto è accompagnato da un manuale per chi vuole estendere skill, comandi e tool.], ("C-DO",)),
  ("RQ-05", "O", [Il progetto è corredato dalla documentazione minima richiesta dal corso di Ingegneria del Software.], ("C-DO",)),
  ("RQ-06", "O", [L'architettura adotta pattern di comprovata duttilità e robustezza, che permettono di rivedere ed estendere il codice a ogni iterazione.], ("C-AR",)),
  ("RQ-07", "D", [Il prodotto è pubblicato in un repository pubblico, con una licenza open source.], ("C-GA",)),
  ("RQ-08", "D", [Le verifiche sono provate sia con un modello di grandi dimensioni sia con almeno un modello di piccole dimensioni, e i risultati sono documentati.], ("C-MO",)),
)

#let rv = (
  ("RV-01", "O", [Il prodotto è realizzato come insieme di estensioni di OpenCode: skill, comandi e tool.], ("C-OG", "C-PR")),
  ("RV-02", "O", [Il prodotto comprende almeno un plugin per OpenCode.], ("C-PR",)),
  ("RV-03", "O", [La dashboard è prodotta da un plugin per OpenCode o da un applicativo esterno richiamato da skill e comandi, e non dal modello di linguaggio.], ("C-O9",)),
  ("RV-04", "O", [A parità di esiti salvati, la dashboard riporta sempre gli stessi dati.], ("C-O9", "INT")),
  ("RV-05", "O", [Il prodotto verifica soltanto: non genera né modifica casi d'uso, specifiche dei requisiti e codice del progetto verificato.], ("C-OG",)),
  ("RV-06", "O", [Il prodotto opera su un progetto software esterno, gestito con OpenCode, senza interferire con il suo avanzamento.], ("C-OG",)),
)

#let tutti = rf + rq + rv
#let nome-classe = (O: "Obbligatorio", D: "Desiderabile", P: "Opzionale")

#let tabella-requisiti(elenco) = tab(
  (center, center, left, left),
  (1.6cm, 2.5cm, 1fr, 2.7cm),
  ("Codice", "Classe", "Descrizione", "Fonti"),
  elenco.map(r => ([*#r.at(0)*], [#nome-classe.at(r.at(1))], r.at(2), [#r.at(3).join(", ")])).flatten(),
)

#let requisiti-di(fonte) = tutti.filter(r => fonte in r.at(3)).map(r => r.at(0))

// Fonti del capitolato, nell'ordine in cui compaiono nel tracciamento
#let fonti = (
  ("C-OG", [Capitolato, «Oggetto dell'appalto»]),
  ("C-O1", [Capitolato, requisiti obbligatori, punto 1: lettura dei diagrammi dei casi d'uso]),
  ("C-O2", [Capitolato, requisiti obbligatori, punto 2: lettura della documentazione aggiuntiva sui casi d'uso]),
  ("C-O3", [Capitolato, requisiti obbligatori, punto 3: lettura delle specifiche dei requisiti]),
  ("C-O4", [Capitolato, requisiti obbligatori, punto 4: confronto tra casi d'uso e specifiche dei requisiti]),
  ("C-O5", [Capitolato, requisiti obbligatori, punto 5: verifica della rispondenza delle specifiche ai casi d'uso]),
  ("C-O6", [Capitolato, requisiti obbligatori, punto 6: lettura del codice e comprensione del comportamento]),
  ("C-O7", [Capitolato, requisiti obbligatori, punto 7: confronto del codice con le specifiche dei requisiti]),
  ("C-O8", [Capitolato, requisiti obbligatori, punto 8: verifica che il programma implementi le specifiche]),
  ("C-O9", [Capitolato, requisiti obbligatori, punto 9: dashboard sullo stato della realizzazione]),
  ("C-PR", [Capitolato, requisiti obbligatori: prodotto finale (pacchetto unico, plugin, installazione)]),
  ("C-TE", [Capitolato, requisiti obbligatori: copertura con test automatici]),
  ("C-AR", [Capitolato, requisiti obbligatori: pattern architetturali]),
  ("C-MO", [Capitolato, requisiti obbligatori: modelli messi a disposizione dall'azienda]),
  ("C-P1", [Capitolato, requisiti opzionali: dashboard grafica]),
  ("C-P2", [Capitolato, requisiti opzionali: verifica della copertura delle specifiche]),
  ("C-P3", [Capitolato, requisiti opzionali: lettura da file PDF]),
  ("C-DO", [Capitolato, «Documentazione»]),
  ("C-GA", [Capitolato, «Garanzia e Manutenzione»]),
  ("PRES", [Presentazione del capitolato (Zucchetti, 2026)]),
  ("INT", [Decisione interna del gruppo, da confermare con la proponente]),
)

#let casi-uso = (
  ("UC1", "Installazione di SpecCheck"),
  ("UC2", "Configurazione delle fonti"),
  ("UC3.1", "Lettura dei diagrammi dei casi d'uso"),
  ("UC3.2", "Lettura della documentazione aggiuntiva"),
  ("UC4", "Acquisizione dei requisiti"),
  ("UC5", "Verifica casi d'uso – requisiti"),
  ("UC5.1", "Associazione dei casi d'uso ai requisiti"),
  ("UC5.2", "Valutazione della rispondenza"),
  ("UC6", "Analisi del codice sorgente"),
  ("UC7", "Verifica requisiti – codice"),
  ("UC8", "Consultazione della dashboard"),
  ("UC8.1", "Visualizzazione dello stato di avanzamento"),
  ("UC8.2", "Visualizzazione delle discrepanze"),
  ("UC9", "Segnalazione di fonte non leggibile"),
  ("UC10", "Segnalazione di modello non disponibile"),
  ("UC11", "Esplorazione della dashboard grafica"),
  ("UC12", "Verifica della copertura del codice"),
  ("UC13", "Acquisizione da file PDF"),
)

// Elenchi di figure e tabelle, dopo l'indice (come negli altri documenti del gruppo)
#v(0.6cm)
#heading(numbering: none, outlined: false)[Elenco delle figure]
#{
  set par(justify: false)
  outline(title: none, target: figure.where(kind: image))
}
#v(0.6cm)
#heading(numbering: none, outlined: false)[Elenco delle tabelle]
#{
  set par(justify: false)
  outline(title: none, target: figure.where(kind: table))
}

// ============================================================
= Introduzione

== Scopo del documento
Questo documento descrive che cosa deve fare SpecCheck, il prodotto richiesto dal capitolato C9 di Zucchetti S.p.A.: chi lo usa, in quali situazioni (casi d'uso) e quali requisiti deve soddisfare. È il riferimento per la progettazione, per i test di sistema e di accettazione del _Piano di Qualifica_ e per il confronto con la proponente sul perimetro del prodotto.

La versione corrente è una *prima bozza*, ricavata dal solo capitolato e dalla sua presentazione, prima dell'incontro con la proponente. I punti che il capitolato lascia aperti sono raccolti nella @questioni: le risposte di Zucchetti saranno integrate nelle versioni successive. I requisiti con fonte «INT» sono proposte del gruppo e vanno confermati nello stesso incontro.

== Scopo del prodotto
I modelli di linguaggio (LLM) producono codice a grande velocità, ma nessuno strumento oggi dice se quel codice realizza davvero ciò che era stato richiesto: il collo di bottiglia si è spostato dalla scrittura alla verifica. SpecCheck è un insieme di estensioni di OpenCode che, nel contesto di un progetto software, verifica la tracciabilità lungo la catena *casi d'uso → specifiche dei requisiti → codice sorgente*, e riporta in una dashboard lo stato della realizzazione e le discrepanze trovate. Il prodotto verifica; la realizzazione resta ai programmatori.

== Glossario
I termini tecnici e di dominio saranno definiti nel _Glossario_, documento separato in corso di predisposizione. In attesa della sua pubblicazione, i termini necessari alla lettura sono definiti nella @tab-termini.

== Riferimenti
=== Riferimenti normativi
- Capitolato d'appalto C9 – _SpecCheck: sviluppo di skill per OpenCode per la verifica della tracciabilità end-to-end da casi d'uso a requisiti e codice sorgente_, Zucchetti S.p.A., a.a. 2026/2027.
- _Dichiarazione degli impegni_, Hex4dev, versione 2.0 del 2026-11-09.
- Verbale interno VI-2026-11-11, Hex4dev (decisione D5: avvio dell'analisi dei requisiti da una bozza interna).

=== Riferimenti informativi
- Presentazione del capitolato C9, Zucchetti S.p.A., 2026.
- OpenCode: #link("https://opencode.ai/").
- OpenSpec, indicato dal capitolato come esempio di architettura a comandi, skill ed eseguibile di appoggio: #link("https://openspec.dev/").
- PlantUML e UMLet, indicati dal capitolato come strumenti testuali per i diagrammi UML: #link("https://plantuml.com"), #link("https://www.umlet.com/").

// ============================================================
= Descrizione del prodotto

== Contesto d'uso
SpecCheck non è un'applicazione autonoma: si installa in OpenCode, lo strumento con cui lo sviluppatore governa un proprio progetto software, e ne estende le funzioni. Il progetto verificato è quindi *esterno* a SpecCheck e contiene tre gruppi di artefatti, prodotti in fasi successive: i casi d'uso (diagrammi e documentazione), le specifiche dei requisiti e il codice sorgente. Il capitolato assume che i casi d'uso siano già stati controllati nella loro correttezza sintattica e semantica.

Le verifiche sono due, una per ogni passaggio della catena (@fig-catena). La prima controlla che ogni caso d'uso sia riportato correttamente nelle specifiche dei requisiti; la seconda che il comportamento del programma, ricavato dal codice, realizzi quanto le specifiche richiedono.

#figure(
  schema-catena,
  caption: [Catena di tracciabilità e verifiche di SpecCheck],
) <fig-catena>

== Componenti del prodotto
Il prodotto finale è un pacchetto unico, composto dai tipi di estensione che OpenCode mette a disposizione (@tab-termini). Il capitolato richiede almeno un plugin e un sistema di installazione che aggiunga a OpenCode tutte le componenti in una sola operazione.

#figura-tab([Termini e componenti])[
  #tab((left, left), (3.4cm, 1fr), ("Termine", "Significato in questo documento"), (
    [Harness], [Sistema che gestisce il contesto e sostiene pianificazione e produzione del codice attorno a un LLM. OpenCode è l'harness su cui opera SpecCheck.],
    [Skill], [File guida in linguaggio naturale che indica all'LLM una procedura operativa; l'harness la attiva quando la ritiene pertinente.],
    [Comando], [Istruzione analoga a una skill, ma lanciata in modo esplicito dallo sviluppatore.],
    [Tool], [Procedura esecutiva deterministica (ad esempio uno script) per compiti operativi come la lettura di file.],
    [Plugin], [Componente software che amplia le capacità di OpenCode e gestisce elaborazioni complesse.],
    [Fonte], [Artefatto del progetto verificato che SpecCheck legge: diagramma o documentazione dei casi d'uso, specifica dei requisiti, codice sorgente.],
    [Rispondenza], [Corrispondenza di contenuto tra due descrizioni dello stesso comportamento, a livelli diversi della catena.],
    [Discrepanza], [Mancata rispondenza rilevata da una verifica, oppure rispondenza che la verifica non è riuscita a determinare.],
    [Esito], [Risultato di una verifica su un singolo elemento (caso d'uso o specifica), salvato per la dashboard.],
  ))
] <tab-termini>

== Utenti
L'utente di SpecCheck è lo *sviluppatore* che lavora al progetto verificato con OpenCode: ha familiarità con il terminale, con i casi d'uso e con le specifiche dei requisiti del proprio progetto. Il capitolato prevede anche chi vorrà *estendere* skill, comandi e tool: a questa figura è destinato un manuale dedicato (RQ-04), ma non interagisce con il prodotto in modo diverso dallo sviluppatore e non costituisce un attore distinto.

== Vincoli generali
- I requisiti obbligatori del capitolato non sono modificabili in corso d'opera; i requisiti opzionali possono essere modificati, eliminati o integrati dal gruppo.
- Lo sviluppo procede in due fasi: un PoC, in cui il capitolato consiglia di esplorare soprattutto la lettura dei diagrammi dei casi d'uso e gli algoritmi di confronto, e un MVP che realizza tutti i requisiti obbligatori.
- Le parti che richiedono precisione e ripetibilità non possono essere affidate all'LLM: il capitolato richiede espressamente che la dashboard sia un plugin o un applicativo esterno richiamato da skill e comandi.

== Assunzioni e dipendenze
- *Progetto di riferimento.* Le verifiche richiedono un progetto con casi d'uso, specifiche e codice: il capitolato consiglia un progetto preesistente del gruppo o un esempio pubblico di buona qualità. La scelta è pianificata nello sprint S2.
- *Capacità dei modelli.* La qualità delle verifiche dipende dall'LLM in uso e non è garantita a priori. Zucchetti mette a disposizione modelli di grandi dimensioni, con un limite di costo, e modelli piccoli (Gemma 4 26B, Qwen 3.8 27B) senza limitazioni.
- *Evoluzione di OpenCode.* Le interfacce di skill, comandi, tool e plugin possono cambiare durante il progetto: la versione di riferimento sarà fissata entro lo sprint S3.
- *Formati di ingresso.* Per l'MVP si assumono documentazione dei casi d'uso e specifiche in Markdown, e diagrammi in un formato testuale. Il formato dei diagrammi è una delle questioni aperte (@questioni).

// ============================================================
= Casi d'uso

== Attori
#figura-tab([Attori])[
  #tab((left, left, left), (3cm, 2.4cm, 1fr), ("Attore", "Tipo", "Descrizione"), (
    [Sviluppatore], [Principale], [Persona che lavora al progetto verificato con OpenCode. Installa SpecCheck, indica le fonti, avvia le verifiche e consulta la dashboard.],
    [Modello LLM], [Secondario], [Modello di linguaggio, esterno a SpecCheck e raggiunto tramite OpenCode, a cui sono affidate la lettura delle fonti e le valutazioni di rispondenza.],
  ))
]

OpenCode non è modellato come attore: è la piattaforma in cui SpecCheck è installato e attraverso cui lo sviluppatore interagisce con il prodotto.

== Convenzioni
Ogni caso d'uso ha un codice `UC[n]`; i sottocasi hanno la forma `UC[n].[m]`. I casi d'uso da UC1 a UC10 derivano dai requisiti obbligatori del capitolato, quelli da UC11 a UC13 dai requisiti opzionali e sono disegnati con bordo tratteggiato. Nei diagrammi la linea continua collega un attore ai casi d'uso a cui partecipa e termina sul bordo del caso d'uso. La freccia tratteggiata con etichetta «extend» parte dal caso d'uso che estende e punta al caso d'uso esteso. Nei diagrammi delle estensioni l'attore secondario è omesso per leggibilità.

== Visione d'insieme
#figure(
  diagramma-uc("SpecCheck", (
    caso("UC1", "Installazione di SpecCheck"),
    caso("UC2", "Configurazione delle fonti"),
    caso("UC3", "Acquisizione dei casi d'uso", dx: true),
    caso("UC4", "Acquisizione dei requisiti", dx: true),
    caso("UC5", "Verifica casi d'uso – requisiti", dx: true),
    caso("UC6", "Analisi del codice sorgente", dx: true),
    caso("UC7", "Verifica requisiti – codice", dx: true),
    caso("UC8", "Consultazione della dashboard"),
  ), attore-dx: "Modello LLM"),
  caption: [Casi d'uso derivati dai requisiti obbligatori],
) <fig-insieme>

== Installazione e configurazione

#uc("UC1", "Installazione di SpecCheck",
  descrizione: [Lo sviluppatore aggiunge a OpenCode tutte le componenti di SpecCheck con un'unica operazione.],
  pre: ([OpenCode è installato sulla macchina dello sviluppatore.], [Lo sviluppatore dispone del pacchetto di SpecCheck.]),
  post: ([Skill, comandi, tool e plugin di SpecCheck sono disponibili in OpenCode.],),
  scenario: (
    [Lo sviluppatore esegue lo script di installazione.],
    [Il sistema aggiunge a OpenCode tutte le componenti del prodotto.],
    [Il sistema comunica che l'installazione è riuscita.],
  ),
  estensioni: ([Al passo 2 l'installazione non può essere completata (ad esempio OpenCode non è presente): il sistema comunica la causa e l'installazione termina.],),
)

#uc("UC2", "Configurazione delle fonti",
  descrizione: [Lo sviluppatore indica dove si trovano, nel progetto da verificare, gli artefatti che SpecCheck deve leggere.],
  pre: ([SpecCheck è installato in OpenCode (UC1).], [OpenCode è aperto sul progetto da verificare.]),
  post: ([Il sistema conosce la posizione di diagrammi dei casi d'uso, documentazione aggiuntiva, specifiche dei requisiti e codice sorgente.],),
  scenario: (
    [Lo sviluppatore indica la posizione dei diagrammi e della documentazione dei casi d'uso.],
    [Lo sviluppatore indica la posizione delle specifiche dei requisiti.],
    [Lo sviluppatore indica la posizione del codice sorgente.],
    [Il sistema conferma la configurazione.],
  ),
  nota: [Il capitolato non descrive questo passaggio: è una proposta del gruppo, necessaria perché il progetto verificato è esterno e la sua struttura non è nota a priori.],
)

== Acquisizione dei casi d'uso e dei requisiti

#figure(
  diagramma-uc("UC3 – Acquisizione dei casi d'uso", (
    caso("UC3.1", "Lettura dei diagrammi dei casi d'uso", dx: true),
    caso("UC3.2", "Lettura della documentazione aggiuntiva", dx: true),
  ), attore-dx: "Modello LLM"),
  caption: [Sottocasi di UC3],
)

#uc("UC3", "Acquisizione dei casi d'uso",
  secondari: "Modello LLM",
  descrizione: [Il sistema legge i casi d'uso del progetto verificato, dai diagrammi e dalla documentazione che li accompagna, e ne ricava un elenco su cui eseguire le verifiche.],
  pre: ([Le fonti sono configurate (UC2).],),
  post: ([Il sistema dispone dell'elenco dei casi d'uso, ciascuno con attori, relazioni e descrizione.],),
  scenario: (
    [Lo sviluppatore avvia l'acquisizione dei casi d'uso.],
    [Il sistema legge i diagrammi dei casi d'uso (UC3.1).],
    [Il sistema legge la documentazione aggiuntiva (UC3.2).],
    [Il sistema presenta l'elenco dei casi d'uso acquisiti.],
  ),
  estensioni: (
    [Una fonte non è leggibile o è in un formato non supportato: UC9.],
    [Il modello di linguaggio non è disponibile: UC10.],
  ),
)

#uc("UC3.1", "Lettura dei diagrammi dei casi d'uso",
  secondari: "Modello LLM",
  descrizione: [Il sistema ricava dai file dei diagrammi gli attori, i casi d'uso e le relazioni tra di essi.],
  pre: ([I file dei diagrammi sono in un formato supportato.],),
  post: ([Per ogni diagramma sono noti attori, casi d'uso e relazioni.],),
  scenario: (
    [Il sistema individua i file dei diagrammi nella posizione configurata.],
    [Il sistema ricava da ogni file attori, casi d'uso e relazioni.],
  ),
  nota: [Formati previsti: Mermaid o XMI (obbligatorio almeno uno); PNG e JPEG come esplorazione delle capacità di lettura degli LLM.],
)

#uc("UC3.2", "Lettura della documentazione aggiuntiva",
  secondari: "Modello LLM",
  descrizione: [Il sistema completa la descrizione di ogni caso d'uso con le informazioni della documentazione testuale.],
  pre: ([La documentazione è in formato Markdown.],),
  post: ([Ogni caso d'uso è associato alla documentazione che lo riguarda.],),
  scenario: (
    [Il sistema legge i documenti nella posizione configurata.],
    [Il sistema associa ogni parte della documentazione al caso d'uso a cui si riferisce.],
    [Il sistema integra la descrizione dei casi d'uso con le informazioni lette.],
  ),
  estensioni: ([Un caso d'uso non ha documentazione, o una parte della documentazione non corrisponde ad alcun caso d'uso: il sistema lo segnala e prosegue.],),
)

#uc("UC4", "Acquisizione dei requisiti",
  secondari: "Modello LLM",
  descrizione: [Il sistema legge le specifiche dei requisiti del progetto verificato e ne individua i singoli requisiti.],
  pre: ([Le fonti sono configurate (UC2).], [Le specifiche sono in formato Markdown.]),
  post: ([Il sistema dispone dell'elenco dei requisiti, ciascuno con identificativo (se presente) e descrizione.],),
  scenario: (
    [Lo sviluppatore avvia l'acquisizione delle specifiche dei requisiti.],
    [Il sistema legge i documenti delle specifiche.],
    [Il sistema individua i singoli requisiti.],
    [Il sistema presenta l'elenco dei requisiti acquisiti.],
  ),
  estensioni: (
    [Una fonte non è leggibile o è in un formato non supportato: UC9.],
    [Il modello di linguaggio non è disponibile: UC10.],
  ),
)

== Verifica tra casi d'uso e requisiti

#figure(
  diagramma-uc("UC5 – Verifica casi d'uso – requisiti", (
    caso("UC5.1", "Associazione dei casi d'uso ai requisiti", dx: true),
    caso("UC5.2", "Valutazione della rispondenza", dx: true),
  ), attore-dx: "Modello LLM"),
  caption: [Sottocasi di UC5],
)

#uc("UC5", "Verifica casi d'uso – requisiti",
  secondari: "Modello LLM",
  descrizione: [Lo sviluppatore verifica che tutti i casi d'uso siano riportati correttamente nelle specifiche dei requisiti.],
  pre: ([I casi d'uso sono stati acquisiti (UC3).], [I requisiti sono stati acquisiti (UC4).]),
  post: ([Per ogni caso d'uso è salvato un esito: specifiche associate e rispondenza.], [Le discrepanze sono disponibili per la dashboard (UC8).]),
  scenario: (
    [Lo sviluppatore avvia la verifica con il comando dedicato.],
    [Il sistema associa ogni caso d'uso alle specifiche che lo realizzano (UC5.1).],
    [Il sistema valuta la rispondenza di ogni associazione (UC5.2).],
    [Il sistema salva gli esiti e ne presenta una sintesi.],
  ),
  estensioni: ([Il modello di linguaggio non è disponibile: UC10.],),
)

#uc("UC5.1", "Associazione dei casi d'uso ai requisiti",
  secondari: "Modello LLM",
  descrizione: [Il sistema individua, per ogni caso d'uso, le specifiche dei requisiti che ne determinano la realizzazione.],
  pre: ([Sono disponibili l'elenco dei casi d'uso e l'elenco dei requisiti.],),
  post: ([Ogni caso d'uso è associato a zero, una o più specifiche.],),
  scenario: (
    [Il sistema confronta ogni caso d'uso con le specifiche dei requisiti.],
    [Il sistema registra le specifiche associate a ogni caso d'uso.],
  ),
  estensioni: ([Un caso d'uso non ha alcuna specifica associata: il sistema registra una discrepanza.],),
)

#uc("UC5.2", "Valutazione della rispondenza",
  secondari: "Modello LLM",
  descrizione: [Il sistema valuta se il caso d'uso, più descrittivo e visto dall'esterno, e le specifiche associate, più propositive per la realizzazione, colgono lo stesso comportamento.],
  pre: ([Le associazioni tra casi d'uso e specifiche sono disponibili (UC5.1).],),
  post: ([Ogni associazione ha un esito di rispondenza, con motivazione.],),
  scenario: (
    [Il sistema confronta il testo del caso d'uso con quello delle specifiche associate.],
    [Il sistema registra l'esito della rispondenza.],
  ),
  estensioni: (
    [Le due descrizioni non coincidono: il sistema registra una discrepanza con gli elementi coinvolti e la motivazione.],
    [Non è possibile stabilire se le due descrizioni riguardino lo stesso comportamento: il sistema registra una discrepanza «non determinabile».],
  ),
)

== Verifica tra requisiti e codice

#uc("UC6", "Analisi del codice sorgente",
  secondari: "Modello LLM",
  descrizione: [Il sistema legge il codice sorgente del progetto verificato e ne ricava una descrizione del comportamento del programma.],
  pre: ([Le fonti sono configurate (UC2).], [Il codice sorgente del progetto è disponibile.]),
  post: ([Il sistema dispone di una descrizione del comportamento del programma, riferita ai file da cui è stata ricavata.],),
  scenario: (
    [Lo sviluppatore avvia l'analisi del codice.],
    [Il sistema legge i file del codice sorgente.],
    [Il sistema ricava la descrizione del comportamento del programma.],
    [Il sistema comunica che l'analisi è terminata.],
  ),
  estensioni: (
    [Una fonte non è leggibile: UC9.],
    [Il modello di linguaggio non è disponibile: UC10.],
  ),
)

#uc("UC7", "Verifica requisiti – codice",
  secondari: "Modello LLM",
  descrizione: [Lo sviluppatore verifica che il comportamento del programma realizzi quanto richiesto dalle specifiche dei requisiti.],
  pre: ([I requisiti sono stati acquisiti (UC4).], [Il comportamento del programma è stato ricavato dal codice (UC6).]),
  post: ([Per ogni specifica è salvato un esito: implementata, non implementata o non determinabile.], [Le discrepanze sono disponibili per la dashboard (UC8).]),
  scenario: (
    [Lo sviluppatore avvia la verifica con il comando dedicato.],
    [Il sistema confronta il comportamento del programma con ogni specifica dei requisiti.],
    [Il sistema stabilisce l'esito di ogni specifica.],
    [Il sistema salva gli esiti e ne presenta una sintesi.],
  ),
  estensioni: (
    [Una specifica non risulta implementata, o l'esito non è determinabile: il sistema registra una discrepanza con gli elementi coinvolti e la motivazione.],
    [Il modello di linguaggio non è disponibile: UC10.],
  ),
)

== Dashboard

#figure(
  diagramma-uc("UC8 – Consultazione della dashboard", (
    caso("UC8.1", "Visualizzazione dello stato di avanzamento"),
    caso("UC8.2", "Visualizzazione delle discrepanze"),
  )),
  caption: [Sottocasi di UC8],
)

#uc("UC8", "Consultazione della dashboard",
  descrizione: [Lo sviluppatore consulta, nel terminale in cui opera OpenCode, lo stato della realizzazione e le discrepanze rilevate dalle verifiche.],
  pre: ([È stata eseguita almeno una verifica (UC5 o UC7).],),
  post: ([Lo sviluppatore conosce lo stato della realizzazione e le discrepanze da risolvere.],),
  scenario: (
    [Lo sviluppatore apre la dashboard con il comando dedicato.],
    [Il sistema mostra lo stato di avanzamento (UC8.1).],
    [Il sistema mostra le discrepanze rilevate (UC8.2).],
  ),
  estensioni: ([Non è disponibile alcun esito: il sistema comunica che occorre prima eseguire una verifica.],),
  nota: [La dashboard è prodotta da un plugin o da un applicativo esterno, senza l'intervento del modello di linguaggio: per questo UC8 non ha attori secondari.],
)

#uc("UC8.1", "Visualizzazione dello stato di avanzamento",
  descrizione: [Lo sviluppatore vede quanta parte della catena di tracciabilità risulta verificata.],
  pre: ([La dashboard è aperta.],),
  post: ([Lo sviluppatore conosce lo stato di casi d'uso e specifiche.],),
  scenario: (
    [Il sistema mostra quali casi d'uso sono stati rilevati nelle specifiche dei requisiti e quali no.],
    [Il sistema mostra quali specifiche dei requisiti sono state rilevate nel codice e quali no.],
    [Il sistema mostra una sintesi dello stato complessivo.],
  ),
)

#uc("UC8.2", "Visualizzazione delle discrepanze",
  descrizione: [Lo sviluppatore individua a colpo d'occhio ciò che non corrisponde tra casi d'uso, specifiche e codice.],
  pre: ([La dashboard è aperta.],),
  post: ([Lo sviluppatore conosce, per ogni discrepanza, gli elementi coinvolti e la motivazione.],),
  scenario: (
    [Il sistema elenca le discrepanze, distinguendole visivamente dagli esiti positivi.],
    [Per ogni discrepanza il sistema indica gli elementi coinvolti e la motivazione.],
  ),
)

== Condizioni di errore

#figure(
  diagramma-uc("SpecCheck", (
    caso("UC3", "Acquisizione dei casi d'uso"),
    caso("UC4", "Acquisizione dei requisiti"),
    caso("UC6", "Analisi del codice sorgente"),
    caso("UC9", "Segnalazione di fonte non leggibile", riga: 1, col: 1, sx: false),
  ), relazioni: (("UC9", "UC3"), ("UC9", "UC4"), ("UC9", "UC6")), colonne: 2),
  caption: [UC9 estende le operazioni che leggono le fonti],
)

#uc("UC9", "Segnalazione di fonte non leggibile",
  descrizione: [Il sistema informa lo sviluppatore che una fonte non può essere letta.],
  pre: ([È in corso un'acquisizione (UC3, UC4) o l'analisi del codice (UC6).], [Un file non esiste, non è leggibile o è in un formato non supportato.]),
  post: ([Lo sviluppatore sa quale file non è stato letto e perché.],),
  scenario: (
    [Il sistema segnala il file interessato e il motivo.],
    [Il sistema indica se l'operazione è proseguita sulle altre fonti o è stata interrotta.],
  ),
)

#figure(
  diagramma-uc("SpecCheck", (
    caso("UC3", "Acquisizione dei casi d'uso"),
    caso("UC4", "Acquisizione dei requisiti"),
    caso("UC5", "Verifica casi d'uso – requisiti"),
    caso("UC6", "Analisi del codice sorgente"),
    caso("UC7", "Verifica requisiti – codice"),
    caso("UC10", "Segnalazione di modello non disponibile", riga: 2, col: 1, sx: false),
  ), relazioni: (("UC10", "UC3"), ("UC10", "UC4"), ("UC10", "UC5"), ("UC10", "UC6"), ("UC10", "UC7")), colonne: 2),
  caption: [UC10 estende le operazioni che richiedono il modello di linguaggio],
)

#uc("UC10", "Segnalazione di modello non disponibile",
  descrizione: [Il sistema informa lo sviluppatore che il modello di linguaggio non ha risposto e che l'operazione non è stata completata.],
  pre: ([È in corso un'operazione che richiede il modello di linguaggio (da UC3 a UC7).], [Il modello non è raggiungibile o non risponde.]),
  post: ([Lo sviluppatore sa che l'operazione è incompleta.], [Nessun esito parziale è registrato come definitivo.]),
  scenario: (
    [Il sistema interrompe l'operazione in corso.],
    [Il sistema segnala che il modello di linguaggio non è disponibile.],
  ),
)

== Casi d'uso opzionali

#figure(
  diagramma-uc("SpecCheck – funzioni opzionali", (
    caso("UC11", "Esplorazione della dashboard grafica", opz: true),
    caso("UC12", "Verifica della copertura del codice", opz: true, dx: true),
    caso("UC13", "Acquisizione da file PDF", opz: true, dx: true),
  ), attore-dx: "Modello LLM"),
  caption: [Casi d'uso derivati dai requisiti opzionali],
)

#uc("UC11", "Esplorazione della dashboard grafica",
  descrizione: [Lo sviluppatore esamina gli esiti delle verifiche in un'interfaccia grafica, più adatta del terminale alla presentazione finale dei risultati.],
  pre: ([È stata eseguita almeno una verifica (UC5 o UC7).],),
  post: ([Lo sviluppatore ha esaminato le discrepanze fino al dettaglio che gli serve.],),
  scenario: (
    [Lo sviluppatore apre la dashboard grafica, ad esempio una pagina HTML.],
    [Il sistema presenta lo stato della realizzazione e le discrepanze.],
    [Lo sviluppatore seleziona una discrepanza e ne consulta il dettaglio.],
  ),
)

#uc("UC12", "Verifica della copertura del codice",
  secondari: "Modello LLM",
  descrizione: [Lo sviluppatore individua le parti del codice che realizzano comportamenti non previsti da alcuna specifica.],
  pre: ([I requisiti sono stati acquisiti (UC4).], [Il comportamento del programma è stato ricavato dal codice (UC6).]),
  post: ([Sono note le parti del codice non derivate da specifiche e la copertura complessiva.],),
  scenario: (
    [Lo sviluppatore avvia la verifica della copertura.],
    [Il sistema individua le parti del codice che non corrispondono ad alcuna specifica.],
    [Il sistema riporta le parti individuate e la copertura del codice da parte delle specifiche.],
  ),
  estensioni: ([Il modello di linguaggio non è disponibile: UC10.],),
)

#uc("UC13", "Acquisizione da file PDF",
  secondari: "Modello LLM",
  descrizione: [Il sistema acquisisce casi d'uso, diagrammi e specifiche dei requisiti direttamente da file PDF.],
  pre: ([Le fonti sono configurate (UC2) e comprendono file PDF.],),
  post: ([Casi d'uso e requisiti contenuti nei PDF sono disponibili come quelli acquisiti dagli altri formati.],),
  scenario: (
    [Lo sviluppatore avvia l'acquisizione.],
    [Il sistema legge dai file PDF i casi d'uso, i relativi diagrammi e le specifiche dei requisiti.],
    [Il sistema presenta l'elenco degli elementi acquisiti.],
  ),
  estensioni: (
    [Un file PDF non è leggibile: UC9.],
    [Il modello di linguaggio non è disponibile: UC10.],
  ),
)

// ============================================================
= Requisiti

== Classificazione
Ogni requisito ha un codice `R[T]-[nn]`, in cui `T` indica il tipo: *F* funzionale, *Q* di qualità, *V* di vincolo. I codici non vengono riassegnati: un requisito eliminato lascia il proprio numero inutilizzato.

#figura-tab([Classi dei requisiti])[
  #tab((left, left), (3cm, 1fr), ("Classe", "Significato"), (
    [Obbligatorio], [Irrinunciabile: discende dai requisiti minimi del capitolato, senza i quali la proponente non accetta il prodotto.],
    [Desiderabile], [Non necessario per l'accettazione, ma con un valore riconoscibile per la proponente; si realizza se l'MVP è completo.],
    [Opzionale], [Discende dai requisiti opzionali del capitolato; si affronta solo se resta tempo dopo l'MVP ed è rinegoziabile con la proponente.],
  ))
]

== Fonti
Per ogni requisito è indicata la fonte da cui discende, con le sigle della @tab-fonti. La sigla `UC[n]` rimanda al caso d'uso corrispondente.

#figura-tab([Sigle delle fonti])[
  #tab((left, left), (1.7cm, 1fr), ("Sigla", "Fonte"),
    fonti.map(((sigla, descr)) => ([*#sigla*], descr)).flatten(),
  )
] <tab-fonti>

== Requisiti funzionali
#figura-tab([Requisiti funzionali])[#tabella-requisiti(rf)] <tab-rf>

== Requisiti di qualità
#figura-tab([Requisiti di qualità])[#tabella-requisiti(rq)] <tab-rq>

La copertura dei test (RQ-01) non è quantificata dal capitolato, che parla di «adeguata copertura»: la soglia sarà fissata nel _Piano di Qualifica_ e concordata con la proponente.

== Requisiti di vincolo
#figura-tab([Requisiti di vincolo])[#tabella-requisiti(rv)] <tab-rv>

== Requisiti prestazionali
Il capitolato non indica requisiti prestazionali: tempi di risposta, dimensione massima dei progetti verificabili e costo per verifica dipendono dal modello di linguaggio in uso. Eventuali soglie saranno definite dopo il PoC, sulla base delle misure raccolte, e concordate con la proponente (@questioni).

// ============================================================
= Tracciamento

== Fonti e requisiti
Le sigle sono quelle della @tab-fonti.

#figura-tab([Tracciamento fonte – requisiti])[
  #tab((left, left), (1.7cm, 1fr), ("Sigla", "Requisiti"),
    fonti.map(((sigla, _)) => {
      let r = requisiti-di(sigla)
      ([*#sigla*], if r.len() == 0 [—] else [#r.join(", ")])
    }).flatten(),
  )
]

Ognuno dei nove punti obbligatori del capitolato (da C-O1 a C-O9) e dei tre requisiti opzionali (da C-P1 a C-P3) è coperto da almeno un requisito.

== Casi d'uso e requisiti
#figura-tab([Tracciamento caso d'uso – requisiti])[
  #tab((left, left, left), (1.7cm, 1fr, 5.2cm), ("Codice", "Caso d'uso", "Requisiti"),
    casi-uso.map(((id, nome)) => {
      let r = requisiti-di(id)
      ([*#id*], [#nome], if r.len() == 0 [—] else [#r.join(", ")])
    }).flatten(),
  )
]

UC3 non compare perché i suoi requisiti sono attribuiti ai sottocasi UC3.1 e UC3.2.

== Riepilogo
#let conta(elenco, classe) = elenco.filter(r => r.at(1) == classe).len()
#show figure.where(kind: table): set block(breakable: false)
#figura-tab([Riepilogo dei requisiti per tipo e classe])[
  #tab((left, center, center, center, center), (1fr, 2.6cm, 2.6cm, 2.6cm, 2.2cm),
    ("Tipo", "Obbligatori", "Desiderabili", "Opzionali", "Totale"),
    (
      ..(("Funzionali", rf), ("Di qualità", rq), ("Di vincolo", rv)).map(((nome, e)) => (
        [#nome], [#conta(e, "O")], [#conta(e, "D")], [#conta(e, "P")], [*#e.len()*],
      )).flatten(),
      [*Totale*], [*#conta(tutti, "O")*], [*#conta(tutti, "D")*], [*#conta(tutti, "P")*], [*#tutti.len()*],
    ),
  )
]

// ============================================================
= Questioni aperte <questioni>

I punti seguenti non trovano risposta nel capitolato e incidono sui requisiti. Saranno sottoposti a Zucchetti nel primo incontro; le risposte saranno registrate nel verbale esterno e riportate in questo documento.

#figura-tab([Questioni da sottoporre alla proponente])[
  #tab((center, left, left), (1.1cm, 1fr, 3.6cm), ("N.", "Questione", "Requisiti interessati"), (
    [Q1], [*Formato dei diagrammi.* Quale formato è atteso per l'MVP tra Mermaid e XMI? Il capitolato cita anche PlantUML e UMLet: sono formati accettabili? Va inoltre verificato come rappresentare in Mermaid un diagramma dei casi d'uso.], [RF-06, RF-07, RF-08],
    [Q2], [*Struttura dei documenti.* La documentazione dei casi d'uso e le specifiche dei requisiti seguono un modello fisso (sezioni, identificativi), oppure il sistema deve leggere testo libero?], [RF-10, RF-11, RF-13, RF-14],
    [Q3], [*Codice da verificare.* Quali linguaggi di programmazione e quali dimensioni di progetto deve gestire l'MVP?], [RF-21, RF-22],
    [Q4], [*Esiti e accettazione.* Quali esiti sono attesi per una specifica (ad esempio «parzialmente implementata»)? Con quali criteri la proponente valuterà la qualità delle verifiche (falsi positivi e negativi)?], [RF-19, RF-23],
    [Q5], [*Componente deterministica.* C'è una preferenza tra plugin e applicativo esterno, e sul linguaggio con cui realizzarli?], [RV-02, RV-03],
    [Q6], [*Configurazione e comandi.* È accettabile che lo sviluppatore indichi la posizione delle fonti e avvii le verifiche con comandi espliciti, o è attesa un'attivazione automatica tramite skill?], [RF-05, RF-25, RF-26],
    [Q7], [*Modelli.* Quali modelli saranno messi a disposizione, con quale modalità di accesso e con quale limite di costo? Il prodotto deve funzionare anche con i soli modelli piccoli?], [RQ-08],
    [Q8], [*Ambiente.* Qual è la versione di riferimento di OpenCode e su quali sistemi operativi deve funzionare l'installazione?], [RF-01, RF-02, RF-03],
    [Q9], [*Test.* Che cosa si intende per «adeguata copertura» e come vanno trattati nei test i risultati non deterministici degli LLM?], [RQ-01, RQ-02],
    [Q10], [*Prestazioni.* Ci sono attese su tempi e costi di una verifica?], [—],
    [Q11], [*Progetto di riferimento.* La proponente suggerisce un progetto pubblico su cui provare le verifiche, o ne mette a disposizione uno?], [RV-06],
    [Q12], [*Pubblicazione.* Ci sono indicazioni sulla licenza open source da adottare?], [RQ-07],
  ))
]
