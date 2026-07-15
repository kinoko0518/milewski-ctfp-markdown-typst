#import "category.typ": *
#import "style.typ": prelude

#show: document => prelude(document)

#let chapters = (
  "preface-for-japanese",
  "preface",
  "part1/ch01",
  "part1/ch02",
  "part1/ch03",
  "part1/ch04",
  "part1/ch05",
  "part1/ch06",
  "part1/ch07",
  "part1/ch08",
  "part1/ch09",
  "part1/ch10",
  "part2/ch01",
  "part2/ch02",
  "part2/ch03",
  "part2/ch04",
  "part2/ch05",
  "part2/ch06",
  "part3/ch01",
  "part3/ch02",
  "part3/ch03",
  "part3/ch04",
  "part3/ch05",
  "part3/ch06",
  "part3/ch07",
  "part3/ch08",
  "part3/ch09",
  "part3/ch10",
  "part3/ch11",
  "part3/ch12",
  "part3/ch13",
  "part3/ch14",
  "part3/ch15",
  "index_html",
  "acknowledgments",
  "license",
)
#let lang = sys.inputs.at("lang", default: "ja")
#let lang-root = if lang == "ja" {
  "out/japanese"
} else if lang == "en" {
  "out/english"
} else {
  panic("Untranslated language specified.\nAre you using a language code, like 'en', 'ja'?")
}

#set text(font: "Harano Aji Mincho")
#show raw.where(block: true): set block(
  radius: 0.5em,
  fill: luma(230),
  inset: (left: 1.5em, right: 1.5em, top: 1.0em, bottom: 1.0em),
  above: 1.2em,
  below: 1.2em,
)

#for ch in chapters [
  #include lang-root + "/" + ch + ".typ"
  #pagebreak()
]
