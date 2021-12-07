# NMFClustering (v3)

**Description**: Non-negative Matrix Factorization Consensus Clustering


**Authors**: Pablo Tamayo (Broad Institute)  with
contributions from Jean-Philippe Brunet(Broad Institute), Kenneth Yoshimoto (San Diego Supercomputing Center) and Ted Liefeld (University of California San Diego). Parallel NMF Implementation from https://github.com/bioinfo-cnb/bionmf-gpu

**Contact**: [Forum Link](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!forum/genepattern-help)


## Summary

Non-negative matrix factorization (NMF) is an unsupervised learning algorithm [1]
that has been shown to identify molecular patterns when applied to gene expression data [2].
Rather than separating gene clusters based on distance computation, NMF detects contextdependent patterns of gene expression in complex biological systems.
The basic principle of dimensionality reduction via matrix factorization operates as follows:
given an N x M data matrix A with non-negative entries, the NMF algorithm iteratively
computes an approximation, A ~ WH, where W is an N x k matrix, H is a k x M matrix, and
both are constrained to have positive entries. For DNA microarrays, N, the number of genes,
is typically in the thousands. M, the number of experiments, rarely exceeds a hundred, while
k, the number of classes to be determined depends on the heterogeneity of the dataset. The
algorithm starts with randomly initialized matrices of the appropriate size, W and H. These are
iteratively updated to minimize the Euclidean distance between V and WH or a divergence
norm [3]. The program also computes row and column factor memberships according to
maximum amplitudes. This membership information is also used to sort the output matrices
according the row and column membership (the row and columns are then relabeled:
<name>_f<NMF factor>.


<!-- appropriate papers should be cited here -->
## References
1. Lee, D.D and Seung, H.S. (1999), ‘Learning the parts of objects by nonnegative matrix factorization’, Nature 401, 788-793.
2. Jean-Philippe Brunet, Pablo Tamayo, Todd Golub, Jill Mesirov (2004). Matrix
Factorization for Molecular Pattern Recognition, PNAS 101, 4164-4169.
3. Lee, D.D., and Seung, H.S., (2001), ‘Algorithms for Non-negative Matrix
Factorization’, Adv. Neural Info. Proc. Syst. 13, 556-562.
4. E. Mejía-Roa, D. Tabas-Madrid, J. Setoain, C. García, F. Tirado and A. Pascual-Montano. NMF-mGPU: Non-negative matrix factorization on multi-GPU systems. BMC Bioinformatics 2015, 16:43. doi:10.1186/s12859-015-0485-4 [http://www.biomedcentral.com/1471-2105/16/43]


## Source Links
* [The GenePattern NMFClustering source repository](https://github.com/genepattern/NMFClustering)
* NMFClustering uses the [NMF-mGPU implementation](https://github.com/bioinfo-cnb/bionmf-gpu)

## Parameters

| Name | Description <!--short description--> | Default Value |
---------|--------------|----------------
| dataset.filename * | Input dataset (gct) | |
| k.initial * |Initial value of K. | 2 |
| k.final * | Final value of K. |  5  |
| num.clusterings * | Number of clusterings to perform for each value of K. | 20 |
| max.num.iterations * | The maximum number of iterations to perform for each clustering run for each value of K. This number may not be reached depending on the stability of the clustering solution and the settings of stop convergence and stop frequency. |  2000 |
| random.seed * | Random seed used to initialize W and H matrices by the random number generator. e.g. 4585, 4567, 5980. This may be set to provide repeatable results for given parameter inputs even though the algorithm is properly random. |  123456789 |
| output.file.prefix * | Prefix to prepend to all output file names. | <dataset.filename_basename>   |
| stop.convergence * | How many "no change" checks are needed to stop NMF iterations before max iterations is reached (convergence). Iterations will stop after this many “no change” checks report no changes. | 40 |
| stop.frequency * | Frequency of "no change" checks. NMFConsensus will check for changes every ‘stop frequency’ iterations. | 10 |

\*  required

## Input Files
1. dataset.filename  
   Input dataset in GCT format.
    
## Output Files

1. consensus.k.#.gct (for each value of K): consensus matrix for k=#


## Example Data

Input:  
[BRCA_DESeq2_normalized_20783x40.gct](https://github.com/genepattern/NMFClustering/blob/develop/data/BRCA_DESeq2_normalized_20783x40.gct)

Output:  


## Requirements

This version only runs on the San Diego Super Computer Expanse cluster.


## License

`NMFClustering` is distributed under a modified BSD license available at [https://github.com/genepattern/NMFClustering/blob/develop/LICENSE](https://github.com/genepattern/NMFClustering/blob/develop/LICENSE)

## Version Comments

| Version | Release Date | Description                                 |
----------|--------------|---------------------------------------------|
| 1 | December 7, 2021 | Initial version for team use. |
