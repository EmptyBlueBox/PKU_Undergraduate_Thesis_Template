#import "font.typ": *

#let CheckSheet(
  name : "张三",
  studentid : "20000xxxxx",
  school : "信息科学与技术学院",
  major : "信息与计算科学",
  supervisor : "李四",
  department : "计算机学院",
  grade : "优",
  title : "助理教授",
  chinese_title : "北京大学学位论文 Typst 模板",
  sign_pic: none,
  english_title : "Typst Template for Peking University Dissertations",
  year : 2024,
  month : 5,
  day : 12,
  supervisor_comment,
) = {
  set text(font: 字体.宋体, size : 字号.小四)
  
  let wrap_comment(comment) = {
    block(width : 95%, height: 100%)[
    #v(0.5em)
    #align(center + top, [导师评语])

    
    #align(top + start)[#comment]

    #align(right + bottom, [
      导师签名: #h(0.5em) #box(baseline: 30%, height: 3em)[#sign_pic]
      #v(1em)
      #h(2em) #year 年 #month 月 #day 日
    ])
    ]
  }
  
  page(numbering: none, header: none, footer: none)[
    #set par(leading: 1em, spacing: 1em)

    #align(center, [#text(size: 字号.小三)[北大本科生毕业论文导师评阅表]])

    #table(
      columns : (1fr, 1.2fr,1fr,2fr,1fr,1fr),
      rows : (1fr, 1fr, 1.5fr, 1.5fr,1.5fr,18cm),
      [学生姓名], [#name], [本科院系],[#school],
      table.cell(x : 4, y : 0, rowspan: 2, [论文成绩 \ （等级制）]),
      table.cell(x : 5, y : 0, rowspan: 2,align:  alignment.center, [#grade]),
      [学生学号],[#studentid],[本科专业],[#major],
      [导师姓名], [#supervisor],[导师单位 \ /所在学院],[#department],[导师职称],[#title],
      table.cell(rowspan: 2, [论文题目]), [中文],
      table.cell(colspan: 4, [#chinese_title]),
      [英文],table.cell(colspan: 4, [#english_title]),
      table.cell(colspan: 6,[#wrap_comment(supervisor_comment)])
    )
  ] // end of page
}