#import "font.typ": *
#let abstract_title(title) = {
  align(center + top)[
    #set text(font: 字体.黑体, size: 字号.三号)
    #title  
  ]
}

#let Abstract(keywords : [], abstract_name, keywords_title, separator, abstract) = {
  page(header: none, footer: none)[
    #set align(top + start)
    #abstract_title(abstract_name)
    #set text(font: 字体.宋体, size: 字号.小四)
    #set par(justify: true, first-line-indent: 2em, leading: 2em, spacing: 2em)
    #abstract

    #v(1em)

    #keywords_title#h(0.5em)#keywords.join([#separator])
  ]
}

#let ChineseAbstract(keywords : [], abstract) = {
  Abstract(keywords : keywords, "摘要", "关键词:", "，",abstract)
}

#let EnglishAbstract(keywords : [], abstract) = {
  Abstract(keywords : keywords, "ABSTRACT","KEY WORDS:",", ", abstract)
}
