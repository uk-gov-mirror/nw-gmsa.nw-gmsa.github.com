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
  * linkId = "/Metadata"
  * text = "Metadata"
  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"

  // Patient	Patient/proband hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number)"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * code[+] = $loinc#56797-4
    * text = "Account Number (Episode or Stay Number)"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "LN/56797-4-designNote"
      * type = #display
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help


* item[+]
  * type = #group
  * linkId = "/81306-3"
  * code = $loinc#81306-3 "Overall study variables type"
  * text = "Overall study variables type (Test Details)"
  * item[+]
    * type = #string
    * linkId = "LN/106194-4"
    * code[+] = $loinc#106194-4
    * text = "Test request ID/Order ID/Order Placer Number"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderPlacerNumber"
    * required = false
  * item[+]
    * type = #string
    * linkId = "LN/106183-7"
    * code[+] = $loinc#106183-7
    * text = "Order Filler Number"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderFillerNumber"
    * required = false
  * item[+]
    * type = #string
    * linkId = "HL7/OBR-3"
    * text = "Report Number"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport#DiagnosticReport.identifier:ReportNumber"
    * required = true
  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code / Ordering Facility"
  * item[+]
    * type = #group
    * linkId = "Specimen"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen"
    * text = "Specimen/Biopsy"
    * item[+]
      * type = #string
      * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
      * linkId = "LN/80398-1"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.identifier"
      * text = "Specimen ID Number"
    * item[+]
      * type = #string
      * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
      * linkId = "Specimen/accessionIdentifier"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.accessionIdentifier"
      * text = "Lab DNA Number (If Known)"

  * item[+]
    * linkId = "/81306-3/51967-8"
    * code = $loinc#51967-8 "Genetic disease assessed [ID]"
    * text = "Gene dis assessed"
    * type = #choice
    * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-r"
    * code[+] = $loinc#29300-1
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code"
    * required = false
* item[+]
  * type = #group
  * linkId = "/Results"
  * text = "Results"
  * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport#DiagnosticReport.result"
  * item[+]
    * linkId = "/81306-3/51969-4"
    * code = $loinc#51969-4 "Genetic analysis report"
    * text = "Gene analysis narr rpt Doc"
    * type = #string
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm"
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
