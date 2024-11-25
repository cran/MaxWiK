## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  example.2D  = MaxWiK::Data.2D
#  obs         = as.data.frame( t ( example.2D$observation$A ) )
#  res.MaxWik  =  MaxWiK::Data.2D$ABC$result.MaxWiK
#  meta.sampling  =  meta_sampling( psi = example.2D$ABC$hyperparameters$psi,
#                                   t   = example.2D$ABC$hyperparameters$t,
#                                   param    = example.2D$X,
#                                   stat.sim = example.2D$Y,
#                                   stat.obs =  obs,
#                                   talkative = TRUE,
#                                   check_pos_def = TRUE,
#                                   n_bullets = 42,
#                                   n_best = 12,
#                                   halfwidth = 0.5,
#                                   epsilon = 0.001,
#                                   rate = 0.2,
#                                   max_iteration = 10,
#                                   save_web = TRUE,
#                                   use.iKernelABC = res.MaxWik )

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#          network  = unique.data.frame( do.call(rbind.data.frame, meta.sampling$spiderweb ) )

## ---- echo=FALSE, include = TRUE, fig.height=3, fig.width=5-------------------
library('ggplot2')
th = MaxWiK::Data.2D$sampling$theme.ggplot
meta.sampling  =  MaxWiK::Data.2D$metasampling$result
network  = unique.data.frame( do.call(rbind.data.frame, meta.sampling$spiderweb ) )
obs = MaxWiK::Data.2D$observation
w = which(MaxWiK::Data.2D$metasampling$result$iKernelABC$similarity > 0)
posteriori.MaxWiK = MaxWiK::Data.2D$X[ w, ]
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of X1 parameter', 
                   datafr1 = posteriori.MaxWiK, 
                   datafr2 = network, 
                   var.df  = 'par.sim.X1', 
                   obs.true = obs$x0[ 1 ], 
                   best.sim = as.numeric( meta.sampling$par.best[ 1 ] )
)

## ---- echo=FALSE, include = TRUE, fig.height=3, fig.width=5-------------------
library('ggplot2')
th = MaxWiK::Data.2D$sampling$theme.ggplot
meta.sampling  =  MaxWiK::Data.2D$metasampling$result
network  = unique.data.frame( do.call(rbind.data.frame, meta.sampling$spiderweb ) )
obs = MaxWiK::Data.2D$observation
w = which(MaxWiK::Data.2D$metasampling$result$iKernelABC$similarity > 0)
posteriori.MaxWiK = MaxWiK::Data.2D$X[ w, ]
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of X2 parameter', 
                   datafr1 = posteriori.MaxWiK, 
                   datafr2 = network, 
                   var.df  = 'par.sim.X2', 
                   obs.true = obs$x0[ 2 ], 
                   best.sim = as.numeric( meta.sampling$par.best[ 2 ] )
)

