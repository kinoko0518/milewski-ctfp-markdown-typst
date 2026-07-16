#let prelude(body) = {
  set text(font: "Harano Aji Mincho")
  // コードブロックのスタイルを変更
  show raw.where(block: true): it => block(
    stroke: 0.005pt + luma(210),
    radius: 0.4em,
    fill: luma(240),
    inset: (left: 1.5em, right: 1.5em, top: 1.0em, bottom: 1.0em),
    above: 1.2em,
    below: 1.2em,
    it.lines.join(linebreak())
  )
  // 行間隔を設定
  set par(
    leading: 1em,
    spacing: 2em,
  )
  set page(numbering: "1", paper: "a5", margin: (
    inside: 1.5cm,
    outside: 2cm,
    top: 1.5cm,
    bottom: 1.5cm
  ))
  set text(size: 0.8em)

  body
}
