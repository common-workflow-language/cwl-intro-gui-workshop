cwlVersion: v1.0
class: Workflow

# optional - additional requirements to execute this workflow
#requirements:
#  - class: InlineJavascriptRequirement

# required, workflow input mapping
inputs: <LIST OF INPUT OPTIONS AND MAPPING TO TOOLs/STEPs LINE>


# output mapping
outputs: <LIST OF NAMED OUTPUTS AND MAPPING \
          FROM TOOL OUTPUT TO WORKFLOW OUTPUT>


steps: <LIST OF WORKFLOW STEPS>

  <STEP NAME>:
    label: <TEXT>
    doc:  <TEXT>
    # required - cwl tool description
    run: <PATH TO CWL TOOL FILE>
    # required - step inputs
    in: <MAPPING OF TOOL INPUT OPTIONS TO WORKFLOW INPUT OR STEP OUTPUT>
    # required , step outputs
    out: <LIST OF TOOL OUTPUTs>
