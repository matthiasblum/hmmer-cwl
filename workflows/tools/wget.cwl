cwlVersion: v1.0
class: CommandLineTool
doc: download files with wget
hints:
    DockerRequirement:
        dockerPull: debian:latest
baseCommand: [wget, --quiet]

requirements:
  - class: InlineJavascriptRequirement

inputs:
    url:
        type: string
        inputBinding:
            position: 1
outputs:
    output:
        type: File
        outputBinding:
            glob: $(inputs.url.split('/').slice(-1)[0])
