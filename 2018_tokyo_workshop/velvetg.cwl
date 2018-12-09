#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool  # other options: Workflow or ExpressionTool

hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/metavelvet:1.2.02--pl5.22.0_2
    # Biocontainers require a tag, there is no "latest"
    # See https://quay.io/repository/biocontainers/metavelvet?tab=tags
  SoftwareRequirement:
    packages:
      velvetg:
        version: [ "1.2.10" ]
        specs: []

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.hashtable)
        writable: true

inputs:
  hashtable:
    type: Directory
    inputBinding:
      position: 1

baseCommand: velvetg

arguments:
  - prefix: -exp_cov
    valueFrom: auto
    position: 2
  - prefix: -ins_length
    valueFrom: "260"
    position: 3

outputs:
  graph:
    type: Directory
    outputBinding:
      glob: $(inputs.hashtable.basename)














