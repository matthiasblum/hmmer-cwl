cwlVersion: v1.0
class: Workflow

inputs:
    sto_urls: string[]
    uni_url: string
outputs:
    sto_files:
        type: File[]
        outputSource: download_sto/output
    fasta_file:
        type: File
        outputSource: extract/output

requirements:
    - class: ScatterFeatureRequirement
    - class: StepInputExpressionRequirement
    - class: InlineJavascriptRequirement

steps:
    download_sto:
        run: tools/wget.cwl
        in:
            url: sto_urls
        out: [output]
        scatter: url
    download_uni:
        run: tools/wget.cwl
        in:
            url: uni_url
        out: [output]
    extract:
        run: tools/gzip.cwl
        in:
            file: download_uni/output
            decompress:
                valueFrom: ${ return true; }
        out: [output]
