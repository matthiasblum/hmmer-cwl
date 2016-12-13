cwlVersion: v1.0
class: Workflow
doc: Searching a protein sequence database with a single protein profile HMM

inputs:
    build_msa: File
    build_hmm: string
    build_cpu: int
    build_hand: boolean
    search_db: File
    search_out: string
outputs:
    search_output:
        type: File
        outputSource: search/output

steps:
    build:
        run: tools/hmmbuild.cwl
        in:
            hmmfile_out: build_hmm
            msafile: build_msa
            cpu: build_cpu
            hand: build_hand
        out: [output]

    search:
        run: tools/hmmsearch.cwl
        in:
            hmmfile: build/output
            seqdb: search_db
            output: search_out
        out: [output]
