// ============================================================
//  Template verbali esterni hex4dev (riunioni con aziende)
//  Formato A4, dipendente da diario-di-bordo.typ per la palette.
//
//  Uso (dalla root del repository):
//
//    #import "/templates/verbale-esterno.typ": *
//
//    #show: verbale-esterno.with(
//      numero: "VE-2026-10-28",
//      azienda: "Nome Azienda",
//      data: "28/10/2026",
//      ora-inizio: "14:04",
//      ora-fine: "14:46",
//      luogo: "Online (Zoom)",
//      oggetto: "Incontro esplorativo"
//      verbalizzante: "Nome Cognome",
//      presenti-interni: ("Nome Cognome",),
//      assenti-interni: ("Nome Cognome",),
//      presenti-esterni: ("Nome Cognome",),
//    )
//
//    = Ordine del giorno
//    + Primo punto
//
//    = Resoconto della discussione
//    == Primo punto
//    Testo della discussione.
//
//    = Decisioni
//    #decisioni(
//      [Decisione presa...],
//    )
//
//    = Attività da svolgere
//    #azioni(
//      ([Descrizione], [Responsabile], [dd/mm/yyyy]),
//    )
//
//  Compilazione:
//    typst compile --root . verbali/.../verbale-esterno.typ
// ============================================================

// Importazione della palette e degli elementi grafici esclusivamente da diario-di-bordo.typ[cite: 3]
#import "/templates/diario-di-bordo.typ": (
  colore-primario, colore-scuro, colore-accento, colore-testo, colore-sfondo, barretta,
)

// --- Stato interno ------------------------------------------
#let _numero-verbale = state("hex4dev-numero-verbale-esterno", none)
#let _contatore-decisioni = counter("hex4dev-decisioni-esterni")
#let _contatore-azioni = counter("hex4dev-azioni-esterni")

// Tabella con intestazione colorata (stile comune a decisioni e azioni)
#let _tabella(colonne, intestazione, righe) = {
  set text(size: 10pt, hyphenate: false)
  set par(justify: false)
  table(
    columns: colonne,
    stroke: 0.5pt + colore-primario.lighten(55%),
    inset: (x: 7pt, y: 6pt),
    fill: (_, y) => if y == 0 { colore-primario } else if calc.even(y) { colore-sfondo } else { white },
    table.header(..intestazione.map(t => text(fill: white, weight: "bold")[#t])),
    ..righe,
  )
}

// --- Elementi riusabili -------------------------------------

// Elenco delle decisioni, con identificativi progressivi (es. VE-2026-10-28-D1)
#let decisioni(..voci) = {
  let voci = voci.pos()
  context {
    let numero = _numero-verbale.get()
    let prefisso = if numero == none { "D" } else { numero + "-D" }
    let inizio = _contatore-decisioni.get().first()
    _tabella(
      (auto, 1fr),
      ("ID", "Decisione"),
      voci.enumerate().map(((i, v)) => ([#prefisso#(inizio + i + 1)], v)).flatten(),
    )
  }
  _contatore-decisioni.update(n => n + voci.len())
}

// Attività da svolgere (attività, responsabile, scadenza)
#let azioni(..righe) = {
  let righe = righe.pos()
  context {
    let numero = _numero-verbale.get()
    let prefisso = if numero == none { "A" } else { numero + "-A" }
    let inizio = _contatore-azioni.get().first()
    _tabella(
      (auto, 1fr, 3.4cm, 2.6cm),
      ("ID", "Attività", "Responsabile", "Scadenza"),
      righe.enumerate().map(((i, r)) => ([#prefisso#(inizio + i + 1)], ..r)).flatten(),
    )
  }
  _contatore-azioni.update(n => n + righe.len())
}

// --- Template principale ------------------------------------
#let verbale-esterno(
  titolo: "Verbale della riunione esterna",
  gruppo: "Hex4dev",
  numero: none, // identificativo del verbale, es. "VE-2026-10-28"
  azienda: none, // nome dell'azienda o ente esterno
  data: datetime.today().display("[day]/[month]/[year]"),
  ora-inizio: none,
  ora-fine: none,
  luogo: "Online",
  oggetto: none,
  verbalizzante: none,
  presenti-interni: (),
  assenti-interni: (),
  presenti-esterni: (),
  logo: "/assets/hex4dev_logo.png",
  body,
) = {
  set document(title: titolo, author: gruppo)
  set text(lang: "it", size: 11pt, fill: colore-testo,
           font: ("Inter", "Noto Sans", "Liberation Sans", "DejaVu Sans"))
  set par(justify: true, leading: 0.65em)

  _numero-verbale.update(numero)

  set page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3.2cm, bottom: 2.5cm),
    header: {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (auto, 1fr),
        align: horizon,
        image(logo, height: 1cm),
        align(right)[
          #gruppo · Verbale esterno
          #if numero != none [ · #numero]
          #if azienda != none [ · #azienda]
        ],
      )
      v(-0.2em)
      line(length: 100%, stroke: 1pt + colore-primario)
    },
    header-ascent: 30%,
    footer: context {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (1fr, auto),
        [#data],
        [Pagina #counter(page).display() di #counter(page).final().first()],
      )
    },
  )

  // Titoli: numerati
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => block(above: 1.6em, below: 0.9em, breakable: false)[
    #text(size: 15pt, weight: "bold", fill: colore-scuro)[#it]
    #v(-0.5em)
    #barretta(w: 1.6cm)
  ]
  show heading.where(level: 2): it => block(above: 1.2em, below: 0.6em,
    text(size: 12pt, weight: "semibold", fill: colore-primario)[#it])

  // Elenchi
  set list(marker: text(fill: colore-primario)[•], body-indent: 0.6em, spacing: 0.7em)
  set enum(numbering: n => text(fill: colore-primario, weight: "bold")[#n.], body-indent: 0.6em, spacing: 0.7em)

  show link: set text(fill: colore-primario)
  show strong: set text(fill: colore-scuro)

  // ---- Titolo e riquadro informazioni ----
  text(size: 24pt, weight: "bold", fill: colore-scuro)[#titolo]
  v(-0.3em)
  barretta(w: 3cm)
  v(1em)

  let riga(etichetta, valore) = (
    text(weight: "semibold", fill: colore-scuro)[#etichetta],
    valore,
  )
  let elenco(persone) = if persone.len() == 0 [—] else { persone.join(", ") }
  let orario = if ora-inizio != none and ora-fine != none [#ora-inizio – #ora-fine]
    else if ora-inizio != none [dalle #ora-inizio]

  let righe = (
    ..riga("Data", data),
    ..if orario != none { riga("Orario", orario) } else { () },
    ..riga("Luogo", luogo),
    ..if oggetto != none { riga("Oggetto", oggetto) }
     else { () },
    ..if azienda != none { riga("Azienda", azienda) } else { () },
    ..if verbalizzante != none { riga("Verbalizzante", verbalizzante) } else { () },
    ..riga("Presenti interni", elenco(presenti-interni)),
    ..riga("Assenti interni", elenco(assenti-interni)),
    ..riga("Presenti esterni", elenco(presenti-esterni)),
  )

  block(width: 100%, fill: colore-sfondo, inset: 14pt, radius: 4pt,
        stroke: (left: 3pt + colore-accento))[
    #set par(justify: false)
    #grid(columns: (3.2cm, 1fr), row-gutter: 0.7em, ..righe)
  ]

  body
}