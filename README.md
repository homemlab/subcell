![subcell](https://github.com/homemlab/subcell/blob/main/.static/subcell.png?raw=true)
# Subcell

Bash script to filter cluster-specific reads from scRNA-seq data.
- version: 0.5.3
- contact: <ricardo.santos@nms.unl.pt>

## Index
1. [Introduction](#Intro)
2. [Installation](#Installation)
    - [Docker image](#Docker-image)
    - [Anaconda environment](#Anaconda-environment)
3. [Usage](#Usage)
    - [Docker](#Docker)
    - [Anaconda](#Anaconda)
4. [Issues](#Issues)


## Intro
This bash script was developed to extract cluster-specific reads from single-cell RNA sequencing data. These might be cell-type, subcell-type, or any other cell cluster in Seurat objects. In our case, cell barcodes were extracted using the `WhichCells()` function of Seurat package ([satijalab.org/seurat](https://satijalab.org/seurat)).

This program relies on two pieces of software previously developed for manipulating fastq reads with great performances. Namely, **fqtools** ([github.com/alastair-droop/fqtools](https://github.com/alastair-droop/fqtools)) and the `filterbyname.sh` script from the **bbmap** suite ([sourceforge.net/projects/bbmap](https://sourceforge.net/projects/bbmap)) .


## Installation
### Docker image
Get your latest `subcell` image with:
```bash
docker pull rfcdsantos/subcell:latest
```

Note: To run subcell from a container be sure to map a volume (docker -v flag) with the required cell.barcodes and fastq.gz files e.g.: `-v ${PWD}:/data` - if files are in current working directory).

### Anaconda environment
Running the script requires Anaconda (or Miniconda) to be installed.
The `install.sh` script will install the latest *Miniconda-latest-Linux-x86_64* release for you. In case you need a different version get it [here](https://www.anaconda.com/products/individual).
Then run the following snippet on your terminal:
```bash
#!/usr/bin/env bash
git clone https://github.com/homemlab/subcell.git
cd subcell/
bash install.sh
```

## Usage
The script will take positional arguments (no flags). The first argument is a file containing the cell barcodes. it is optimized for removing prefixes ending with `_` and sufixes starting with `-` as in the following 16bp barcode example:
`sample1_AACCTGCAAGGACTG-1` .

Positional arguments of subcell
1. `cell.barcodes` - is the file containing barcodes of interest
2. `folder_fastq/` - is the path to the folder containing the fastq.gz files (files have to be compressed, it saves space).

The program will write the resulting `cell.fastq.gz` in the same input directory `folder_fastq/`

### Docker
To use the latest `subcell` Docker image simply use run:
```bash
docker run --rm -v ${PWD}:/data rfcdsantos/subcell bash subcell /data/cell.barcodes /data/folder_fastq/
```

### Anaconda
To use a local Anaconda environemtn, run directly from the subcell folder:

```bash
bash subcell cell.barcodes folder_fastq/
```
## Issues
Please open a github issue or contact <ricardo.santos@nms.unl.pt>
