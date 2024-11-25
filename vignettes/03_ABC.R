## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  example.2D = MaxWiK::Data.2D
#  obs        = as.data.frame( t ( example.2D$observation$A ) )
#  Matrix.Voronoi  =  example.2D$ABC$Matrix.Voronoi
#  res.MaxWik = get.MaxWiK( psi = example.2D$ABC$hyperparameters$psi,
#                           t   = example.2D$ABC$hyperparameters$t,
#                           param    = example.2D$X,
#                           stat.sim = example.2D$Y,
#                           stat.obs =  obs,
#                           talkative = TRUE,
#                           check_pos_def = TRUE,
#                           Matrix_Voronoi = Matrix.Voronoi )

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  w.sim = which(res.MaxWik$similarity > 0 )
#  posteriori.MaxWiK = Data.2D$X[ w.sim, ]

## ---- include = TRUE, eval=TRUE, echo=FALSE, fig.height=3, fig.width=4.5------
library(ggplot2)
library(MaxWiK)
obs=MaxWiK::Data.2D$observation
res.MaxWik = MaxWiK::Data.2D$ABC$result.MaxWiK
w.sim = which(res.MaxWik$similarity > 0 )
posteriori.MaxWiK = MaxWiK::Data.2D$X[ w.sim, ]
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of X1 parameter', 
                           datafr1 = posteriori.MaxWiK, 
                           datafr2 = NULL, 
                           var.df = 'par.sim.X1', 
                           obs.true = obs$x0[ 1 ], 
                           best.sim = NULL )

## ---- include = TRUE, eval=TRUE, echo=FALSE, fig.height=3, fig.width=4.5------
library(ggplot2)
library(MaxWiK)
obs=MaxWiK::Data.2D$observation
res.MaxWik = MaxWiK::Data.2D$ABC$result.MaxWiK
w.sim = which(res.MaxWik$similarity > 0 )
posteriori.MaxWiK = MaxWiK::Data.2D$X[ w.sim, ]
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of X2 parameter', 
                   datafr1 = posteriori.MaxWiK, 
                   datafr2 = NULL, 
                   var.df = 'par.sim.X2', 
                   obs.true = obs$x0[ 2 ], 
                   best.sim = NULL )

