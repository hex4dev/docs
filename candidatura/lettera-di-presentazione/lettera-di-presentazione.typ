// ============================================================
//  Lettera di Presentazione - candidatura del gruppo hex4dev
//
//  Compilazione dalla root del repository:
//    typst compile --root . candidatura/lettera-di-presentazione/lettera-di-presentazione.typ
//
//  Ripartizione della scrittura (riunione del 26/10/2026):
//	  - scheletro: Matteo Angelini
//    - rimanente: TBD
// ============================================================

#import "/templates/documento.typ": documento, tabella, todo

//Nasconde il titolo "Indice" generato dal template
#show heading: it => {
  if it.body == [Indice] {
    // Non restituisce nulla, saltando l'intestazione
  } else {
    it
  }
}
//Rimuove completamente l'indice generato da outline
#show outline: _ => none

#show: documento.with(
  titolo: "Lettera di Presentazione",
  sottotitolo: "Candidatura · Anno accademico 2026/2027",
  numero-gruppo: "14",
  versione: "2.0",
  data: "2026/11/09",
  redattori: ("Matteo Angelini", "Francesco Bassani", "Matilde Pedrocchi"),
  verificatori: ("Matteo Angelini", "Alessandro Zanier"),
  registro: (
    ("2.0", "2026/11/09", "Matilde Pedrocchi", "Alessandro Zanier", "Riscrittura per il capitolato C9"),
    ("1.0", "2026/11/07", "Matilde Pedrocchi", "Matteo Angelini", "Riscrittura per il capitolato C7, date modificate per essere nel formato anno/mese/giorno, link aggiornati e resi esteticamente più gradevoli, aggiunti destinatari, tolto indice vuoto"),
    ("0.2", "2026/10/29", "Francesco Bassani", "—", "Completamento lettera "),
    ("0.1", "2026/10/28", "Matteo Angelini", "—", "Creazione dello scheletro del documento"),
	
  ),
)

#heading(level: 1, numbering: none)[Candidatura]

Al Prof. Tullio Vardanega e al Prof. Riccardo Cardin \
Dipartimento di Matematica “Tullio Levi-Civita”, Università degli Studi di Padova

Con la presente, il gruppo Hex4dev intende comunicarVi la volontà di
candidarsi e impegnarsi nello sviluppo e realizzazione del capitolato
denominato:

*C9 - SpecCheck: Sviluppo di Skills per OpenCode per la verifica della tracciabilità end to-end da casi d'uso a requisiti e codice sorgente*

proposto dall'azienda Zucchetti SPA. 

La repository della documentazione relativa alla candidatura è disponibile ai seguenti link:
- #link("https://github.com/hex4dev/docs/")[Repository del gruppo]
- #link("https://hex4dev.github.io/docs/")[Vista web] della repository

I documenti forniti sono:
- #link("https://hex4dev.github.io/docs/pdf/candidatura/valutazione-capitolati/valutazione-capitolati.pdf")[Valutazione capitolati]
- #link("https://hex4dev.github.io/docs/pdf/candidatura/dichiarazione-impegni/dichiarazione-impegni.pdf")[Dichiarazione degli impegni]
- Verbali degli incontri esterni con le aziende:
	- #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/esterni/2026-10-28/verbale-esterno.pdf")[2026/10/28]
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/esterni/2026-10-21/verbale-esterno.pdf")[2026/10/21]
- Verbali degli incontri interni:
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-11-09/verbale-interno.pdf")[2026/11/09]
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-11-06/verbale-interno.pdf")[2026/11/06]
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-11-03/verbale-interno.pdf")[2026/11/03] 
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-11-02/verbale-interno.pdf")[2026/11/02]
 - #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-10-29/verbale-interno.pdf")[2026/10/29]
	- #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-10-28/verbale-interno.pdf")[2026/10/28]
	- #link("https://hex4dev.github.io/docs/pdf/candidatura/verbali/interni/2026-10-26/verbale-interno.pdf")[2026/10/26]

All’interno del documento dedicato, è preventivato il costo stimato alla realizzazione del prodotto, valore individuato a 11.040,00 €, con data di consegna prevista entro il 2027/04/02. 

Cordiali Saluti,\
Hex4dev - Gruppo 14