// ============================================================
//  Template verbale "classico" Hex4dev
//  Serif, bianco e nero, titolo centrato, indice in prima pagina.
// ============================================================

#let verbale(
  titolo: "Verbale",
  gruppo: "Hex4dev",
  data: datetime.today().display("[day]/[month]/[year]"),
  oggetto: "",
  body,
) = {
  set document(title: titolo, author: gruppo)
  set text(lang: "it", size: 15pt)   // font predefinito di Typst (serif)
  set par(justify: true, leading: 0.65em, spacing: 1.1em)
  set page(
    paper: "a4",
    margin: (x: 2.6cm, y: 2.6cm),
    footer: context align(center, counter(page).display("1")),
  )

  // Sezioni senza numero, con pallino davanti al titolo
  set heading(numbering: none)
  show heading.where(level: 1): it => block(above: 2em, below: 1em, breakable: false)[
    #text(size: 19pt, weight: "bold")[• #it.body]
  ]
  show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em, breakable: false)[
    #text(size: 15pt, weight: "bold")[#it.body]
  ]
  set list(marker: [•], body-indent: 0.6em, spacing: 0.7em)
  set enum(spacing: 0.7em)

  // ---- Titolo ----
  v(1cm)
  align(center, text(size: 23pt, weight: "bold")[#titolo])
  v(1.2cm)

  // ---- Dati essenziali (rientrati) ----
  pad(left: 2.5cm, {
    set par(justify: false)
    stack(
      spacing: 1em,
      [*Gruppo:* #gruppo],
      [*Data:* #data],
      [*Oggetto:* #oggetto],
    )
  })
  v(1.2cm)

  // ---- Indice (solo sezioni principali) ----
  block(above: 0em, below: 0.8em, text(size: 19pt, weight: "bold")[Indice])
  // L'indice usa lo stesso stile dei titoli, ma senza pallino
  outline(title: none, depth: 1)

  pagebreak()
  body
}
