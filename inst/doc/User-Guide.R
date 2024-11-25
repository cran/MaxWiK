## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.align='center'
)

## ----include = TRUE-----------------------------------------------------------
MaxWiK::Data.2D$X[1:4, ]
str(MaxWiK::Data.2D$X)

## ----echo=FALSE, include = TRUE, fig.height=4, fig.width=4--------------------
library(ggplot2)
df = MaxWiK::Data.2D$X; th = MaxWiK::Data.2D$sampling$theme.ggplot
obs = MaxWiK::Data.2D$observation$x0
ggplot(data = df, mapping = aes( x = par.sim.X1, y = par.sim.X2) ) +
    geom_point(size = 0.3) + th + 
    annotate('point', x= obs[1], y = obs[2] , colour="blue", shape = 4, size = 4)

## ----include = TRUE-----------------------------------------------------------
cols = c(1:4, 9:16)
df = as.data.frame( MaxWiK::Data.2D$ABC$Matrix.Voronoi[ 1:4, cols ] )
names( df ) = cols
print( df )


## ----include = TRUE-----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$kernel_mean_embedding


## ----include = TRUE-----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$similarity[1:20]


## ----include = TRUE-----------------------------------------------------------
MaxWiK::Data.2D$ABC$result.MaxWiK$Matrix_iKernel[1:4,]


## ----echo=FALSE, include = TRUE-----------------------------------------------
str(MaxWiK::Data.2D$sampling$MaxWiK$results)

## ----echo=FALSE, include = TRUE-----------------------------------------------
str(MaxWiK::Data.2D$sampling$MaxWiK$best)

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# MaxWiK::MaxWiK_templates(dir = tempdir())

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# example.2D = MaxWiK::Data.2D
# obs        = as.data.frame( t ( example.2D$observation$A ) )
# Matrix.Voronoi  =  example.2D$ABC$Matrix.Voronoi
# res.MaxWik = get.MaxWiK( psi = example.2D$ABC$hyperparameters$psi,
#                          t   = example.2D$ABC$hyperparameters$t,
#                          param    = example.2D$X,
#                          stat.sim = example.2D$Y,
#                          stat.obs =  obs,
#                          talkative = TRUE,
#                          check_pos_def = TRUE,
#                          Matrix_Voronoi = Matrix.Voronoi )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# w.sim = which(res.MaxWik$similarity > 0 )
# posteriori.MaxWiK = Data.2D$X[ w.sim, ]

## ----include = TRUE, eval=TRUE, echo=FALSE, fig.height=3, fig.width=4.5-------
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

## ----include = TRUE, eval=TRUE, echo=FALSE, fig.height=3, fig.width=4.5-------
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

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# example.2D  = MaxWiK::Data.2D
# obs         = as.data.frame( t ( example.2D$observation$A ) )
# res.MaxWik  =  MaxWiK::Data.2D$ABC$result.MaxWiK
# meta.sampling  =  meta_sampling( psi = example.2D$ABC$hyperparameters$psi,
#                                  t   = example.2D$ABC$hyperparameters$t,
#                                  param    = example.2D$X,
#                                  stat.sim = example.2D$Y,
#                                  stat.obs =  obs,
#                                  talkative = TRUE,
#                                  check_pos_def = TRUE,
#                                  n_bullets = 42,
#                                  n_best = 12,
#                                  halfwidth = 0.5,
#                                  epsilon = 0.001,
#                                  rate = 0.2,
#                                  max_iteration = 10,
#                                  save_web = TRUE,
#                                  use.iKernelABC = res.MaxWik )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
#         network  = unique.data.frame( do.call(rbind.data.frame, meta.sampling$spiderweb ) )

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
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

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
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

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# do.call( what = model, args = c( arg0, list( x = c(5, 7) ) ) )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# smpl.2D  = MaxWiK::Data.2D$sampling
# stat.sim = MaxWiK::Data.2D$Y
# par.sim  = MaxWiK::Data.2D$X
# sampling.res = sampler_MaxWiK( stat.obs =  smpl.2D$stat.obs,
#                               stat.sim =  stat.sim,
#                               par.sim  =  par.sim,
#                               model    =  smpl.2D$model_function,
#                               arg0     =  smpl.2D$model_par,
#                               size     =  1600,
#                               psi_t    =  smpl.2D$psi_t,
#                               epsilon  =  1E-10,
#                               check_err  =  FALSE,
#                               nmax     =  60,
#                               include_top  =  TRUE,
#                               slowly       =  TRUE,
#                               rate         =  0.05,
#                               n_simulation_stop = 1000,
#                               include_web_rings = F,
#                               number_of_nodes_in_ring = 1  )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# MSE  =  data.frame( sim_ID = sampling.res$results$sim_ID,
#                     MSE    = sampling.res$results$mse )
# X12  =  data.frame( sim_ID  = sampling.res$results$sim_ID,
#                     X1 = sampling.res$results$par.sim.X1,
#                     X2 = sampling.res$results$par.sim.X2 )

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
library('ggplot2')
MSE = MaxWiK::Data.2D$sampling$MSE
obs = MaxWiK::Data.2D$observation
th =     theme(
    plot.title = element_text(color="red", size=12, face="bold.italic"),
    axis.title.x = element_text(color="black", size=13, face="bold"),
    axis.title.y = element_text(color="black", size=13, face="bold"), 
    axis.text    = element_text(color="black", size=11             )
)
ggplot(data = MSE, aes( x, y ) ) + 
    geom_line( linewidth = 0.7 )  +  scale_y_log10() + 
    geom_smooth(method = "lm", alpha = .5, formula= y~x ) + 
    ylab("Mean Squared Error") + xlab("Number of simulations") + th

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
library('ggplot2')
X12 = MaxWiK::Data.2D$sampling$X12
obs = MaxWiK::Data.2D$observation
th =     theme(
    plot.title = element_text(color="red", size=12, face="bold.italic"),
    axis.title.x = element_text(color="black", size=13, face="bold"),
    axis.title.y = element_text(color="black", size=13, face="bold"), 
    axis.text    = element_text(color="black", size=11             )
)
ggplot(data = X12, aes( i ) ) + 
    geom_line(aes(y = x1 ), linewidth = 0.5 ) +
    geom_line(aes(y = x2 ), linewidth = 0.5 ) + 
    geom_hline( aes(yintercept= obs$x0[1]),   
                color='red', linetype=2, linewidth=0.4) +
    geom_hline( aes(yintercept= obs$x0[2]),   
                color='red', linetype=2, linewidth=0.4) +
    ylab("Parameters X1 and X2") + xlab("Number of simulations") + th


## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# pred.input  =  MaxWiK::Data.2D$predictor$result$input.parameters
# stat.sim    =  MaxWiK::Data.2D$Y
# par.sim     =  MaxWiK::Data.2D$X
# new.param   =  as.data.frame( t( MaxWiK::Data.2D$observation$x0 ) )
# iKernelABC  =  MaxWiK::Data.2D$predictor$result$iKernelABC
# predictor   =  MaxWiK.predictor( psi = pred.input$psi,
#                                  t   = pred.input$t,
#                                  param     = par.sim,
#                                  stat.sim  = stat.sim,
#                                  new.param = new.param,
#                                  talkative = FALSE,
#                                  check_pos_def = FALSE ,
#                                  n_bullets  = 42,
#                                  n_best     = 12,
#                                  halfwidth  = 0.5,
#                                  epsilon    = 0.001,
#                                  rate       = 0.2,
#                                  max_iteration = 10,
#                                  save_web   = TRUE,
#                                  use.iKernelABC = iKernelABC
# )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# predictor$prediction.best

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# pred.network  = unique.data.frame( do.call(rbind.data.frame, predictor$spiderweb ) )

## ----include = TRUE, echo=TRUE, eval=FALSE------------------------------------
# pred.network  = apply_range( diapason = c(0,1000), input.data = pred.network )
# predictor$prediction.best = apply_range( diapason = c(0,1000),
#                             input.data = predictor$prediction.best )

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
library('ggplot2')
posteriori.pred.MaxWiK  =  MaxWiK::Data.2D$predictor$posteriori.MaxWiK
pred.network = MaxWiK::Data.2D$predictor$network
pred.network  = apply_range( diapason = c(0,1000), input.data = pred.network )
obs = MaxWiK::Data.2D$observation
best.sim = MaxWiK::Data.2D$predictor$result$prediction.best
best.sim  = apply_range( diapason = c(0,1000), input.data = best.sim )
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of Y1 parameter', 
                   datafr1 = posteriori.pred.MaxWiK, 
                   datafr2 = pred.network, 
                   var.df  = 'stat.sim.Y1', 
                   obs.true = obs$A[ 1 ], 
                   best.sim = as.numeric( best.sim[ 1 ] )
)

## ----echo=FALSE, include = TRUE, fig.height=3, fig.width=5--------------------
library('ggplot2')
posteriori.pred.MaxWiK  =  MaxWiK::Data.2D$predictor$posteriori.MaxWiK
pred.network = MaxWiK::Data.2D$predictor$network
pred.network  = apply_range( diapason = c(0,1000), input.data = pred.network )
obs = MaxWiK::Data.2D$observation
best.sim = MaxWiK::Data.2D$predictor$result$prediction.best
best.sim  = apply_range( diapason = c(0,1000), input.data = best.sim )
MaxWiK::MaxWiK.ggplot.density( title = ' Posteriori distribution of Y2 parameter', 
                   datafr1 = posteriori.pred.MaxWiK, 
                   datafr2 = pred.network, 
                   var.df  = 'stat.sim.Y2', 
                   obs.true = obs$A[ 2 ], 
                   best.sim = as.numeric( best.sim[ 2 ] )
)

