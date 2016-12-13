cwlVersion: v1.0
class: CommandLineTool
doc: down
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
