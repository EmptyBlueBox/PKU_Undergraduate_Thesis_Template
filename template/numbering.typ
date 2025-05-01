#import "font.typ": *

// 计数排版部分，从原版文件里复制过来作为公用部分
#let chinesenumber(num, standalone: false) = if num < 11 {
  ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(num)
} else if num < 100 {
  if calc.rem(num, 10) == 0 {
    chinesenumber(calc.floor(num / 10)) + "十"
  } else if num < 20 and standalone {
    "十" + chinesenumber(calc.rem(num, 10))
  } else {
    chinesenumber(calc.floor(num / 10)) + "十" + chinesenumber(calc.rem(num, 10))
  }
} else if num < 1000 {
  let left = chinesenumber(calc.floor(num / 100)) + "百"
  if calc.rem(num, 100) == 0 {
    left
  } else if calc.rem(num, 100) < 10 {
    left + "零" + chinesenumber(calc.rem(num, 100))
  } else {
    left + chinesenumber(calc.rem(num, 100))
  }
} else {
  let left = chinesenumber(calc.floor(num / 1000)) + "千"
  if calc.rem(num, 1000) == 0 {
    left
  } else if calc.rem(num, 1000) < 10 {
    left + "零" + chinesenumber(calc.rem(num, 1000))
  } else if calc.rem(num, 1000) < 100 {
    left + "零" + chinesenumber(calc.rem(num, 1000))
  } else {
    left + chinesenumber(calc.rem(num, 1000))
  }
}

// this is a mark
#let appendix_mode = state("appendix_mode", false)

#let page_start = state("page_start", false)

#let appendix_start() = {
  appendix_mode.update(true)
  counter(heading).update(0)
}

#let appendix_end() = {
  appendix_mode.update(false)
}

#let start_page_counting() = {
  pagebreak(weak: true)
  page_start.update(true)
  counter(page).update(1)
}

#let stop_page_counting() = {
  pagebreak(weak: true)
  page_start.update(false)
}

#let chinesenumbering(..nums, location: none, brackets: false) = {
  let use_appendix_mode = if location != none {
    appendix_mode.at(location)
  } else {
    appendix_mode.get()
  }
  if not use_appendix_mode {
    if nums.pos().len() == 1 {
      numbering("1.", nums.pos().first())
    } else {
      numbering(if brackets { "(1.1)" } else { "1.1" }, ..nums)
    }
  } else {
    if nums.pos().len() == 1 {
      "附录 " + numbering("A.1", ..nums)
    } else {
      numbering(if brackets { "(A.1)" } else { "A.1" }, ..nums)
    }
  }
  h(0.5em)
}

#let figure_numbering(..nums) = context {
  numbering("1.1", counter("chapter").at(here()).first(), ..nums)
}

#let foot_numbering() = {
context {
    [
    #if not page_start.get() {
    } else {
    
      set text(size: 字号.五号, font : 字体.黑体, weight: "regular")
      set align(center)
      text[第 #counter(page).display() 页] 
    }
    #label("__footer__")
    ] 
  }
}
