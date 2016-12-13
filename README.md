# hmmer-cwl

This repository contains a few [Common Workflow Language](http://www.commonwl.org) (CWL) tool and workflow descriptions for [HMMER](http://hmmer.org). The workflows follow the examples presented in the turorial section of [HMMER user guide](http://eddylab.org/software/hmmer3/3.1b2/Userguide.pdf).

## Install
### Prerequisites
  - an implementation of the Common Workflow Language. Because the workflows presented here use the v1.0 CWL specifications, some features are not yet supported by most implementations. We recommend to use [the reference implentation](https://github.com/common-workflow-language/cwltool).
  - [Docker](https://www.docker.com/) as we run tools in Docker images.

### Get the code

Grab the latest version of the documents:

    git clone https://github.com/matthiasblum/hmmer-cwl.git

### Get the data
Four input files are required to run the workflows. Three files are from the [HMMER turorial](https://github.com/EddyRivasLab/hmmer/tree/master/tutorial):
  - fn3.sto: an example alignment of 106 fibronectin type III domains.
  - globins4.sto: an example alignment of four globin sequences.
  - Pkinase.sto: the Pfam 22.0 Pkinase seed alignment of protein kinase domains.

And the last one is the [UniProt](http://uniprot.org/) Swiss-Prot FASTA format flatfile.

To download these files, run the `setup` workflow:

    cd hmmer-cwl
    cwl-runner workflows/setup.cwl setup.yml

## Workflows

### Searching a protein sequence database with a single protein profile HMM
This 2-step workflow builds a profile HMM from a multiple-sequence alignment, and searchs a sequence database with the generated model.

    cwl-runner workflows/search.cwl search.yml

### Searching a profile HMM database with a query sequence
This 4-step workflow builds HMM profiles from several multiple-sequence alignments, merge the models to create an HMM database flatfile, index this database then search it.

    cwl-runner workflows/scan.cwl scan.yml

## Todo
- [ ] Explain workflows' output parameters
- [ ] Explain input paramaters contained in YAML job files
- [ ] Add other examples from tutorial
- [ ] Add "real world" workflow
- [ ] Support all options (input parameters)
