// ============================================================
//  Template presentazioni hex4dev (diario di bordo, SAL, ...)
//  Formato 16:9, palette ricavata dal logo del gruppo.
// ============================================================

// --- Palette -------------------------------------------------
#let colore-primario = rgb("#554AB6") // viola bordo esagono
#let colore-scuro    = rgb("#3D3489") // viola interno
#let colore-accento  = rgb("#5FCBAA") // verde dei vertici
#let colore-testo    = rgb("#1E1B3A")
#let colore-sfondo   = rgb("#F5F4FC") // lilla chiarissimo (opzionale)

// --- Elementi riusabili -------------------------------------
// Barretta verde sotto i titoli
#let barretta(w: 2.5cm) = rect(width: w, height: 5pt, fill: colore-accento, radius: 2.5pt)

// Voce di checklist: stesso pallino degli elenchi puntati
// (il parametro stato è mantenuto per compatibilità, ma non cambia l'aspetto)
#let voce(stato, body) = {
  grid(columns: (1.1em, 1fr), column-gutter: 0.2em, align: top, text(fill: colore-primario)[•], body)
}

// Checklist a partire da una lista di stringhe/contenuti
#let checklist(stato: "fatto", ..voci) = {
  for it in voci.pos() { voce(stato, it); v(0.35em) }
}

// Slide finale con contatti
#let slide-finale(email: none, repo: none, messaggio: "Grazie per l’attenzione!") = {
  pagebreak(weak: true)
  align(center + horizon)[
    #text(size: 40pt, weight: "bold", fill: colore-scuro)[#messaggio]
    #v(0.2em) #barretta(w: 4cm)
    #v(1em)
    #if email != none [#text(size: 20pt)[#email] \ ]
    #if repo != none [#v(0.4em) #text(size: 18pt, fill: colore-primario)[#link(repo)[Visita il nostro repository]]]
  ]
}

// --- Template principale ------------------------------------
#let diario(
  titolo: "Diario di Bordo",
  gruppo: "Hex4dev",
  data: datetime.today().display("[day]-[month]-[year]"),
  logo: "/assets/hex4dev_logo.png",
  body,
) = {
  set document(title: titolo, author: gruppo)
  set text(lang: "it", size: 20pt, fill: colore-testo,
           font: ("Inter", "Noto Sans", "Liberation Sans", "DejaVu Sans"))
  set par(leading: 0.7em, justify: false)

  // ---- Copertina ----
  page(
    paper: "presentation-16-9",
    margin: (x: 2.2cm, top: 2.2cm, bottom: 1.8cm),
    header: none,
    footer: none,
    background: place(top + left, stack(
      rect(width: 100%, height: 0.9cm, fill: colore-primario),
      rect(width: 100%, height: 0.2cm, fill: colore-accento),
    )),
  )[
    #v(1fr)
    #grid(
      columns: (1.15fr, 0.85fr),
      align: horizon,
      column-gutter: 1cm,
      [
        #text(size: 44pt, weight: "bold", fill: colore-scuro)[#titolo]
        #v(0.3em) #barretta(w: 4cm)
        #v(1.2em)
        #text(size: 36pt, weight: "bold")[#gruppo] \
        #v(0.2em)
        #text(size: 28pt, fill: colore-primario)[#data]
      ],
      align(center + horizon, image(logo, height: 9cm)),
    )
    #v(1fr)
  ]

  // ---- Pagine interne ----
  set page(
    paper: "presentation-16-9",
    margin: (x: 2.2cm, top: 3cm, bottom: 2.2cm),
    header: {
      set text(size: 12pt, fill: colore-scuro)
      align(right)[#titolo]
      v(-0.2em)
      line(length: 100%, stroke: 1.5pt + colore-primario)
    },
    header-ascent: 25%,
    footer: context {
      set text(size: 12pt, fill: colore-scuro)
      grid(
        columns: (1fr, auto),
        [],
        counter(page).display("1 / 1", both: true),
      )
    },
  )

  // Elenchi: semplici pallini
  set list(
    marker: text(fill: colore-primario)[•],
    body-indent: 0.7em,
    spacing: 0.9em,
  )
  set enum(numbering: n => text(fill: colore-primario, weight: "bold")[#n.], spacing: 0.9em)

  // Ogni "= Titolo" apre una nuova slide
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(below: 1.2em)[
      #text(size: 32pt, weight: "bold", fill: colore-scuro)[#it.body]
      #v(-0.2em)
      #barretta()
    ]
  }
  show heading.where(level: 2): it => block(above: 1em, below: 0.6em,
    text(size: 24pt, weight: "semibold", fill: colore-primario)[#it.body])

  show link: set text(fill: colore-primario)
  show strong: set text(fill: colore-scuro)

  body
}
