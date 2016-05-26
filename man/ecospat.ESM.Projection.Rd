\name{ecospat.ESM.Projection}
\alias{ecospat.ESM.Projection}

\title{
Ensamble of Small Models: Projects Simple Bivariate Models Into New Space Or Time
}
\description{
This function projects simple bivariate models on new.env
}
\usage{
    ecospat.ESM.Projection( ESM.modeling.output, 
                            new.env, 
                            parallel=F)
}
\arguments{
    \item{ESM.modeling.output}{
    \code{BIOMOD.formated.data} object returned by \code{\link[biomod2]{BIOMOD_FormatingData}}
    }
    \item{new.env}{
A set of explanatory variables onto which models will be projected. It could be a \code{data.frame}, a \code{matrix}, or a \code{rasterStack} object. Make sure the column names (\code{data.frame} or \code{matrix}) or layer Names (\code{rasterStack}) perfectly match with the names of variables used to build the models in the previous steps.
    }
    \item{parallel}{
Logical. If TRUE, the parallel computing is enabled

}
}
\details{
The basic idea of ensemble of small models (ESMs) is to model a species distribution based on small, simple models, for example all possible bivariate models (i.e. models that contain only two predictors at a time out of a larger set of predictors), and then combine all possible bivariate models into an ensemble (Lomba et al. 2010; Breiner et al. 2015).

The ESM set of functions could be used to build ESMs using simple bivariate models which are averaged using weights based on model performances (e.g. AUC) accoring to Breiner et al (2015). They provide full functionality of the approach described in Breiner et al. (2015).

The name of \code{new.env} must be a regular expression (see ?regex)
}
\value{
Returns the projections for all selected models (same as in \code{biomod2})
See \code{"\link[=BIOMOD.projection.out-class]{BIOMOD.projection.out}"} for details.

}
\author{ Frank Breiner \email{frank.breiner@wsl.ch} with contributions of 
Olivier Broennimann \email{olivier.broennimann@unil.ch}
}
\references{

Lomba, A., L. Pellissier, C.F. Randin, J. Vicente, F. Moreira, J. Honrado and A. Guisan. 2010. Overcoming the rare species modelling paradox: A novel hierarchical framework applied to an Iberian endemic plant. \emph{Biological Conservation}, \bold{143},2647-2657.
Breiner F.T., A. Guisan, A. Bergamini and M.P. Nobis. 2015. Overcoming limitations of modelling rare species by using ensembles of small models. \emph{Methods in Ecology and Evolution}, \bold{6},1210-1218.
          }

\seealso{
\code{\link[ecospat]{ecospat.ESM.EnsembleModeling}}, \code{\link[ecospat]{ecospat.ESM.Modeling}}, \code{\link[ecospat]{ecospat.ESM.EnsembleProjection}}

\code{\link[biomod2]{BIOMOD_FormatingData}}, \code{\link[biomod2]{BIOMOD_ModelingOptions}}, \code{\link[biomod2]{BIOMOD_Modeling}},\code{\link[biomod2]{BIOMOD_Projection}}

}
\examples{
   \dontrun{
# Loading test data for the niche dynamics analysis in the invaded range
inv <- ecospat.testNiche.inv

# species occurrences
xy <- inv[,1:2]
sp_occ <- inv[11]

# env
current <- inv[3:10]



### Formating the data with the BIOMOD_FormatingData() function form the package biomod2
setwd(path.wd)
t1 <- Sys.time()
sp <- 1
myBiomodData <- BIOMOD_FormatingData( resp.var = as.numeric(sp_occ[,sp]),
                                      expl.var = current,
                                      resp.xy = xy,
                                      resp.name = colnames(sp_occ)[sp])

myBiomodOption <- Print_Default_ModelingOptions()


### Calibration of simple bivariate models
my.ESM <- ecospat.ESM.Modeling( data=myBiomodData,
                                models=c('GLM','RF'),
                                models.options=myBiomodOption,
                                NbRunEval=2,
                                DataSplit=70,
                                weighting.score=c("AUC"),
                                parallel=F)  


### Evaluation and average of simple bivariate models to ESMs
my.ESM_EF <- ecospat.ESM.EnsembleModeling(my.ESM,weighting.score=c("SomersD"),threshold=0)

### Projection of simple bivariate models into new space 
my.ESM_proj_current<-ecospat.ESM.Projection(ESM.modeling.output=my.ESM,
                                            new.env=current)

### Projection of calibrated ESMs into new space 
my.ESM_EFproj_current <- ecospat.ESM.EnsembleProjection(ESM.prediction.output=my.ESM_proj_current,
                                                        ESM.EnsembleModeling.output=my.ESM_EF)

}}