cwlVersion: v1.0
class: CommandLineTool
doc: profile HMM construction from multiple sequence alignments
hints:
    DockerRequirement:
        dockerPull: comics/hmmer:latest
baseCommand: hmmbuild

inputs:
    hmmfile_out:
        type: string
        inputBinding:
            position: 1
    msafile:
        type: File
        inputBinding:
            position: 2
    cpu:
        type: int?
        inputBinding:
            position: 0
            prefix: --cpu
    hand:
        type: boolean?
        inputBinding:
            position: 0
            prefix: --hand
outputs:
      output:
        type: File
        outputBinding:
            glob: $(inputs.hmmfile_out)
