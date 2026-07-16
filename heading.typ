#let theme-color = rgb("#aeaece")

#let heading-style(body) = {
  set heading(numbering: "1.1")
  show heading: it => {
    if it.numbering == none {
      return it
    }
    let num = counter(heading).display(it.numbering)

    if it.level == 1 {
      block(inset: (bottom: 2em))[
        #v(15%)
        #block(inset: (left: 1em, right: 1em))[
          #text(size: 70pt, fill: theme-color)[#num]
        ]
        #linebreak()
        #text(size: 1.1em, fill: black)[#it.body]
      ]
    } else {
      block(inset: (top: 0.7em, bottom: 0.5em))[
        #text(fill: theme-color)[#num]
        #h(8pt)
        #text(fill: black)[#it.body]
      ]
    }
  }
  body
}
