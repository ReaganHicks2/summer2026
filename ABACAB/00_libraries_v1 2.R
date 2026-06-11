### Libraries to load into rmd before running analyses

library(dplyr)
library(haven)
library(tidyverse)
library(psych)
library(lavaan)
library(semPlot)
library(ggplot2)
library(tinytex)
library(here) ## tells rmd to refer to files in the Data folder, since rmd is in Scripts. # Format example: parent6to11data <- read_sav(here("Data", "scored_NWCH0001_parent_6_11_OUTPUT.sav"))
library(ggdist) ## used for rain cloud plots
library(viridis) ## makes plots colorblind friendly (use with scale_color_viridis)
# library(survey)  ## handles weights, base-R functions, more control and more advanced options.
# library(srvyr)  ## also handles weights, tidyverse/dplyr style, good for chaining lots of summaries
# library(Hmisc) ## weighted means
# library(weights)
library(corrplot)
library(nFactors)
library(GPArotation)
library(semTools)