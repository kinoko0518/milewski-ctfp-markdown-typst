#import "category.typ": *

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

#for ch in chapters [
  #include lang-root + "/" + ch + ".typ"
  #pagebreak()
]
