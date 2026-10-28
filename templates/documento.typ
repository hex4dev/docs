// ============================================================
//  Template documenti A4 hex4dev
//  Copertina, metadati, registro modifiche, indice e stili comuni.
//
//  Uso:
//    #import "/templates/documento.typ": documento, tabella, todo
//    #show: documento.with(titolo: "Titolo del documento")
//
//    = Introduzione
//    Testo del documento.
//
//  Compilare dalla root del repository con:
//    typst compile --root . percorso/documento.typ
//
//  registro: tuple (versione, data, autore, verificatore, descrizione).
//  tabella: colonne, intestazioni e celle delle righe in una tupla piatta.
//  Ogni capitolo di primo livello inizia su una nuova pagina.
// ============================================================

// --- Palette (la stessa del logo e degli altri documenti hex4dev) ---
#let colore-primario = rgb("#554AB6") // viola bordo esagono
#let colore-scuro    = rgb("#3D3489") // viola interno
#let colore-accento  = rgb("#5FCBAA") // verde dei vertici
#let colore-testo    = rgb("#1E1B3A")
#let colore-sfondo   = rgb("#F5F4FC") // lilla chiarissimo

// Barretta verde sotto i titoli
#let barretta(w: 2.5cm) = rect(width: w, height: 5pt, fill: colore-accento, radius: 2.5pt)

// Segnaposto evidenziato per le parti da completare
#let todo(body) = highlight(fill: rgb("#FFF0A0"), extent: 1.5pt, body)

// Tabella con intestazione colorata e righe alternate
#let tabella(colonne, intestazione, righe) = {
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

#let documento(
  titolo: "Documento",
  sottotitolo: none,
  gruppo: "Hex4dev",
  numero-gruppo: none,
  versione: "0.1",
  data: datetime.today().display("[day]/[month]/[year]"),
  uso: "Esterno",
  redattori: (),
  verificatori: (),
  registro: (),
  logo: "/assets/hex4dev_logo.png",
  body,
) = {
  set document(title: titolo, author: gruppo)
  set text(lang: "it", size: 11pt, fill: colore-testo,
           font: ("Inter", "Noto Sans", "Liberation Sans", "DejaVu Sans"))
  set par(justify: true, leading: 0.65em)

  let elenco(persone) = if persone.len() == 0 [da definire] else { persone.join(", ") }

  // ---- Copertina ----
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3cm, bottom: 2.5cm),
    header: none,
    footer: none,
    background: place(top + left, stack(
      rect(width: 100%, height: 0.9cm, fill: colore-primario),
      rect(width: 100%, height: 0.2cm, fill: colore-accento),
    )),
  )[
    #set par(justify: false)
    #v(1fr)
    #align(center, image(logo, height: 6cm))
    #v(1.5cm)
    #align(center)[
      #text(size: 30pt, weight: "bold", fill: colore-scuro)[#titolo]
      #v(-0.2em)
      #barretta(w: 4cm)
      #if sottotitolo != none [
        #v(1em)
        #text(size: 14pt, fill: colore-primario)[#sottotitolo]
      ]
      #v(0.8em)
      #text(size: 16pt, weight: "semibold")[
        #gruppo#if numero-gruppo != none [ · Gruppo #numero-gruppo]
      ]
    ]
    #v(1fr)
    #block(width: 100%, fill: colore-sfondo, inset: 14pt, radius: 4pt,
           stroke: (left: 3pt + colore-accento))[
      #grid(
        columns: (3cm, 1fr),
        row-gutter: 0.7em,
        text(weight: "semibold", fill: colore-scuro)[Versione], [#versione],
        text(weight: "semibold", fill: colore-scuro)[Data], [#data],
        text(weight: "semibold", fill: colore-scuro)[Uso], [#uso],
        text(weight: "semibold", fill: colore-scuro)[Redattori], elenco(redattori),
        text(weight: "semibold", fill: colore-scuro)[Verificatori], elenco(verificatori),
      )
    ]
  ]

  // ---- Pagine interne ----
  set page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3.2cm, bottom: 2.5cm),
    header: {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (auto, 1fr),
        align: horizon,
        image(logo, height: 1cm),
        align(right)[#gruppo · #titolo],
      )
      v(-0.2em)
      line(length: 100%, stroke: 1pt + colore-primario)
    },
    header-ascent: 30%,
    footer: context {
      set text(size: 9pt, fill: colore-scuro)
      grid(
        columns: (1fr, auto),
        [Versione #versione · #data],
        [Pagina #counter(page).display() di #counter(page).final().first()],
      )
    },
  )

  // Titoli: numerati, i capitoli iniziano su una nuova pagina
  set heading(numbering: "1.1.1")
  show heading.where(level: 1): it => {
    // Registro e indice (non in elenco) stanno insieme nella stessa pagina
    if it.outlined { pagebreak(weak: true) }
    block(above: 0pt, below: 1em, breakable: false)[
      #text(size: 20pt, weight: "bold", fill: colore-scuro)[#it]
      #v(-0.5em)
      #barretta(w: 2cm)
    ]
  }
  show heading.where(level: 2): it => block(above: 1.6em, below: 0.7em, breakable: false,
    text(size: 14pt, weight: "bold", fill: colore-primario)[#it])
  show heading.where(level: 3): it => block(above: 1.2em, below: 0.5em, breakable: false,
    text(size: 11.5pt, weight: "semibold", fill: colore-scuro)[#it])

  // Elenchi
  set list(marker: text(fill: colore-primario)[•], body-indent: 0.6em, spacing: 0.7em)
  set enum(numbering: n => text(fill: colore-primario, weight: "bold")[#n.], body-indent: 0.6em, spacing: 0.7em)

  show link: set text(fill: colore-primario)
  show strong: set text(fill: colore-scuro)

  // ---- Registro delle modifiche ----
  heading(numbering: none, outlined: false)[Registro delle modifiche]
  if registro.len() > 0 {
    tabella(
      (2.2cm, 2.4cm, 3cm, 3cm, 1fr),
      ("Versione", "Data", "Autore", "Verificatore", "Descrizione"),
      registro.flatten(),
    )
  }

  // ---- Indice ----
  v(1.2cm)
  heading(numbering: none, outlined: false)[Indice]
  {
    set par(justify: false)
    show outline.entry.where(level: 1): it => {
      v(0.4em)
      strong(it)
    }
    outline(title: none, depth: 2, indent: 1.2em)
  }

  body
}

