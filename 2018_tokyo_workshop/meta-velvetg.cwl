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
      meta-velvetg:
        version: [ "1.2.02" ]
        specs: []

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.graph)
        writable: true

inputs:
  graph:
    type: Directory
    inputBinding:
      position: 1

baseCommand: meta-velvetg

outputs:
  contigs:
    type: File
    format: edam:format_1929  # FASTA
    outputBinding:
      glob: $(inputs.graph.basename)/meta-velvetg.contigs.fa 

$namespaces:
  edam: http://edamontology.org/

# Output: -----------------------------------------------
#	directory/meta-velvetg.contigs.fa       	: fasta file of contigs longer than twice hash length
#	directory/meta-velvetg.LastGraph        	: special formatted file with all the information on the final graph
#	directory/meta-velvetg.Graph2-stats.txt 	: stats file (tab-delimited) useful for optimizing coverage peak values
#	directory/meta-velvetg.split-stats.txt  	: stats file (tab-delimited) useful for optimizing graph-splitting parameters



