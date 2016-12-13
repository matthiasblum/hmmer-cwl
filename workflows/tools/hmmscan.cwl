cwlVersion: v1.0
class: CommandLineTool
doc: search sequence(s) against a profile database
hints:
    DockerRequirement:
        dockerPull: comics/hmmer:latest
baseCommand: hmmscan

requirements:
    InitialWorkDirRequirement:
        listing:
            - $(inputs.hmmdb)
            - $(inputs.h3m)
            - $(inputs.h3i)
            - $(inputs.h3f)
            - $(inputs.h3p)

stdout: $(inputs.output)
inputs:
    hmmdb:
        type: File
        inputBinding:
            position: 1
            valueFrom: $(self.basename)
    h3m:
        type: File
    h3i:
        type: File
    h3f:
        type: File
    h3p:
        type: File
    seqfile:
        type: File
        inputBinding:
            position: 2
    cpu:
        type: int?
        inputBinding:
            position: 0
            prefix: --cpu
outputs:
    output:
        type: stdout
