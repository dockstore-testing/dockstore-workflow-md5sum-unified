cwlVersion: v1.0
class: Workflow

s:author:
  - class: s:Person
    s:identifier: http://orcid.org/0000-0002-7681-6415
    s:email: mailto:briandoconnor@gmail.com
    s:name: Brian O'Connor

s:contributor:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-6130-1021
    s:email: mailto:dyuen@oicr.on.ca
    s:name: Denis Yuen

inputs:
  input_file: File

outputs:
  workflow_output_file:
    type: File
    outputSource: checker/results_file

steps:
  md5sum:
    run: md5sum/dockstore-tool-md5sum.cwl
    in:
      input_file: input_file
    out: [output_file]
  checker:
    run: checker/md5sum_checker.cwl
    in: 
      input_file: md5sum/output_file
    out: [results_file]

doc: | 
  This demonstrates how to wrap a "real" tool with a checker workflow that runs both the tool and a tool that performs verification of results

$namespaces:
 s: https://schema.org/
 edam: http://edamontology.org/

$schemas:
 - https://schema.org/version/latest/schemaorg-current-http.rdf
 - http://edamontology.org/EDAM_1.18.owl
