\name{ecospat.testData}

\docType{data}

\alias{ecospat.testData}

\title{Test data for the ecospat library }

\description{Data frame that contains vegetation plots data: presence records of 50 species, a set of environmental variables (topo-climatic) and SDM predictions for some species in the Western Swiss Alps (Canton de Vaud, Switzerland).
}

\usage{data(ecospat.testData)}

\format{A data frame with 300 observations on the following 66 variables.
  \describe{
    \item{\code{numplots}}{Number of the vegetation plot.}
    \item{\code{long}}{Longitude, in Swiss plane coordinate system of the vegetation plot.}
    \item{\code{lat}}{Latitude, in Swiss plane coordinate system of the vegetation plot.}
    \item{\code{ddeg}}{Growing degree days (with a 0 degrees Celsius threshold).}
    \item{\code{mind}}{Moisture index over the growing season (average values for June to August in mm day-1).}
    \item{\code{srad}}{The annual sum of radiation (in kJ m-2 year-1).}
    \item{\code{slp}}{Slope (in degrees) calculated from the DEM25.}
    \item{\code{topo}}{Topographic position (an integrated and unitless measure of topographic exposure.}
    \item{\code{Agrostis_capillaris}}{}
    \item{\code{Leontodon_hispidus_sl}}{}
    \item{\code{Dactylis_glomerata}}{}
    \item{\code{Trifolium_repens_sstr}}{}
    \item{\code{Geranium_sylvaticum}}{}
    \item{\code{Ranunculus_acris_sl}}{}
    \item{\code{Prunella_vulgaris}}{}
    \item{\code{Veronica_chamaedrys}}{}
    \item{\code{Taraxacum_officinale_aggr}}{}
    \item{\code{Plantago_lanceolata}}{}
    \item{\code{Potentilla_erecta}}{}
    \item{\code{Carex_sempervirens}}{}
    \item{\code{Soldanella_alpina}}{}
    \item{\code{Cynosurus_cristatus}}{}
    \item{\code{Campanula_scheuchzeri}}{}
    \item{\code{Festuca_pratensis_sl}}{}
    \item{\code{Polygonum_viviparum}}{}
    \item{\code{Ranunculus_montanus_aggr}}{}
    \item{\code{Rumex_acetosa}}{}
    \item{\code{Carex_flacca}}{}
    \item{\code{Potentilla_aurea}}{}
    \item{\code{Homogyne_alpina}}{}
    \item{\code{Briza_media}}{}
    \item{\code{Lathyrus_pratensis}}{}
    \item{\code{Poa_alpina}}{}
    \item{\code{Sesleria_caerulea}}{}
    \item{\code{Trollius_europaeus}}{}
    \item{\code{Anthyllis_vulneraria_sl}}{}
    \item{\code{Deschampsia_cespitosa}}{}
    \item{\code{Trisetum_flavescens}}{}
    \item{\code{Galium_anisophyllon}}{}
    \item{\code{Euphrasia_minima}}{}
    \item{\code{Astrantia_major}}{}
    \item{\code{Nardus_stricta}}{}
    \item{\code{Ligusticum_mutellina}}{}
    \item{\code{Hieracium_lactucella}}{}
    \item{\code{Chaerophyllum_hirsutum_aggr}}{}
    \item{\code{Helianthemum_nummularium_sl}}{}
    \item{\code{Scabiosa_lucida}}{}
    \item{\code{Cerastium_fontanum_sl}}{}
    \item{\code{Carex_pallescens}}{}
    \item{\code{Plantago_alpina}}{}
    \item{\code{Crepis_aurea}}{}
    \item{\code{Leontodon_helveticus}}{}
    \item{\code{Bromus_erectus_sstr}}{}
    \item{\code{Polygonum_bistorta}}{}
    \item{\code{Saxifraga_oppositifolia}}{}
    \item{\code{Daucus_carota}}{}
    \item{\code{Parnassia_palustris}}{}
    \item{\code{Pritzelago_alpina_sstr}}{}
    \item{\code{glm_Agrostis_capillaris}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Leontodon_hispidus_sl}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Dactylis_glomerata}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Trifolium_repens_sstr}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Geranium_sylvaticum}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Ranunculus_acris_sl}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Prunella_vulgaris}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Veronica_chamaedrys}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Taraxacum_officinale_aggr}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Plantago_lanceolata}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Potentilla_erecta}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Carex_sempervirens}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Soldanella_alpina}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Cynosurus_cristatus}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Campanula_scheuchzeri}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Festuca_pratensis_sl}}{GLM model for the species Daucus_carota.}
    \item{\code{gbm_Bromus_erectus_sstr}}{GBM model for the species Bromus_erectus_sstr.}
    \item{\code{glm_Saxifraga_oppositifolia}}{GLM model for the species Saxifraga_oppositifolia.}
    \item{\code{glm_Daucus_carota}}{GLM model for the species Daucus_carota.}
    \item{\code{glm_Pritzelago_alpina_sstr}}{GLM model for the species Pritzelago_alpina_sstr.}
    \item{\code{glm_Bromus_erectus_sstr}}{GLM model for the species Bromus_erectus_sstr.}
    \item{\code{gbm_Saxifraga_oppositifolia}}{GBM model for the species Saxifraga_oppositifolia.}
    \item{\code{gbm_Daucus_carota}}{GBM model for the species Daucus_carota.}
    \item{\code{gbm_Pritzelago_alpina_sstr}}{GBM model for the species Pritzelago_alpina_sstr.}
}
}
\details{
The study area is the Western Swiss Alps of Canton de Vaud, Switzerland.

Five topo-climatic explanatory variables to calibrate the SDMs: growing degree days (with a 0 degrees Celsius threshold); moisture index over the growing season (average values for June to August in mm day-1); slope (in degrees); topographic position (an integrated and unitless measure of topographic exposure; Zimmermann et al., 2007); and the annual sum of radiation (in kJ m-2 year-1). The spatial resolution of the predictor is 25 m x 25 m so that the models could capture most of the small-scale variations of the climatic factors in the mountainous areas.

Two modelling techniques were used to produce the SDMs: generalized linear models (GLM; McCullagh & Nelder, 1989; R library 'glm') and generalized boosted models (GBM; Friedman, 2001; R library 'gbm'). The SDMs correpond to 20 species: Agrostis_capillaris, Leontodon_hispidus_sl, Dactylis_glomerata, Trifolium_repens_sstr, Geranium_sylvaticum, Ranunculus_acris_sl, Prunella_vulgaris, Veronica_chamaedrys, Taraxacum_officinale_aggr, Plantago_lanceolata, Potentilla_erecta, Carex_sempervirens, Soldanella_alpina, Cynosurus_cristatus, Campanula_scheuchzeri, Festuca_pratensis_sl, Daucus_carota, Pritzelago_alpina_sstr, Bromus_erectus_sstr and Saxifraga_oppositifolia.}


\references{Guisan, A. 1997. Distribution de taxons vegetaux dans un environnement alpin: Application de modelisations statistiques dans un systeme d'information geographique. PhD Thesis, University of Geneva, Switzerland.

Guisan, A., J.P. Theurillat. & F. Kienast. 1998. Predicting the potential distribution of plant species in an alpine environment. \emph{Journal of Vegetation Science}, \bold{9}, 65-74.

Guisan, A. & J.P. Theurillat. 2000. Assessing alpine plant vulnerability to climate change: A modeling perspective. \emph{Integrated Assessment}, \bold{1}, 307-320.

Guisan, A. & J.P. Theurillat. 2000. Equilibrium modeling of alpine plant distribution and climate change : How far can we go? \emph{Phytocoenologia}, \bold{30}(3-4), 353-384.

Dubuis A., J. Pottier, V. Rion, L. Pellissier, J.P. Theurillat & A. Guisan. 2011. Predicting spatial patterns of plant species richness: A comparison of direct macroecological and species stacking approaches. \emph{Diversity and Distributions}, \bold{17}, 1122-1131.

Zimmermann, N.E., T.C. Edwards, G.G Moisen, T.S. Frescino & J.A. Blackard. 2007. Remote sensing-based predictors improve distribution models of rare, early successional and broadleaf tree species in Utah. \emph{Journal of Applied Ecology} \bold{44}, 1057-1067.
}

\author{Antoine Guisan \email{antoine.guisan@unil.ch}, Anne Dubuis \email{anne.dubuis@gmail.com} and Valeria Di Cola \email{valeria.dicola@unil.ch}
}

\examples{
data(ecospat.testData)
dim(ecospat.testData)
names(ecospat.testData)
}
