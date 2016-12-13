cwlVersion: v1.0
class: Workflow
doc: Searching a profile HMM database with a query sequence

inputs:
    build_msa: File[]
    build_hmm: string[]
    build_cpu: int
    build_hand: boolean
    merge_hmm: string
    scan_seq: File
    scan_out: string
    scan_cpu: int
outputs:
    scan_out:
        type: File
        outputSource: scan/output

requirements:
    - class: ScatterFeatureRequirement

steps:
    build:
        run: tools/hmmbuild.cwl
        in:
            hmmfile_out: build_hmm
            msafile: build_msa
            cpu: build_cpu
            hand: build_hand
        out: [output]
        scatter: [hmmfile_out, msafile]
        scatterMethod: dotproduct
    merge:
        run: tools/cat.cwl
        in:
            files: build/output
            output: merge_hmm
        out: [output]
    press:
        run: tools/hmmpress.cwl
        in:
            hmmfile: merge/output
        out: [h3m, h3i, h3f, h3p]
    scan:
        run: tools/hmmscan.cwl
        in:
            hmmdb: merge/output
            h3m: press/h3m
            h3i: press/h3i
            h3f: press/h3f
            h3p: press/h3p
            seqfile: scan_seq
            cpu: scan_cpu
            output: scan_out
        out: [output]
