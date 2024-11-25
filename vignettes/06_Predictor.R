## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  pred.input  =  MaxWiK::Data.2D$predictor$result$input.parameters
#  stat.sim    =  MaxWiK::Data.2D$Y
#  par.sim     =  MaxWiK::Data.2D$X
#  new.param   =  as.data.frame( t( MaxWiK::Data.2D$observation$x0 ) )
#  iKernelABC  =  MaxWiK::Data.2D$predictor$result$iKernelABC
#  predictor   =  MaxWiK.predictor( psi = pred.input$psi,
#                                   t   = pred.input$t,
#                                   param     = par.sim,
#                                   stat.sim  = stat.sim,
#                                   new.param = new.param,
#                                   talkative = FALSE,
#                                   check_pos_def = FALSE ,
#                                   n_bullets  = 42,
#                                   n_best     = 12,
#                                   halfwidth  = 0.5,
#                                   epsilon    = 0.001,
#                                   rate       = 0.2,
#                                   max_iteration = 10,
#                                   save_web   = TRUE,
#                                   use.iKernelABC = iKernelABC
#  )

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  predictor$prediction.best

## ---- include = TRUE, echo=TRUE, eval=FALSE-----------------------------------
#  pred.network  = unique.data.frame( do.call(rbind.data.frame, predictor$spiderweb ) )

## ---- echo=FALSE, include = TRUE, fig.height=3, fig.width=5-------------------
library('ggplot2')
posteriori.pred.MaxWiK  =  MaxWiK::Data.2D$predictor$posteriori.MaxWiK
pred.network = MaxWiK::Data.2D$predictor$network
obs = MaxWiK::Data.2D$observation
best.sim = MaxWiK::Data.2D$predictor$result$prediction.best
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of Y1', 
                   datafr1 = posteriori.pred.MaxWiK, 
                   datafr2 = pred.network, 
                   var.df  = 'stat.sim.Y1', 
                   obs.true = obs$A[ 1 ], 
                   best.sim = as.numeric( best.sim[ 1 ] )
)

## ---- echo=FALSE, include = TRUE, fig.height=3, fig.width=5-------------------
library('ggplot2')
posteriori.pred.MaxWiK  =  MaxWiK::Data.2D$predictor$posteriori.MaxWiK
pred.network = MaxWiK::Data.2D$predictor$network
obs = MaxWiK::Data.2D$observation
best.sim = MaxWiK::Data.2D$predictor$result$prediction.best
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of Y2', 
                   datafr1 = posteriori.pred.MaxWiK, 
                   datafr2 = pred.network, 
                   var.df  = 'stat.sim.Y2', 
                   obs.true = obs$A[ 2 ], 
                   best.sim = as.numeric( best.sim[ 2 ] )
)

