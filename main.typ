#import "category.typ": *
#import "style.typ": prelude
#import "heading.typ": heading-style

#show: document => prelude(document)

// 引数から言語コードを受け取り、言語周りの諸変数を初期化
#let lang = sys.inputs.at("lang", default: "ja")
#let lang-root = if lang == "ja" {
  "japanese"
} else if lang == "en" {
  "english"
} else {
  panic("Untranslated language specified.\nAre you using a language code, like 'en', 'ja'?")
}
#let lang-root-of-out = "out/" + lang-root

// 表紙
#let metadata = yaml(lang-root + "/metadata.yaml")
#align(right, {
  v(25%)
  block(
    width: 15em,
    text(size: 2em, [*#metadata.at("title")*])
  )
  linebreak()
  text(size: 1.2em, if lang == "ja" {
    for author in metadata.at("author") {
      [*#author*]
    }
  } else {
    [by *#metadata.at("author")*]
  })
})
#pagebreak()

// 目次
#outline(title: if lang == "ja" {
  "目次"
} else {
  "Contents"
})
#pagebreak()

// 本編
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
#for ch in chapters [
  #show: document => heading-style(document)

  #include lang-root-of-out + "/" + ch + ".typ"
  #pagebreak()
]
