#!/usr/env/bin cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Represent a genome graph in graphviz .dot format

hints:
  DockerRequirement:
    dockerPull: quay.io/vgteam/vg:dev-v1.12.1-51-g28ef4e32-t258-run
  SoftwareRequirement:
    packages:
      vg:
        version: ["1.12.1"]
        specs: [ https://doi.org/10.1038/nbt.4227 ]

inputs:
  genome_graph:
    type: File
    label: VG format

stdin: $(inputs.genome_graph.nameroot)

baseCommand: [ vg, view ]

arguments:
  - --dot
  - --show-paths

stdout: $(inputs.genome_graph.nameroot).dot

outputs:
  graph:
    type: File
    outputBinding:
      glob: $(inputs.genome_graph.nameroot).dot
    format: iana:text/vnd.graphviz 
      
$namespaces:
  iana: https://www.iana.org/assignments/media-types/
