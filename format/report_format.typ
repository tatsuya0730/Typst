// 空の段落を設定
#let empty_par() = {
  v(-1em)
  box()
}

// 論文の構築
#let master_thesis(
  // 修士論文のタイトル
  title: "ここにtitleが入る",
  // 論文の著者
  author: "ここに著者が入る",
  // 参加者
  participants: "",
  // OSの選択: "windows" / "mac"
  os: "windows",
  // 著者の情報
  university: "",
  school: "",
  department: "",
  id: "",
  mentor: "",
  mentor-post: "",
  mentor2: "",
  mentor-post2: "",
  class: "修士",
  date: (datetime.today().year(), datetime.today().month(), datetime.today().day()),
  subtitle: "",
  number: "",
  // アブストラクト
  abstract_ja: [],
  abstract_en: [],
  keywords_ja: (),
  keywords_en: (),
  // 使用する紙のサイズ
  paper-size: "a4",
  // 外部の文献を引用する場合、文献ファイルのパス
  bibliography-file: none,
  // 論文の本文
  body,
  // 謝辞
  acknowledgments: none,
) = {

  // ========================================
  // OSごとのフォント設定
  // ========================================

  // 本文用フォント
  let main-font = if os == "mac" {
    (
      "Times New Roman",
      "Hiragino Mincho ProN",
    )
  } else if os == "windows" {
    (
      "Times New Roman",
      "HGMinchoB",
    )
  } else {
    (
      "Times New Roman",
      "Noto Serif CJK JP",
    )
  }

  // ゴシック体
  let gothic-font = if os == "mac" {
    (
      "Arial",
      "Hiragino Kaku Gothic ProN",
    )
  } else if os == "windows" {
    (
      "Arial",
      "Meiryo",
    )
  } else {
    (
      "Arial",
      "Noto Sans CJK JP",
    )
  }

  // ソースコード用フォント
  let code-font = if os == "mac" {
    (
      "Menlo",                    
      "Hiragino Kaku Gothic ProN",
    )
  } else if os == "windows" {
    (
      "Consolas",
      "Courier New",
      "Meiryo",
      "Yu Gothic UI",
    )
  } else {
    (
      "DejaVu Sans Mono",
      "Noto Sans CJK JP",
    )
  }


  // ========================================
  // 引用番号
  // ========================================

  show ref: it => {
    if it.element != none and it.element.func() == figure {
      let el = it.element
      let loc = el.location()
      let chapt = counter(heading).at(loc).at(0)

      link(loc)[
        #if el.kind == "image" or el.kind == "table" {
          // 番号付け
          let num = counter(el.kind + "-chapter" + str(chapt)).at(loc).at(0) + 1

          it.element.supplement
          " "
          str(chapt)
          "."
          str(num)
        } else if el.kind == "thmenv" {
          let thms = query(selector(<meta:thmenvcounter>).after(loc), loc)
          let number = thmcounters.at(thms.first().location()).at("latest")

          it.element.supplement
          " "
          numbering(it.element.numbering, ..number)
        } else {
          it
        }
      ]
    } else if it.element != none and it.element.func() == math.equation {
      let el = it.element
      let loc = el.location()
      let chapt = counter(heading).at(loc).at(0)
      let sec = counter(heading).at(loc).at(1)
      let num = counter(math.equation).at(loc).at(0)

      it.element.supplement
      " ("
      str(chapt)
      "."
      str(sec)
      "."
      str(num)
      ")"
    } else if it.element != none and it.element.func() == heading {
      let el = it.element
      let loc = el.location()
      let num = numbering(el.numbering, ..counter(heading).at(loc))

      if el.level == 1 {
        str(num)
        "章"
      } else if el.level == 2 {
        str(num)
        "節"
      } else if el.level == 3 {
        str(num)
        "項"
      }
    } else {
      it
    }
  }


  // ========================================
  // ドキュメント設定
  // ========================================

  // ドキュメントのメタデータを設定
  set document(
    title: title,
    author: author,
  )

  // 本文フォント
  set text(
    font: main-font,
    size: 10pt,
  )

  // ページのプロパティを設定
  set page(
    paper: paper-size,
    margin: (
      bottom: 15mm,
      top: 8mm,
      left: 10mm,
      right: 10mm,
    ),
  )

  // ========================================
  // 最初のページ
  // ========================================

  align(left)[
    #text(
      font: gothic-font,
      size: 8pt,
    )[
      #h(1fr)#date.at(0) 年 #date.at(1) 月 #date.at(2) 日 \
    ]

    #text(
      font: gothic-font,
      size: 10pt,
    )[
      #title #h(1fr) #university #h(1em) #id #h(1em) #author
    ]

    #align(right)[
      #block(
        width: 50%,
      )[
        #align(right)[
          #text(
            font: gothic-font,
            size: 10pt,
          )[
            // 参加者: #participants
          ]
        ]
      ]
    ]

    #text(
      font: gothic-font,
      weight: "bold",
      size: 16pt,
    )[
      #subtitle
    ]

    #v(1em)
  ]

  counter(page).update(1)


  // ========================================
  // 本文設定
  // ========================================

  // 段落のプロパティを設定
  set par(
    leading: 0.78em,
    first-line-indent: 0em,
    justify: true,
  )

  // ソースコード
  show raw: set text(
    font: code-font,
    size: 8pt,
  )


  // ========================================
  // 章見出し
  // ========================================

  set heading(
    numbering: (..nums) => {
      nums.pos().map(str).join(".") + " "
    },
  )

  // level 1
  show heading.where(level: 1): it => (
    {
      set text(
        weight: "bold",
        size: 12pt,
        font: gothic-font,
      )

      let pre_chapt = if it.numbering != none {
        text()[
          #numbering(
            it.numbering,
            ..counter(heading).at(it.location()),
          )
          #h(0.5em)
        ]
      } else {
        none
      }

      text(
        align(left)[
          #pre_chapt
          #it.body \
        ],
      )
    }
    + empty_par()
  )

  // level 2
  show heading.where(level: 2): it => {
    set text(
      weight: "bold",
      size: 10pt,
      font: gothic-font,
    )

    let pre_chapt = {
      text()[
        #numbering(
          it.numbering,
          ..counter(heading).at(it.location()),
        )
        #h(0.5em)
      ]
    }

    align(left)[
      #pre_chapt
      #it.body \
    ]
  }

  // level 3
  show heading.where(level: 3): it => {
    set text(
      size: 9pt,
      font: gothic-font,
    )

    set block(
      above: 1.5em,
      below: 1.5em,
    )

    it
  }

  // その他のheading
  show heading: it => (
    {
      set text(
        font: gothic-font,
        weight: "bold",
        size: 14pt,
      )

      set block(
        above: 1.5em,
        below: 1.5em,
      )

      it
    }
    + empty_par()
  )


  // ========================================
  // その他
  // ========================================

  counter(page).update(1)

  set math.equation(
    supplement: [Eq.],
  )

  set enum(
    body-indent: 1em,
    indent: 2em,
    spacing: 1.3em,
  )

  set list(
    body-indent: 1em,
    indent: 2em,
    spacing: 1.3em,
  )

  body


  // ========================================
  // 参考文献
  // ========================================

  if bibliography-file != none {
    show bibliography: set text(
      8pt,
      lang: "en",
    )

    bibliography(
      bibliography-file,
      title: "参考",
      style: "ieee",
      full: true,
    )
  }
}