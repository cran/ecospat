\name{ecospat.ESM.threshold}
\alias{ecospat.ESM.threshold}

\title{
Thresholds for Ensemble of Small Models
}
\description{
This function evaluates the full model which is used for projections and provides thresholds to produce binary maps.

}
\usage{
    ecospat.ESM.threshold( ESM.EnsembleModeling.output, 
                           PEplot = FALSE)
}
\arguments{
    \item{ESM.EnsembleModeling.output}{a list object returned by \code{\link[ecospat]{ecospat.ESM.EnsembleModeling}}}
    \item{PEplot}{logical. Should the predicted to expected ratio along the suitability class from the boyce index be plotted. Default FALSE (see \code{\link[ecospat]{ecospat.boyce}}} 

}
\details{
This function provides evaluation scores of the full model (no split sampling) and thresholds which can be used to convert suitability maps into binary maps. Various thresholds are provided: TSS (where sensitivity and specificity are maximised), MPA 1.0 (where all presences are prdicted positive), MPA 0.95 (where 95\% of all presences are predicted positive), MPA 0.90 (where 90\% of all presences are predicted positive), Boyce.th.min (the lowest suitability value where the predicted/expected ratio is >1) and Boyce.th.max (the highest suitability value where the predicted/expected ratio is =1). 
}

\value{
A data.frame with evluation scores and thresholds.
}

\author{
Frank Breiner \email{frank.breiner@unil.ch}

}
\references{
Hirzel, Alexandre H., et al. Evaluating the ability of habitat suitability models to predict species presences. \emph{Ecological modelling}, \bold{199.2} (2006): 142-152.

Engler, Robin, Antoine Guisan, and Luca Rechsteiner. An improved approach for predicting the distribution of rare and endangered species from occurrence and pseudo-absence data. \emph{Journal of applied ecology}, \bold{41.2} (2004): 263-274.

Fielding, Alan H., and John F. Bell. A review of methods for the assessment of prediction errors in conservation presence/absence models." \emph{Environmental conservation}, \bold{24.1} (1997): 38-49.
          }

\seealso{
\code{\link[ecospat]{ecospat.ESM.Modeling}}
}