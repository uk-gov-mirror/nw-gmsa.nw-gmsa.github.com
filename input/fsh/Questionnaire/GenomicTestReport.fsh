Instance: GenomicTestReport
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Report"
Description: """
The aim of this is to support conversion of Genomic Report (HL7 v2 ORU) for use by several NHS Trusts (as HL7 v2 or FHIR).
"""
Usage:  #definition

* title = "North West Genomics Test Report"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/81247-9"
* code[+] = $loinc#81247-9

* item[+]
  * type = #group
  * linkId = "/81306-3"
  * code = $loinc#81306-3 "Overall study variables type"
  * text = "Overall study variables type"
  * item[+]
    * linkId = "/81306-3/51969-4"
    * code = $loinc#51969-4 "Genetic analysis report"
    * text = "Gene analysis narr rpt Doc"
    * type = #string
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm"
  * item[+]
    * linkId = "/81306-3/51967-8"
    * code = $loinc#51967-8 "Genetic disease assessed [ID]"
    * text = "Gene dis assessed"
    * type = #choice
    * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"

* item[+]
  * type = #group
  * code = $loinc#81250-3 "Simple var pnl"
  * linkId = "/81250-3"
  * text = "Simple var pnl"
  * item[+]
    * linkId = "/81306-3/TESTOUTCOME"
    * code = $nwgmsa#TESTOUTCOME "NHS England Genomics Test Outcome"
    * text = "NHS England Genomics Test Outcome"
    * type = #choice
    * answerValueSet = Canonical(GenomicTestOutcomeCodes)
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
