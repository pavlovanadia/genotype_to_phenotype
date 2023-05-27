# Scripts support information #

This directory contains several scripts that were created and are recommended for observing in the specific order.

* ## [dataset_consolidation.ipynb](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/dataset_consolidation.ipynb)

Jupiter notebook with code to create dataset for further analysis based on databases HMD.rpt, HPO.txt, PhenoGeno.rpt and HP2MP.tsv in [databases](https://github.com/pavlovanadia/genotype_to_phenotype/tree/main/databases) directory. Utilizes [low2system.py](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/low2system.py) script that contains function for phenotypic terms up-leveling. Script output is human_mouse_GPO.tsv dataset that is employed in further analysis performed in [concordance_analysis.ipynb](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/concordance_analysis.ipynb) and [pleiotropy_analysis.ipynb](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/pleiotropy_analysis.ipynb) scripts.

* ## [concordance_analysis.ipynb](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/concordance_analysis.ipynb)

Jupiter notebook with analysis of phenotypes associated with orthologous genes in human and mouse. Contains the calculation of descriptive statistics, plotting, and generation of intermediate datasets.

* ## [pleiotropy_analysis.ipynb](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/pleiotropy_analysis.ipynb)

Jupiter notebook with pleiotropy analysis separately in mice and humans. Contains the calculation of descriptive statistics for HPO and MPO terms, the creation of plots, and the formation of intermediate datasets.

* ## [low2system.py](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/low2system.py)

Function for moving from one level of HPO and MPO terms to the target level. Takes a list of terms, the ontology type ("hp" or "mp") and a list of target-level terms. Returns a list of target-level terms that are ancestors of the input terms. Employs ontobio library, hence, please, upload [requirements.txt](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/requirements.txt) to your virtual environment and make sure your VPN is enabled if you are running this script from the country of restriction area.

* ## [emission_ratio.R](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/emission_ratio.R)

R script to calculate the ratio of outliers in the dataset relative to the rest of the observations and compare this ratio to the expected ratio of 1:3. The Chi-square test is used. Used in pleiotropy analysis. Employs .csv files from [intermediate_data](https://github.com/pavlovanadia/genotype_to_phenotype/tree/main/intermediate_data) directory that were obtained during pleiotropy analysis. 

* ## [enrichment_go.R](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/enrichment_go.R)

R-language script for conducting enrichment analysis of the Gene Ontology terms in mice and humans. It also allows you to create and save the resulting data and dotplots. Employs .csv files from [intermediate_data](https://github.com/pavlovanadia/genotype_to_phenotype/tree/main/intermediate_data) directory that were obtained during pleiotropy analysis. 

* ## [pairwise_comparison.R](https://github.com/pavlovanadia/genotype_to_phenotype/blob/main/scripts/pairwise_comparison.R)

R-language script for performing pairwise comparisons of numerical metrics between groups using the Wilcoxon-Mann-Whitney multiple comparison test. Employs .csv files from [intermediate_data](https://github.com/pavlovanadia/genotype_to_phenotype/tree/main/intermediate_data) directory that were obtained during concordance and pleiotropy analysis. 
