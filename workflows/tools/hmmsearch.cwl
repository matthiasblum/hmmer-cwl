cwlVersion: v1.0
class: CommandLineTool
doc: search profile(s) against a sequence database
hints:
    DockerRequirement:
        dockerPull: comics/hmmer:latest
baseCommand: hmmsearch

stdout: $(inputs.output)
inputs:
    hmmfile:
        type: File
        inputBinding:
            position: 1
    seqdb:
        type: File
        inputBinding:
            position: 2
outputs:
    output:
        type: stdout
