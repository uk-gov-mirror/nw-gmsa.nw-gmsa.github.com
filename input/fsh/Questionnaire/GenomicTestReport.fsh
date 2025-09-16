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
  * type = "group"
  * linkId = "/81306-3"
  * code = $loinc#81306-3 "Overall study variables type"
  * text = "Overall study variables type"
  * item[+]
    * linkId = "/81306-3/51969-4"
    * text = "Gene analysis narr rpt Doc"
    * type = #string
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm"
