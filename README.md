# Substantial gains and little downside from farming of *Totoaba macdonaldi*


Scripts and other files relevant to *Substantial gains and little downside from farming of Totoaba macdonaldi* (Lawson et al, 2023) are detailed here. 


## Data prep and initial conditions (script: `1_Parameters.Rmd`)
This script runs the various analysis needed to find the parameters to calibrate our model (biological parameters, cost estimates for poaching and aquaculture, demand structure.)

Input files are :

* `aqua_par_farm.csv` : von Bertalanffy growth function for *Totoaba macdonaldi* in aquaculture from semi-structured interviews (2017)

* `aqua_par_wild.csv` : von Bertalanffy growth function for *Tototaba macdonaldi* in its natural environment from INAPESCA (2020)

* `dat_p.csv` : seizure data from Environmental Investigation Agency (2014-2017)

* `totoaba_biomass_catch_20230516.csv` : biomass and catch estimate from INAPESCA (1925-2017)

* `w_par.csv`: costs data related to poaching, from INAPESCA (2020) and semi-structured interviews (2017)

* `v_par.csv`: costs related to aquaculture, from EOF, InnovaSea, BlueOcean Mariculture (2017-2018)

Output file : 

* `parameters.csv`: baseline parameters for model run.

* `least_squares_W.csv` : result from least squares estimates of fishing cost parameters ($W_1$ and $W_2$)

* `W_lq_new.csv` : results for baseline and sensitivity values of fishing cost parameters ($W_1$ and $W_2$)

## Conservation farming analysis (script: `2b_Model_baseline.Rmd`)
This script runs the model for our baseline calibration.

Input file: 

* `parameters.csv` : baseline parameters for model run

Output file : 

* `results_all_models.csv` : results from model run including population, harvest & farming, prices and profits for different market structures. 

* `bioecon_performance_table.csv` : table in .csv format for manuscript summarizing model results


## Sensitivity analysis (script: `3b_Sensitivity_analysis.Rmd`)
This script runs sensitivity analysis, for parameters holding other constants, as well as groups of parameters together. 

Input file : 

* `parameters.csv`: baseline parameters for model run

Output file : 

* `sensitivity_analysis.csv` : results of sensitivity analysis

## Additional graphs (script: `4_Additional_graphs.Rmd`)
This script draws several other illustrations for Supplementary Materials. 

## Model extensions (script : `5_model_extensions.Rmd`)
This script examines the results for the oligopoly case (i.e, N identical traders, M identical farmers) and the 'extended cartel' case, where the trader takes over aquaculture. 

