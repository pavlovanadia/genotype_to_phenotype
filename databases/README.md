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


* ## HP2MP.tsv ##

Source link [here](https://github.com/mgijax/mammalian-phenotype-ontology/tree/main/mappings). Tab-delimited. 

HPO system-level terms to MPO system-level terms mapping by MGI consortium.

Structure and example:

| subject_id | predicate_id | object_id | match_type | subject_label | object_label | creator_id |
| -- | -- | -- | -- | -- | -- | -- |
HP:0001871 | rdfs:subClassOf | MP:0005397 | HumanCurated | Abnormality of blood and blood-forming tissues | hematopoietic system phenotype | https://orcid.org/0000-0003-4606-0597 |


* ## MGI_to_ID.csv ##

Source link [here](https://www.informatics.jax.org/downloads/reports/MGI_Gene_Model_Coord.rpt). Comma-delimited. 

MGI gene model coordinates. Contains possible descriptions of mouse genes. Entrez gene ID data for mouse genes were used for the analysis.

Structure and example:


| **MGI accession ID** | **Marker type** | **Marker symbol** | **Marker name** | **Genome build** | **Entrez gene ID** | **NCBI gene chromosome** | **NCBI gene start** | **NCBI gene end** | **NCBI gene strand** |
|----------------------|-----------------|-------------------|---------------------------------|------------------|--------------------|--------------------------|---------------------|-------------------|----------------------|
| MGI:87854            | Gene            | Pzp               | PZP, alpha-2-macroglobulin like | GRCm39           | 11287              | 6                        | 128460530           | 128503683         | -                    |


* ## expression_GTEx.gct ##

Source link [here](https://storage.googleapis.com/gtex_analysis_v8/rna_seq_data/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz). Tab-delimited. 

This database provides information on the median gene expression levels across different tissues. The expression values are measured in transcripts per million (TPM). The analysis incorporates data from all 54 tissues available in the dataset. The median expression values were calculated using GTEx data (v8, 2017).

Structure and example:


| **Name**          | **Description** | **Adipose - Subcutaneous** | **Adipose - Visceral (Omentum)** | **Adrenal Gland** | **...** | **Vagina** | **Whole Blood** |
|-------------------|-----------------|----------------------------|----------------------------------|-------------------|---------|------------|-----------------|
| ENSG00000223972.5 | DDX11L1         | 0                          | 0                                | 0                 | ...     | 5.74554    | 2.64743         |


* ## constraint_gnomAD.txt ##

Source link [here](https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz). Tab-delimited. 

Constraint metrics by gene calculated using data from gnomAD (v2.1.1). The metrics used for the analysis were:
> **pLI** - the probability that the ratio of observed to expected LoF variants in the gene is greater than 0.9, which corresponds to typical haploinsufficiency.  
>**LOEUF** - 90% upper bound of the confidence interval of the ratio of observed to expected variants of the LoF type.  
>**Z-score for missense** - deviation of the observed from the expected number of missense variants for the gene.

Structure and example:

| **Gene** | **Transcript**  | **Observed missense** | **Expected missense** | **Observed over expected ratio** | **Mutation rate** | **...** | **pLI**    | **LOEUF** | **Z-score for missense**  |
|----------|-----------------|-------------|-------------|------------|------------|---------|------------|------------------|------------|
| MED13    | ENST00000397786 | 871         | 1.1178e+03  | 7.7921e-01 | 5.5598e-05 | ...     | 9.8429e+01 | 0.0000e+00       | 2.6232e+00 |

* ## human_mouse_GPO.tsv ##

Dataset consolidated for this project, based on other databases in this directory via dataset_consolidation.ipynb in scripts directory. Tab-delimited. 


Structure and example:

| **gene_human** | **entrez_id_human**  | **gene_mouse** | **MGI** | **MP_HMD** | **MP_PhenoGeno** | **HP_genes_to_phenotype** | **MP_system_level**    | **HP_system_level** | **MP_from_HP_system_level**  |
|----------|-----------------|-------------|-------------|------------|------------|---------|------------|------------------|------------|
| ABCA2    | 20 | Abca2         | MGI:99606  | MP:0005378,MP:0003631 | MP:0002574,MP:0001566 | HP:0002066,HP:0002311 | MP:0005378,MP:0003631 | HP:0001574,HP:0003011 | MP:0005390,MP:0003631 |
