#let theme = it => context {
  if target() == "paged" {
    //IDK whatever
    it
  } else {
    show math.equation: it => {
      if it.block {
        html.div(class: "equation-block", html.frame(it))
      } else {
        html.span(class: "equation-inline", html.frame(it))
      }
    }

    show quote: it => {
      html.blockquote(it.body)
    }

    html.elem("style", str(read("post.css")))

    it
  }
}
