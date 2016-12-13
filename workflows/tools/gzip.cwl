cwlVersion: v1.0
class: CommandLineTool
doc: (de)compress files with gzip
hints:
    DockerRequirement:
        dockerPull: alpine
baseCommand: [gzip, -c]

requirements:
  - class: InlineJavascriptRequirement

stdout: $(inputs.file.basename.split('.').slice(0, -1).join('.'))
inputs:
    file:
        type: File
        inputBinding:
            position: 1
    decompress:
        type: boolean?
        inputBinding:
            position: 0
            prefix: -d
outputs:
    output:
        type: stdout
