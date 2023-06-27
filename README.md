# Conservation farming for *Totoaba* : low risk, high reward after 50 years of failed regulatory interventions

Scripts and other files relevant to *Conservation farming presents a low risk, high reward alternative after fifty years of failed regulatory interventions for totoaba (Totoaba macdonaldi)* (Lawson et al, 2023) are detailed here. 


## Data prep and initial conditions (script: `1_Parameters.Rmd`)
This script runs the various analysis needed to find the parameters to calibrate our model (biological parameters, cost estimates for poaching and aquaculture, demand structure.)

Input files are :

**Still missing dates and sources for some files**

* `aqua_par_farm.csv` : von Bertalanffy growth function for *Totoaba macdonaldi* in aquaculture

* `aqua_par_wild.csv` : von Bertalanffy growth function for *Tototaba macdonaldi* in its natural environment from INAPESCA (2020)

* `dat_p.csv` : seizure data from Environmental Investigation Agency (2014-2017)

* `totoaba_biomass_catch_20230516.csv` : biomass and catch estimate from INAPESCA (1925-2017)

* `w_par.csv`: costs data related to poaching, from INAPESCA (2020) and semi-structured interviews. 

* `v_par.csv`: costs related to aquaculture, from EOF, InnovaSea, BlueOcean Mariculture.

Output file : 

* `parameters.csv`: baseline parameters for model run. 

## Conservation farming analysis (script: `2_Model.Rmd`)
This script runs the model for our baseline calibration. 

Input file: 

* `parameters.csv` : baseline parameters for model run

Output file : 

* `result1.csv` : results from model run including population, harvest & farming, prices for different market structures. 


## Sensitivity analysis (script: `3_Sensitivity_analysis.Rmd`)
This script runs sensitivity analysis, for parameters holding other constants, as well as groups of parameters together. 

Input file : 

* `parameters.csv`: baseline parameters for model run

Output file : 

* `sensitivity_analysis.csv` : results of sensitivity analysis

## Additional graphs (script: `4_Additional_graphs.Rmd`)
This script draws several other illustrations for Supplementary Materials. 


