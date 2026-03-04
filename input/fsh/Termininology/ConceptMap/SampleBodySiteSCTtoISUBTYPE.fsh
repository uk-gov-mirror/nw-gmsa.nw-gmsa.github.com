Instance: SampleBodySiteSCTtoISUBTYPE
InstanceOf: ConceptMap
Title: "Sample Body Site (SNOMED) to iGene Specimen Sub Type"
Description: """
Sample Body Site (SNOMED) to iGene Specimen Sub Type
"""
Usage:  #definition

* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/SampleBodySiteSCTtoISUBTYPE"
* version = "0.0.1"
* status = #draft

//* sourceCanonical = "https://fhir.nwgenomics.nhs.uk/ValueSet/specimen-type"

* group.source = "http://snomed.info/sct"
* group.sourceVersion = "http://snomed.info/sct/83821000000107"
* group.target = "https://fhir.nwgenomics.nhs.uk/CodeSystem/ISUBTYPE"

* group.element[+]
  * code = #119297000 "Blood specimen"
  * target[+]
    * code = #"Lung"
    * equivalence = #equivalent
