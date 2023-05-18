# Databases description #

* ## HMD.rpt ##

Source link [here](https://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt). Tab-delimited. 

Mouse/Human Orthology with Phenotype Annotations (tab-delimited). The core database used in this work connecting human gene entrez id and mouse MGI term. One of the main disadvantages is that MP terms are high-level and could not be specified to the low-level.

Structure and example:

| Human Marker Symbol | Human Entrez Gene ID | Mouse Marker Symbol | MGI Marker Accession ID | High-level Mammalian Phenotype ID (comma-delimited) |
| --- | - | -- | - | ----- |
| A4GALT | 53947 | A4galt | MGI:3512453 | MP:0005376, MP:0005386, MP:0010768 |


* ## HPO.txt ##

Source link [here](http://purl.obolibrary.org/obo/hp/hpoa/genes_to_phenotype.txt). Tab-delimited. 

Database with entrez id - low-level HPO terms mapping.

Structure and example:

| entrez-gene-id | entrez-gene-symbol | HPO-Term-ID | HPO-Term-Name | Frequency-Raw | Frequency-HPO | Additional Info from G-D source | G-D source | disease-ID for link |
| -- | -- | -- | -- | -- | -- | -- | -- | -- |
| 8192 | CLPP |	HP:0000013 | Hypoplasia of the uterus | - | - | - | mim2gene | OMIM:614129 |


* ## PhenoGeno.rpt ##

Source link [here](https://www.informatics.jax.org/downloads/reports/MGI_PhenoGenoMP.rpt). Tab-delimited. 

All Genotypes and Mammalian Phenotype Annotations. Advantages: low-level MP terms, lots of gene-phenotype mappings covered. Disadvantages: MP terms may include MP:0002873 (normal phenotype) and MP:0003012 (no phenotypic analysis) that might be filtered further if needed.

Structure and example:

| Allelic Composition | Allele Symbol(s) | Genetic Background | Mammalian Phenotype ID | PubMed ID | MGI Marker Accession ID (comma-delimited) |
| -- | -- | -- | -- | -- | -- |
Rb1<tm1Tyj>/Rb1<tm1Tyj> | Rb1<tm1Tyj> | involves: 129S2/SvPas | MP:0000600 | 12529408 | MGI:97874 |

