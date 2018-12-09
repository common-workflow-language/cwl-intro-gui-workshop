#!/usr/bin/env cwl-runner
cwlVersion: v1.0
# Type of definition
#   CommandLineTool
#   Workflow
#   ExpressionTool
class:  CommandLineTool
label: <NAME OF TOOL , e.g. Word Count>

# execution hints
#hints:
#  - class: <e.g. DockerRequirement>
#    dockerPull: <dockerImageId>

baseCommand: <CommandLineTool to be executed , e.g wc>

# constant or derived command line options
arguments:
  - prefix: <TOOL COMMAND LINE OPTION>
    position: <EXPLICT POSITION IN ARGUMENT LIST ON THE COMMAND LINE>
    valueFrom: <STRING OR EXPRESSION>
#  - prefix:  <TOOL COMMAND LINE OPTION>
#    valueFrom: |
#    ${
#      JAVASCRIPT
#    }

#
inputs:
  <NAME OF INPUT PARAMETER 1>:
    type: <boolean|int|long|float|double|string|File|Directory> <e.g. boolean>
    inputBinding:
      position: <POSITOIN e.g. 1 , optional>
      prefix:  <TOOL COMMAND LINE OPTION, e.g. -l>
  <NAME OF INPUT PARAMETER 2>:
    type:  <boolean|int|long|float|double|string|File|Directory>
    default: <string or number>
    inputBinding:
      prefix:

outputs:
  <NAME FOR CAPTURED OUTPUT FROM TOOL>:
    type: File[]
    outputBinding:
      glob: <e.g. "*.txt">
  <NAME FOR CAPTURED OUTPUT FROM TOOL>:
    type: File
    outputBinding:
      glob: <e.g. "log.txt">
