cwlVersion: v1.0
class: CommandLineTool
doc: concat multiple files using GNU cat
baseCommand: cat

stdout: $(inputs.output)
inputs:
    files:
        type: File[]
        inputBinding:
            position: 1
    output:
        type: string
outputs:
    output:
        type: stdout
