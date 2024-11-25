## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include = TRUE----------------------------------------------------------
cols = c(1:4, 9:16)
df = as.data.frame( MaxWiK::Data.2D$ABC$Matrix.Voronoi[ 1:4, cols ] )
names( df ) = cols
print( df )


## ---- include = TRUE----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$kernel_mean_embedding


## ---- include = TRUE----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$similarity[1:20]


## ---- include = TRUE----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$Matrix_iKernel[1:4,]


## ---- echo=FALSE, include = TRUE----------------------------------------------
str(MaxWiK::Data.2D$sampling$MaxWiK$results)

## ---- echo=FALSE, include = TRUE----------------------------------------------
str(MaxWiK::Data.2D$sampling$MaxWiK$best)

