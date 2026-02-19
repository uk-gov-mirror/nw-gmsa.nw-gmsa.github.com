Instance: SampleSCTtoIGENE
InstanceOf: ConceptMap
Title: "Sample Type (SNOMED) to iGene"
Description: """
Sample Type (SNOMED) to iGene
"""
Usage:  #definition

* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/SampleSCTtoIGENE"
* version = "0.0.1"
* status = #draft

* sourceCanonical = "https://fhir.nwgenomics.nhs.uk/ValueSet/specimen-type"

* group.source = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/83821000000107"
* group.target = "https://fhir.nwgenomics.nhs.uk/CodeSystem/IGENE"

* group.element[+]
  * code = #119297000
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent



