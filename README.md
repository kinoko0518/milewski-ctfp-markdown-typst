# milewski-ctfp-markdown-typst

このリポジトリは、バルトシュ・ミレフスキー著『プログラマーのための圏論』の非公式Markdown版をフォークし、TeXに依存する部分をTypstに置き換えたものです（[原著者の公開許可済み](https://github.com/ktgw0316/milewski-ctfp-markdown/issues/2#issuecomment-1494275529)の日本語訳を含みます）。

This repository is a fork of the *unofficial* Markdown version of "**C**ategory **T**heory **F**or **P**rogrammers" by [Bartosz Milewski][bartosz github], with TeX-dependent parts replaced by Typst. It is based on:

* Original [blogpost series][blogpost series]
* [PDF/LaTeX version][ctfp-pdf] by Igal Tabachnik
* [epub version][onlurking] by Diogo Felix (base.css)
* [pandoc-toc-sidebar](https://github.com/Mushiyo/pandoc-toc-sidebar) by Mushiyo (pandoc html template)

## How to build

1. Install [pandoc](https://pandoc.org/installing.html) and [Typst](https://github.com/typst/typst).
1. Convert Markdown to Typst:
    ```bash
    $ ./convert.sh
    ```
1. Compile to PDF or HTML:
    - For Japanese PDF:
      ```bash
      $ typst compile main.typ --input lang=ja
      ```
    - For English PDF:
      ```bash
      $ typst compile main.typ --input lang=en
      ```
    - For HTML generation, just add the `--format=html` option to your command. (Note: You may additionally need the `--features html` flag.)

[bartosz github]: https://github.com/BartoszMilewski
[blogpost series]:
  https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
[ctfp-pdf]: https://github.com/hmemcpy/milewski-ctfp-pdf/
[onlurking]: https://github.com/onlurking/category-theory-for-programmers

## 日本語訳について

html版は[github pages](https://ktgw0316.github.io/milewski-ctfp-markdown/)としても公開しています。

* 監訳：松田 一孝
* 翻訳：北川 雅裕

2026年5月26日発売の[書籍版](https://www.ohmsha.co.jp/book/9784274234866/)（オーム社）
および[PDF版](https://tatsu-zine.com/books/category-theory-for-programmers)（達人出版会）とは内容が一部異なる箇所があります。
