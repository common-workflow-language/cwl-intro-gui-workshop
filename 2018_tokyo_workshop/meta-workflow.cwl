#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  my_left_reads:
    type: File
    format: edam:format_1929  # FASTA
  my_right_reads:
    type: File
    format: edam:format_1929  # FASTA

steps:
  hashing:
    run: velveth.cwl
    in:
      left_reads: my_left_reads
      right_reads: my_right_reads
    out: [ hashtable ]

  graphing:
    run: velvetg.cwl
    in:
      hashtable: hashing/hashtable
    out: [ graph ]

  assembling:
    run: meta-velvetg.cwl
    in:
      graph: graphing/graph
    out:
     - contigs  # same as writing "out: [ contigs ]"

outputs:
  contigs:
    type: File
    outputSource: assembling/contigs
    format: edam:format_1929  # FASTA

$namespaces:
  edam: http://edamontology.org/

# $something is a pre-processing directive to the CWL parser
# other directives:
# $schema
# $graph
# $include
# $import
