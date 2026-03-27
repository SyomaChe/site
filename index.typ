#let files = csv(bytes(sys.inputs.files)).first()

#let generate_index_html() = {
  html.head(lang: "en", {
    html.head({
      html.elem("meta", attrs: (charset: "UTF-8"))
      html.elem("meta", attrs: (name: "viewport", content: "width=device-width, initial-scale=1.0"))
      // html.elem("link", attrs: (rel: "icon", type: "image/x-icon", href: "fav.png"))
      html.elem("title", "Example")
      html.elem(
        "style",
        str(read("index.css"))
      )
    })
    html.elem("body", {
      html.elem("ul", attrs: (id: "list"), {
        for article in files {
          html.elem("li", {
            html.elem(
              "a",
              attrs: (href: article + ".html"),
              lower(article),
            )
          })
        }
      })
    })
  })
}

#generate_index_html()
