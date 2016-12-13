cwlVersion: v1.0
class: CommandLineTool
doc: prepare an HMM database for faster hmmscan searches
hints:
    DockerRequirement:
        dockerPull: comics/hmmer:latest
baseCommand: hmmpress

requirements:
    InitialWorkDirRequirement:
        listing:
            - $(inputs.hmmfile)

inputs:
    hmmfile:
        type: File
        inputBinding:
            position: 1
            valueFrom: $(self.basename)
outputs:
    h3m:
        type: File
        outputBinding:
            glob: "*.h3m"
    h3i:
        type: File
        outputBinding:
            glob: "*.h3i"
    h3f:
        type: File
        outputBinding:
            glob: "*.h3f"
    h3p:
        type: File
        outputBinding:
            glob: "*.h3p"
