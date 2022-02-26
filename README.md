# Subcell
### Bash script to filter cluster-specific reads from scRNA-seq data.
---------
version: 0.5

contact: <ricardo.santos@nms.unl.pt>

## Index
1. [Introduction](#Intro)
2. [Installation](#Installation)
3. [Usage](#Usage)
4. [Issues](#Issues)


## Intro
This bash script was developed to extract cluster-specific reads from single-cell RNA sequencing data. These might be cell-type, subcell-type, or any other cell cluster in Seurat objects. In our case, cell barcodes were extracted using the WhichCells() function of Seurat package ([satijalab.org/seurat](https://satijalab.org/seurat)).

This program relies on two pieces of software previously developed for manipulating fastq reads with great performances. Namely, **fqtools** ([github.com/alastair-droop/fqtools](https://github.com/alastair-droop/fqtools)) and the `filterbyname.sh` script from the **bbmap** suite ([sourceforge.net/projects/bbmap](https://sourceforge.net/projects/bbmap)) .


## Installation
Running the script requires Anaconda (or Miniconda) to be installed. If you haven't already, download ([here](https://www.anaconda.com/products/individual)) and install it.
Then run the following snippet on your terminal:
```console
#!/usr/bin/env bash
git clone https://github.com/homemlab/subcell.git
cd subcell/
bash install.sh
```
## Usage
The script will take positional arguments (no flags). The first argument is a file containing the cell barcodes. In this case it is optimized for the following removing prefixes ending with `_` and sufixes starting with `-` as in the following 16bp barcode example:
`sample1_AACCTGCAAGGACTG-1` .

To use `subcell` simply run in your terminal:

```console
bash subcell cell.barcodes folder_fastq/
```
Positional arguments of subcell
1. `cell.barcodes` - is the file containing barcodes of interest
2. `folder_fastq/` - is the path to the folder containing the fastq.gz files (files have to be compressed, it saves space)

The program will write the resulting cell.fastq.gz in the same input directory folder_fastq/

## Issues
Please open an issue or contact <ricardo.santos@nms.unl.pt>
