#import "font.typ": *
#let TitlePage(
  chinese_title: "北京大学本科生typst论文模板",
  english_title: "typst template for undergraduate in PKU",
  name : "十一",
  studentid : "20000xxxxx",
  department : "信息科学与技术学院",
  major : "信息与计算科学",
  supervisor_name : "11",
  year_and_month : "二〇二四年五月"
) = {
  let fieldname(name) = [
    #set align(right + top)
    #set text(font : 字体.黑体, size : 字号.小三)
    #strong(name)
  ]

  let fieldvalue(style : 字体.黑体, size : 字号.三号, value) = [
    #set align(center + horizon)
    #set text(font: style, size:size)
    #grid(
      rows: (auto, auto),
      row-gutter: 0.3em,
      [#value],
      line(length: 100%)
    )
  ]
  page(numbering: none, header: none, footer: none)[
    #set par(leading: 1em, spacing: 1em)
    #set align(center)
    #box(
      grid(
        columns: (auto, auto),
        gutter: 0.4em,
        image("../asset/pkulogo.svg", height: 65pt, fit: "contain"),
        image("../asset/pkuword.svg", height: 60pt, fit: "contain")
      )
    )

    #text(
      font: 字体.黑体,
      size: 字号.小初,
      [本科生毕业论文]
    )
    
    #let title = fieldvalue.with(style : 字体.黑体, size : 字号.一号) 
    #pad(x:7%)[#grid(
      columns: 2,
      rows: 2,
      column-gutter: 1em,
      row-gutter: 1em,
      [#text(font: 字体.宋体, size : 字号.二号)[题目]], [#title(chinese_title)],
      [],[#title(english_title)]
    )]
    #v(10%)
    #let term = fieldvalue.with(style : 字体.仿宋, size : 字号.小三) 
    #pad(x: 15%,grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      fieldname([姓#h(2em)名]), term(name),
      fieldname([学#h(2em)号]), term(studentid),
      fieldname([院#h(2em)系]),term(department),
      fieldname([专#h(2em)业]),term(major),
      fieldname([导师姓名]), term(supervisor_name)
    ))

    #align(bottom)[
      #text(
        font: 字体.黑体,
        size: 字号.三号,
        year_and_month
      )
    ]
  ]
}