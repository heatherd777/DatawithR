library(memery)
library(magick)

myimage <- file.choose()

meme(
  img = "/Users/heather/Documents/collegeworks/UF MS Microbio/AI Ag Life Sci/epicat_logo.jpg",
  label = c(
    "Meow"
  ),
  file = "epicat_meme.png",
  size = 2
)

plot(image_read("epicat_meme.png"))
