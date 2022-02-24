# Subcell
### Bash script for extracting cell-type specific fastq reads using cell barcodes.
### version: 0.4
### contact: <ricardo.santos@nms.unl.pt>
-----------
## Intro
This bash script was developed to extract cluster-specific reads from single-cell RNA sequencing data. These might be cell-type, subcell-type, or any other clustered cells in Seurat objects. In our case, cell barcodes were extracted using the WhichCells() function of Seurat package ([satijalab.org/seurat](https://link)).

This program relies on two pieces of software previously developed for manipulating fastq reads with great performances. Namely, fqtools ([github.com/alastair-droop/fqtools](https://link)) and the `filterbyname.sh` script from the bbmap suite ([sourceforge.net/projects/bbmap](https://link)) .


## Installation
Running the script requires Anaconda (or Miniconda) to be installed. If you run the following snippet everything should go fine:
```console
$ git clone https://github.com/homemlab/subcell.git
$ cd subcell/
$ conda env create -f env.yaml
$ conda activate subcell
```
## Usage
The script will take positional arguments (no flags). The first argument is a file containing the cell barcodes. In this case it is optimized for the following removing prefixes ending with `_` and sufixes starting with `-` as in the following 16bp barcode example:
`sample1_AACCTGCAAGGACTG-1` .

```console
$ bash subcell cell.barcodes folder_fastq/
```
Positional arguments of subcell
1. cell.barcodes - is the file containing all your barcodes of interest
2. folder_fastq/ - is the path to the folder containing the fastq.gz files (files have to be compressed, it saves space)

The program will write the resulting cell.fastq.gz in the same input folder_fastq/

## Issues
Please contact <ricardo.santos@nms.unl.pt>