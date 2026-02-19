Instance: SNOMEDLOINCtoSNOMEDUK
InstanceOf: ConceptMap
Title: "SNOMED LOINC edition to SNOMED UK edition"
Description: """
For demonstration purposes only - THIS HAS NOT BEEN VALIDATED

For Implementation Guide see [SNOMED CT Implementation Guide for the LOINC Ontology](https://confluence.ihtsdotools.org/display/DOCLOINCSIG/1.+Introduction)
"""
Usage:  #definition

* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/SNOMEDLOINCtoSNOMEDUK"
* version = "0.0.1"
* status = #draft

* sourceCanonical = "http://snomed.info/sct/11010000107?fhir_vs"
* targetCanonical = "http://snomed.info/sct/83821000000107?fhir_vs"

* group.source = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/11010000107"
* group.target = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/83821000000107"

* group.element[+]
  * code = #612991010000106
  * target[+]
    * code = #1022471000000107
    * equivalence = #relatedto

* group.element[+]
  * code = #613061010000108
  * target[+]
    * code = #1022491000000106
    * equivalence = #relatedto
  * target[+]
    * code = #1491000237105
    * equivalence = #relatedto

