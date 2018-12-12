#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow


inputs:
  my_reference_genome:
    type: File
    secondaryFiles:
     - .fai
    format: edam:format_1929  # we need a IRI/URI for FASTA format

  my_genomic_varients:
    type: File
    secondaryFiles:
     - .tbi
    format: edam:format_3016  # VCF

steps:
  construct_graph:
    run: vg_construct.cwl
    in:
      reference_genome: my_reference_genome
      genomic_varients: my_genomic_varients
    out: [genome_graph]
  
  generate_layout:
    run: vg_view.cwl
    in:
      genome_graph: construct_graph/genome_graph
    out: [graph]

outputs:
  my_graph: 
    type: File
    format: iana:text/vnd.graphviz 
    outputSource: generate_layout/graph

$namespaces:
  iana: https://www.iana.org/assignments/media-types/
  edam: http://edamontology.org/
