# Comparison of genotype-to-phenotype relations in mouse and human

## Autors

- **Yury Barbitoff**, Institute of Bioinformatics Research and Education (Belgrade)
- **[Nadezhda Pavlova](https://github.com/pavlovanadia/)**, Lomonosov Moscow State University (Moscow)
- **[Polina Bogaichuk](https://github.com/bossay)**, Bioinformatics Institute (Saint-Petersburg)

## Summary

The Human Phenotype Ontology ([HPO](https://github.com/obophenotype/human-phenotype-ontology)[^1]) and the Mouse Phenotype Ontology ([MPO](https://github.com/mgijax/mammalian-phenotype-ontology)[^2]) are standardized vocabularies used to describe phenotypic abnormalities caused by genetic variations in humans and mice, respectively. These ontologies contain specific terms representing observable traits and broader terms encompassing related phenotypes. By studying these ontologies and associated databases, we can compare the phenotypic manifestations resulting from genetic variations in both species, which helps in understanding gene functions and disease development.

![](https://hackmd.io/_uploads/ry8w35IB3.png)



Our knowledge of the aetiologies underpinning hereditary phenotypic features has greatly and quickly evolved due to the use of model organisms with a further comparison of genetic variants and associated phenotypes [^3]. However, the extrapolation of genetic studies conducted on model organisms, such as mice, to humans does not show high reproducibility and thus presents difficulties due to simplifying gene-phenotype associations [^4].

The aim of this study was **to investigate the relationship between genotypes and phenotypes in humans and mice**. To achieve this aim, we had the following objectives:

- Investigate HPO and MPO structures
- Analyze existing databases and compile the dataset
- Conduct general pleiotropy analysis in both organisms
- Compare genotype-phenotype relationships for orthologues in both organisms

By utilizing these ontologies and leveraging available genetic and trait data, our study aimed to uncover meaningful insights into the relationships between genes and traits in both humans and mice.

## General approach

We gathered a dataset containing orthologous genes and their connections to MPO and HPO terms. To obtain the data, we utilized the Mouse Genome Informatics (MGI)[^5] and HPO databases. Phenotypic terms were consolidated into systemic terms with the help of [ontobio](https://github.com/biolink/ontobio). We compared the systemic HPO terms for humans to the systemic MPO terms by utilizing term mapping data from MPO. To ensure monosemanticity, we filtered the dataset, resulting in 16,985 genes with identical orthologs in both organisms. For gene expression analysis, we relied on GTEx data[^7], while gnomAD[^8] data provided insights into conserved expression. Additionally, we conducted gene ontology term enrichment analysis using the [clusterProfiler](https://github.com/YuLab-SMU/clusterProfiler)[^9] package in R. Detailed information about the datasets used in our study can be found in the [datasets](https://github.com/pavlovanadia/genotype_to_phenotype/tree/nadia/databases) folder of our repository.

![](https://hackmd.io/_uploads/SkaZfjLSn.png)

## Pleiotropy analysis

- There is a weak positive correlation between the number of systemic terms per gene in humans and mice.
- Most genes are associated with two or more systemic terms, indicating their pleiotropic nature.
- Genes were categorized into non-pleiotropic, modestly pleiotropic, and highly pleiotropic groups.
![](https://hackmd.io/_uploads/ryyYO6LSn.png)
- Gene expression and conservation were examined, revealing an increase in rates corresponding to the level of pleiotropy within the gene group.
- Enrichment analysis revealed that highly pleiotropic genes are enriched in fundamental cellular processes.
- Non-pleiotropic genes that are expressed in multiple tissues in humans are associated with immune system and homeostasis phenotypes, while in mice, they are linked to mortality/aging.
![](https://hackmd.io/_uploads/ryvQwaIH3.png)


## Concordance analysis

- System phenotypic terms are described differently in terms of gene-phenotype associations number in human and mouse.

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

![](https://hackmd.io/_uploads/SkGI1R8Hn.png)


- System phenotypes associated with 3115 genes that have intersecting phenotypic associations in both organisms are described differently in both organisms.
- Immune system phenotype, growth/size/body regoin phenotype, endocrine/exocrine gland phenotype, liver/biliary phenotype are associated with approximately comparable gene number in both organisms.

![](https://hackmd.io/_uploads/SkWc_aUr2.png)

- For all mentioned above phenotypes, but immune phenotype: if compared, genes associated with these phenotypes and described in human but not in mouse tend to be less conservative and likely less functional in comparison to genes described only in mouse. Conversely, genes associated only with the phenotype in mouse were more conserved.

![](https://hackmd.io/_uploads/B1N_a0Ur3.png)


## Conclusion
Summarily, most genes exhibit pleiotropy, but highly pleiotropic genes are associated with high expression, conservation, and involvement in fundamental cellular processes. The quantitative understanding of genotype-phenotype associations is better in mice compared to humans. Genes associated with the same phenotypes in both mice and humans show lower conservation and restricted expression. It is crucial to consider this difference in studying gene-phenotype associations when conducting experiments, especially when attempting to extrapolate results from mice to humans.


## References
[^1]: Köhler, S., et al. (2021). The Human Phenotype Ontology in 2021. Nucleic Acids Research, 49(D1), D1207-D1217. doi: 10.1093/nar/gkaa1043.
[^2]: Smith, C. L., & Eppig, J. T. (2009). The mammalian phenotype ontology: enabling robust annotation and comparative analysis. Wiley Interdisciplinary Reviews: Systems Biology and Medicine, 1(3), 390-399. doi: 10.1002/wsbm.44.
[^3]: Beck, T., Rowlands, T., Shorter, T., & Brookes, A. J. (2023). GWAS Central: an expanding resource for finding and visualising genotype and phenotype data from genome-wide association studies. Nucleic Acids Research, 51(D1), D986-D993.
[^4]: Sittig, L. J., et al. (2016). Genetic background limits generalizability of genotype-phenotype relationships. Neuron, 91(6), 1253-1259.
[^5]: Law, M., & Shaw, D. R. (2018). Mouse Genome Informatics (MGI) Is the International Resource for Information on the Laboratory Mouse. In: Eukaryotic Genomic Databases: Methods and Protocols. Kollmar M (ed.) Springer. pp. 141-161.
[^6]: ontobio (version 2.8.8) - python API for working with ontologies and associations. Available on GitHub at https://github.com/biolink/ontobio.
[^7]: The Genotype-Tissue Expression (GTEx) Project was supported by the Common Fund of the Office of the Director of the National Institutes of Health, and by NCI, NHGRI, NHLBI, NIDA, NIMH, and NINDS. The data used for the analyses described in this manuscript were obtained from the GTEx Portal on 04/03/23.
[^8]: Karczewski, K. J., et al. (2020). The mutational constraint spectrum quantified from variation in 141,456 humans. Nature, 581(7809), 434-443. doi: 10.1038/s41586-020-2308-7
[^9]: Wu, T., Hu, E., Xu, S., Chen, M., Guo, P., Dai, Z., Feng, T., Zhou, L., Tang, W., Zhan, L., Fu, X., Liu, S., Bo, X., & Yu, G. (2021). "clusterProfiler 4.0: A universal enrichment tool for interpreting omics data." The Innovation, 2(3), 100141. doi: 10.1016/j.xinn.2021.100141.


