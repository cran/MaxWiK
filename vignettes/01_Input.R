## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.align='center'
)

## ---- include = TRUE----------------------------------------------------------
MaxWiK::Data.2D$X[1:4, ]
str(MaxWiK::Data.2D$X)

## ---- echo=FALSE, include = TRUE, fig.height=4, fig.width=4-------------------
library(ggplot2)
df = MaxWiK::Data.2D$X; th = MaxWiK::Data.2D$sampling$theme.ggplot
obs = MaxWiK::Data.2D$observation$x0
ggplot(data = df, mapping = aes( x = par.sim.X1, y = par.sim.X2) ) +
    geom_point(size = 0.3) + th + 
    annotate('point', x= obs[1], y = obs[2] , colour="blue", shape = 4, size = 4)

