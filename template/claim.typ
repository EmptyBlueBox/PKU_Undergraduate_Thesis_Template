#import "font.typ" : *
#let ClaimTitle(title) = {
  set text(size: 字号.三号, font: 字体.黑体)
  set align(center + top)
  title
}
#let CopyrightClaim = [
  #page(numbering: none, header: none, footer: none)[
    #ClaimTitle([版权声明])
    #v(10pt)
    #par(justify: true, leading: 2em, spacing: 2em)[
      #set text(font : 字体.宋体, size : 字号.小四)
      #set align(start + top)
      任何收存和保管本论文各种版本的单位和个人，未经本论文作者同意，不得将本论文转借他人，亦不得随意复制、抄录、拍照或以任何方式传播。否则，引起有碍作者著作权之问题，将可能承担法律责任。
    ]
  ]
]

#let SubClaimTitle(title)= {
  set text(size: 字号.四号, font: 字体.宋体)
  set align(center + top)
  title
}

#let OriginalityStatement(year, month, day, my_sign : none) = {
  block()[
    #SubClaimTitle([*原创性声明*])

    #set par(first-line-indent: 2em, justify: true, leading: 1em)
    #set text(font : 字体.宋体, size : 字号.小四)
    #set align(start + top)
    本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表或撰写过的作品或成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本声明的法律结果由本人承担。
    #v(4em)
    #set align(right)
    论文作者签名： #h(0.5em) #box(height: 3em, baseline: 30%)[#my_sign]

    日期： #year 年 #month 月 #day 日
  ]
}

#let TermofUseandAuthorization(year, month, day, teacher_sign : none, my_sign : none) = {
  block()[
    #SubClaimTitle([*学位论文使用授权说明*])
    #set par(first-line-indent: 2em, justify: true, leading: 1em)
    #set text(font : 字体.宋体, size : 字号.小四)
    #set align(start + top)

    本人完全了解北京大学关于收集、保存、使用学位论文的规定，即：

    - 按照学校要求提交学位论文的印刷本和电子版本；
    - 学校有权保存学位论文的印刷本和电子版，并提供目录检索与阅览服务，在校园网上提供服务；
    - 学校可以采用影印、缩印、数字化或其它复制手段保存论文；

    #v(4em)
    #set align(right)
    论文作者签名： #box(height: 3em, baseline: 30%)[#if my_sign == none {"                    "} else {my_sign}] #h(1em) 导师签名：#box(height: 3em, baseline: 30%)[#if teacher_sign == none {"                    "} else {teacher_sign}]

    日期： #year 年 #month 月 #day 日
  ]
}

#let Statement(year, month, day, teacher_sign : none, my_sign: none) ={
  pagebreak()
  block()[
    #align(center)[
      #heading(level: 1, numbering: none, outlined: true)[北京大学学位论文原创性声明和使用授权说明]
    ]
    #OriginalityStatement(year, month, day, my_sign : my_sign)
    #v(2em)
    #TermofUseandAuthorization(year, month, day, teacher_sign : teacher_sign, my_sign : my_sign)
  ]
}
