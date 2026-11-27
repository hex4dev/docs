// ============================================================
//  Diagrammi di Gantt hex4dev
//  Usa la palette di documento.typ, quindi segue i cambi di colore
//  del template senza altre modifiche.
//
//  Uso (in qualunque documento che importa documento.typ):
//
//    #import "/templates/gantt.typ": gantt
//
//    #gantt(
//      "2026-11-11",            // primo giorno del diagramma
//      "2026-11-22",            // ultimo giorno del diagramma
//      (
//        (nome: "Studio del capitolato", inizio: "2026-11-11", fine: "2026-11-18",
//         chi: "F. Bassani"),
//        (nome: "Bozza Norme di Progetto", inizio: "2026-11-14", fine: "2026-11-22"),
//        (nome: "Fine sprint", data: "2026-11-22", milestone: true),
//      ),
//      didascalia: [Diagramma di Gantt dello sprint S1],
//    )
//
//  Ogni attività è un dizionario con:
//    nome        testo dell'attività (obbligatorio)
//    inizio,fine date AAAA-MM-GG, estremi inclusi (attività normale)
//    data        data AAAA-MM-GG (solo per una milestone)
//    milestone   true per disegnare un rombo invece di una barra
//    chi         chi la svolge (facoltativo: se almeno una attività lo ha,
//                compare la colonna «Assegnatario/i»)
//    colore      colore della barra (facoltativo, default: colore primario)
//
//  Parametri facoltativi della funzione:
//    didascalia  se presente, il diagramma diventa una figura numerata
//    modo        "giorni" o "settimane" (default: giorni fino a 21 giorni,
//                settimane oltre; con le settimane ogni colonna parte dal lunedì)
//    larghezza-etichetta, larghezza-chi   larghezze delle colonne di testo
//
//  Le date fuori dall'intervallo o con fine prima dell'inizio fermano la
//  compilazione con un messaggio che indica l'attività da correggere.
// ============================================================
#import "/templates/documento.typ": colore-primario, colore-accento, colore-sfondo

#let _data(s) = {
  let p = s.split("-")
  assert(p.len() == 3, message: "Data non valida: " + s + " (formato AAAA-MM-GG)")
  datetime(year: int(p.at(0)), month: int(p.at(1)), day: int(p.at(2)))
}

#let _lettere = ("L", "M", "M", "G", "V", "S", "D")

#let gantt(
  inizio,
  fine,
  attivita,
  didascalia: none,
  modo: auto,
  larghezza-etichetta: 5cm,
  larghezza-chi: 3.2cm, // Aumentato leggermente da 2.6cm a 3.2cm per contenere la nuova etichetta
) = {
  let d0 = _data(inizio)
  let d1 = _data(fine)
  let giorni = int((d1 - d0).days()) + 1
  assert(giorni > 0, message: "Gantt: la data di fine precede quella di inizio")

  let settimane = if modo == auto { giorni > 21 } else { modo == "settimane" }
  let unita = if settimane { 7 } else { 1 }
  let off = if settimane { d0.weekday() - 1 } else { 0 }
  let n = calc.ceil((giorni + off) / unita)
  let ha-chi = attivita.any(a => "chi" in a)
  let n-et = if ha-chi { 2 } else { 1 }
  let bordo = colore-primario.lighten(55%)

  let corpo = layout(size => {
    set text(size: 10pt, hyphenate: false)
    set par(justify: false)

    let w-fisso = larghezza-etichetta + if ha-chi { larghezza-chi } else { 0pt }
    let w-unit = (size.width - w-fisso) / n

    // intestazione: un giorno o una settimana per colonna (modificato "Chi" in "Assegnatario/i")
    let intest = (
      text(fill: white, weight: "bold")[Attività],
      ..if ha-chi { (text(fill: white, weight: "bold")[Assegnatario/i],) } else { () },
      ..range(n).map(k => {
        let d = d0 + duration(days: k * unita - off)
        let t = if settimane {
          d.display("[day]/[month]")
        } else {
          [#d.day() \ #_lettere.at(d.weekday() - 1)]
        }
        align(center, text(size: 7.5pt, fill: white, weight: "bold", t))
      }),
    )

    // righe: etichetta, chi, una cella per unità di tempo
    let righe = ()
    for a in attivita {
      let milestone = a.at("milestone", default: false)
      let colore = a.at("colore", default: if milestone { colore-accento } else { colore-primario })
      let da = if milestone { a.data } else { a.inizio }
      let fino = if milestone { a.data } else { a.fine }
      let a0 = int((_data(da) - d0).days())
      let a1 = int((_data(fino) - d0).days())
      assert(
        a0 >= 0 and a1 < giorni and a1 >= a0,
        message: "Gantt: l'attività «" + a.nome + "» ha date fuori dall'intervallo " + inizio + " – " + fine + " o incoerenti",
      )
      let k0 = calc.quo(a0 + off, unita)
      righe.push(text(size: 9pt)[#a.nome])
      if ha-chi { righe.push(text(size: 8pt)[#a.at("chi", default: "")]) }
      for k in range(n) {
        if k == k0 {
          let u0 = k * unita - off
          righe.push(box(width: w-unit, height: 0.45cm, {
            if milestone {
              let r = 0.17cm
              place(left + horizon, dx: (a0 - u0 + 0.5) / unita * w-unit - r,
                polygon(fill: colore, (r, 0pt), (2 * r, r), (r, 2 * r), (0pt, r)))
            } else {
              place(left + horizon, dx: (a0 - u0) / unita * w-unit,
                rect(width: (a1 - a0 + 1) / unita * w-unit, height: 0.34cm, fill: colore, radius: 2pt))
            }
          }))
        } else {
          righe.push([])
        }
      }
    }

    table(
      columns: (larghezza-etichetta,) + (if ha-chi { (larghezza-chi,) } else { () }) + range(n).map(_ => w-unit),
      align: (x, _) => if x < n-et { left + horizon } else { center + horizon },
      inset: (x, _) => if x < n-et { (x: 6pt, y: 5pt) } else { (x: 0pt, y: 5pt) },
      stroke: 0.5pt + bordo,
      fill: (x, y) => {
        if y == 0 { colore-primario }
        else if x < n-et { if calc.even(y) { colore-sfondo } else { white } }
        else if not settimane and (d0 + duration(days: x - n-et)).weekday() >= 6 { colore-sfondo.darken(6%) }
        else { white }
      },
      table.header(..intest),
      ..righe,
    )
  })

  if didascalia == none {
    corpo
  } else {
    figure(corpo, kind: image, supplement: [Figura], caption: didascalia)
  }
}