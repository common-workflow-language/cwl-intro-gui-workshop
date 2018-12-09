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
      velveth:
        version: [ "1.2.10" ]
        specs: []

inputs:
  left_reads:
    type: File
    label: left short reads of a pair
    inputBinding: 
      position: 5

  right_reads:
    type: File
    label: right short reads of a pair
    inputBinding: 
      position: 6

# sample data: https://metavelvet.dna.bio.keio.ac.jp/data/HMP.small.tar.gz

baseCommand: velveth

arguments:
  - valueFrom: output_files  # directory name for output files
    position: 1
  - valueFrom: "51"  # hash_length
    position: 2
  - valueFrom: -fasta
    position: 3
  - valueFrom: -shortPaired
    position: 4

outputs:
  hashtable:
    type: Directory
    label: ???
    doc: ???
    # if this was File, then we could also say "format: ..."
    outputBinding:
      glob: output_files

# 	directory/Roadmaps
#	directory/Sequences
# [Both files are picked up by graph, so please leave them there]















