# Comparison of genotype-to-phenotype relations in mouse and human

## Autors

- **Yury Barbitoff**, Institute of Bioinformatics Research and Education (Belgrade)
- **[Nadezhda Pavlova](https://github.com/pavlovanadia/)**, Lomonosov Moscow State University (Moscow)
- **[Polina Bogaichuk](https://github.com/bossay)**, Bioinformatics Institute (Saint-Petersburg)

## Summary

The Human Phenotype Ontology ([HPO](https://github.com/obophenotype/human-phenotype-ontology)[^1]) and the Mouse Phenotype Ontology ([MPO](https://github.com/mgijax/mammalian-phenotype-ontology)[^2]) are standardized vocabularies that describe phenotypic abnormalities caused by genetic variations. Due to their hierarchical structure, these ontologies contain both lower-level, specific terms representing observable traits and higher-level, broader terms encompassing related specific phenotypes.

![](https://hackmd.io/_uploads/ry8w35IB3.png)



Our knowledge of the aetiologies underpinning hereditary phenotypic features has greatly and quickly evolved due to the use of model organisms, enabling a comparison between genetic variants and associated phenotypes observed in these organisms with corresponding associations in humans [^3]. However, the translation of the results of genetic studies conducted on model organisms, such as mice, to humans does not show high reproducibility  comparison to genes with phenotypes described and thus presents difficulties due to simplifying gene-phenotype associations [^4].

The present study aimed to **investigate the concordance between the gene-phenotype associations in human and mouse, analyzing the correspondence of traits associated with orthologous genes as well as patterns of pleiotropy in both organisms**.

To achieve this aim, we had the following objectives:

- Investigate HPO and MPO structures
- Analyze existing databases and compile the dataset
- Conduct general pleiotropy analysis in both organisms
- Compare genotype-phenotype relationships for orthologues in both organisms.

By using HPO, MPO and available genetic and phenotypic data from HPO, as well as Mouse Genome Informatics (MGI) [^5], we aimed to find common and species-specific connections between genes and traits. 

## General approach

We compiled a dataset comprising information about orthologous genes in mice and humans, as well as their associations with MPO and HPO terms, respectively. Initially, we made the assumption that orthologous genes would exhibit similar, albeit slightly different, sets of associated phenotypes. To achieve this, we employed the [ontobio](https://github.com/biolink/ontobio) package to aggregate detailed phenotypic terms into systemic terms. The mapping of HPO to MPO by MPO was used for this purpose. We then matched mapped systemic HPO terms for humans to systemic MPO terms to make relevant comparisons. The dataset was filtered to include only 16985 genes with a single ortholog in both organisms, ensuring dataset consistency. We next annotated the genes using gene expression information from the Genotype Tissue Expression (GTEx) data [^6] and the Genome Aggregation Database (gnomAD) evolutionary constraint data [^7]. Additionally, we conducted gene ontology term enrichment analysis using the [clusterProfiler](https://github.com/YuLab-SMU/clusterProfiler) package in R. Detailed information about the datasets used in our study can be found in the [datasets](https://github.com/pavlovanadia/genotype_to_phenotype/tree/main/databases) folder of our repository.

![](https://hackmd.io/_uploads/SkaZfjLSn.png)

## Pleiotropy analysis

- There is a weak positive correlation between the number of systemic terms per gene in humans and mice.
- Most genes exhibited associations with two or more systemic terms (93.9% for humans and 89.8% for mice among all genes associated with at least one phenotypic term). 
- Genes have split the genes into three groups: non-pleiotropic, moderately pleiotropic, and highly pleiotropic.
![](https://hackmd.io/_uploads/ryyYO6LSn.png)
- Gene expression and conservation were examined and an indicated higher degree of pleiotropy correlated with broader expression and higher selective pressure.
- Gene Ontology term enrichment analysis revealed that highly pleiotropic genes were enriched in fundamental biological processes.
- Non-pleiotropic genes were found to be expressed in numerous tissues. In humans, these genes were associated with the immune system and homeostasis phenotypes, while in mice, they were linked to mortality/aging.
![](https://hackmd.io/_uploads/ryvQwaIH3.png)


## Concordance analysis

- System phenotypic terms are described differently in terms of gene-phenotype associations count in human and mouse.

![](https://hackmd.io/_uploads/rJPpQp8Bn.png)


- According to whether or not genes (16985 genes) have phenotypic associations with phenotypes in human and mouse, genes were split into four categories:
  - no phenotypic associations in both human and mouse (4471 genes, 26.3%)
  - no phenotypic associations in human, but some in mouse (7914 genes, 46.6%)
  - no phenotypic associations in mouse, but some in human (416 genes, 2.4%)
  - phenotypic associations in both organisms are present (4184 genes, 24.6%):
    - phenotype terms lists do not oberlap (385 genes)
    - phenotype terms lists overlap (3115 genes)
    - human phenotype terms list includes mouse phenotype terms list (284)
    - mouse phenotype terms list includes human phenotype terms list (385)
    - associated with gene phenotype terms in human and mouse are identical (15)


![](https://hackmd.io/_uploads/HJp5fpIS2.png)

- 15 genes found to be associated with the same sets of systemic phenotypic terms in mice and humans are mostly related to vision phenotype, immune system, and nervous system and are significantly lower conserved and expressed in tissues in comparison to other 4169 genes that have phenotypic associations in both organisms.

![](https://hackmd.io/_uploads/ByMkm6wB2.png)


![](https://hackmd.io/_uploads/SkGI1R8Hn.png)


- System phenotypes associated with 3115 genes that have intersecting phenotypic associations in both organisms are described differently in both organisms.
- Immune system phenotype, growth/size/body regoin phenotype, endocrine/exocrine gland phenotype, liver/biliary phenotype are associated with approximately comparable gene number in both organisms.

![](https://hackmd.io/_uploads/SkWc_aUr2.png)

- For all mentioned above phenotypes, but immune phenotype: if compared, genes associated with these phenotypes and described in human but not in mouse tend to be less conservative and likely less functional in comparison to genes described only in mouse. Conversely, genes associated only with the phenotype in mouse were more conserved.

![](https://hackmd.io/_uploads/H1wdAAIS3.png)


## Conclusion
In summary, our comparison showed that most genes exhibit pleiotropy in both humans and mice, and highly pleiotropic genes are consistently associated with broader expression patterns, a higher degree of evolutionary conservation, and involvement in fundamental cellular processes in both species. At the same time, analysis of the correspondence between gene-phenotype relationships on the level of individual genes showed high levels of discrepancy between the organisms. Given that more genes are annotated in mice than in humans, we conclude that a quantitative understanding of genotype-phenotype associations is better in mice. Only a handful of genes are associated with the same phenotypes in both mice and humans, and such genes show lower conservation and restricted expression. It is crucial to consider this difference in studying gene-phenotype associations when conducting experiments, especially when attempting to extrapolate results from mice to humans.

## Dependencies
This project was implemented using Windows 10 x64 and Ubuntu 22.04.2 LTS.
The code was developed utilizing Python 3.9.16 (VSCCC) and R 4.1.2 (2021-11-01) (RStudio).
External libraries are utilized, so please upload the requirements.txt file to your virtual environment.
Please note that ontobio library needs to reach restricted in some areas site during import, hence you will need Internet connection and VPN enabled for this script to work.

 
## References
[^1]: Köhler, S., et al. (2021). The Human Phenotype Ontology in 2021. Nucleic Acids Research, 49(D1), D1207-D1217. doi: 10.1093/nar/gkaa1043.
[^2]: Smith, C. L., & Eppig, J. T. (2009). The mammalian phenotype ontology: enabling robust annotation and comparative analysis. Wiley Interdisciplinary Reviews: Systems Biology and Medicine, 1(3), 390-399. doi: 10.1002/wsbm.44.
[^3]: Beck, T., Rowlands, T., Shorter, T., & Brookes, A. J. (2023). GWAS Central: an expanding resource for finding and visualising genotype and phenotype data from genome-wide association studies. Nucleic Acids Research, 51(D1), D986-D993.
[^4]: Sittig, L. J., et al. (2016). Genetic background limits generalizability of genotype-phenotype relationships. Neuron, 91(6), 1253-1259.
[^5]: Law, M., & Shaw, D. R. (2018). Mouse Genome Informatics (MGI) Is the International Resource for Information on the Laboratory Mouse. In: Eukaryotic Genomic Databases: Methods and Protocols. Kollmar M (ed.) Springer. pp. 141-161.
[^6]: The Genotype-Tissue Expression (GTEx) Project was supported by the Common Fund of the Office of the Director of the National Institutes of Health, and by NCI, NHGRI, NHLBI, NIDA, NIMH, and NINDS. The data used for the analyses described in this manuscript were obtained from the GTEx Portal on 04/03/23.
[^7]: Karczewski, K. J., et al. (2020). The mutational constraint spectrum quantified from variation in 141,456 humans. Nature, 581(7809), 434-443. doi: 10.1038/s41586-020-2308-7
