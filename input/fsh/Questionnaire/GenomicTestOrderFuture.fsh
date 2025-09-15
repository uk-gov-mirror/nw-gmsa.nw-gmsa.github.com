Instance: GenomicTestOrderFuture
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Order Future"
Description: """
THIS IS FOR ANALYSIS, and is not to be used for implementation at present.

The aim of this is to support conversion of multiple Genomic Order Forms HL7 v2 and FHIR.
"""
Usage:  #definition

* title = "North West Genomics Test Order"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrderFuture"

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient"

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"
  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #date
    * linkId = "LN/81954-0"
    * code[+] = $loinc#81954-0
    * required = false
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"
  * item[+]
    * type = #group
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-1"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-3"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.address.city"
      * text = "City"
    * item[+]
      * type = #string
      * linkId = "LN/45401-7"
      * code[+] = $loinc#45401-7
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnic Category"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * answerValueSet = Canonical(Ethnicity)
  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"
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
    * type = #decimal
    * linkId = "ageAtCollection"
    * text = "Age at collection"
  * item[+]
    * type = #string
    * linkId = "location"
    * text = "Location"
  * item[+]
    * type = #choice
    * linkId = "HL7/PD1-3"
    * text = "GP Surgery (ODS Code)"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Patient#Patient.generalPractitioner"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Healthcare Professional"
  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * required = true
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"
    * text = "Referring Clinician Name"
  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
    * text = "Referring Clinician Current Speciality"
    * required = true
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
  * item[+]
    * type = #string
    * linkId = "LN/46608-6"
    * code[+] = $loinc#46608-6
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
    * text = "Referring Clinician Professional Identifier"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Email"
  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Phone"
  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code"


* item[+]
  * type = #group
  * linkId = "TestRequest"
  * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"
  * item[+]
    * type = #choice
    * linkId = "SNM/15220000"
    * code[+] = $sct#15220000 "Laboratory test"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.category"
    * text = "Test Category"
    * answerValueSet = Canonical(OrderCategory)
 //   * answerOption[+].valueCoding = $nwgmsa#RareAndInheritedDiseasesGeneticTesting "Rare and inherited diseases Genetic Testing (procedure)"
 //   * answerOption[+].valueCoding = $sct#1186936003 "Storage of specimen (procedure)"
 //   * answerOption[+].valueCoding = $nwgmsa#PreNatalGeneticTesting "Pre Natal Genetic Testing (procedure)"
 //   * answerOption[+].valueCoding = $nwgmsa#HaemoglobinopathyGeneticTesting "Haemoglobinopathy Genetic Testing (procedure)"
 //   * answerOption[+].valueCoding = $nwgmsa#CancerGeneticTesting "Cancer Genetic Testing (procedure)"
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-r"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#RareAndInheritedDiseasesGeneticTesting
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Rare and inherited diseases)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-h"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#HaemoglobinopathyGeneticTesting
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Haemoglobinopathy)"
    * required = true
    * repeats = true
    * answerOption[+].valueCoding = $GTD#R361.1 "Sickle cell, thalassaemia and other haemoglobinopathies trait or carrier testing"
    * answerOption[+].valueCoding = $GTD#R361.2 "Sickle cell, thalassaemia and other haemoglobinopathies trait or carrier testing"
    * answerOption[+].valueCoding = $GTD#R372.1 "Newborn screening for sickle cell disease in a transfused baby"
    * answerOption[+].valueCoding = $GTD#R93.1 "Sickle cell, thalassaemia and other haemoglobinopathies"
    * answerOption[+].valueCoding = $GTD#R93.2 "Sickle cell, thalassaemia and other haemoglobinopathies"

  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-c"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#CancerGeneticTesting
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Cancer)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicCancer)
  * item[+]
    * type = #string
    * linkId = "pedigreeNumber"
    * text = "G Number (Pedigree Number) - Order Group Number"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.requisition"
  * item[+]
    * type = #string
    * linkId = "LN/106194-4"
    * code[+] = $loinc#106194-4
    * text = "Test request ID/Order ID"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.identifier:placerOrderNumber"
    * required = false
  * item[+]
    * type = #choice
    * linkId = "LN/82768-3"
    * code[+] = $loinc#82768-3
    * text = "Priority"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.priority"
    * required = false
    * answerValueSet = Canonical(RequestPriority)

  * item[+]
    * type = #group
    * linkId = "Consent"
    * text = "Consent"
    * item[+]
      * type = #choice
      * linkId = "LN/19826-7"
      * code[+] = $sct#309370004 "Consent status"
      * code[+] = $loinc#19826-7 "Informed consent obtained"
      * code[+] = $loinc#59284-0 "Consent Document"
      * text = "Has consent has been obtained for tests (Y/N)"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "LN/75520-7"
      * text = "Has consent has been obtained for DNA storage (Y/N)"
      * code[+] = $loinc#75520-7 "Biobank specimens are stored and available for research"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "consent-3"
      * text = "ROD attached or to follow"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
  * item[+]
    * type = #group
    * linkId = "PatientClinicalInformation"
    * text = "Patient Clinical Information"
    * item[+]
      * type = #choice
      * linkId = "LN/51967-8"
      * code[+] = $loinc#51967-8
      * code[+] = $sct#782964007 "Genetic disease"
      * repeats = true
      * text = "CITT code (Specific disease suspected/reason for testing)"
      * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"
    * item[+]
      * type = #string
      * linkId = "HL7/NTE"
      * text = "Relevant clinical information and family history"
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.note"


* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * linkId = "LN/80398-1"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.identifier.value"
    * text = "Specimen ID Number / Lab DNA Number (If Known)"
    * item[+]
      * linkId = "LN/80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "LN/80398-1-ODS"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.identifier.assigner.identifier.value"
    * text = "Pathology Laboratory Hospital/Trust ID"

  * item[+]
    * type = #dateTime
    * linkId = "LN/33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $loinc#68963-8 "Collection date and time of Specimen"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * text = "Specimen Collection Date"
    * item[+]
      * linkId = "LN/33882-2-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 33882-2 and OBX-2 = TS .
      OML v2.5.1 SPM-17
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerValueSet = Canonical(SpecimenType)
    * text = "Specimen Type"
    * item[+]
      * linkId = "LN/66746-9-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 66746-9 and OBX-2 = CE.
      OML v2.5.1 SPM-4
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * linkId = "SNM/281269004"
    * code[+] = $sct#281269004 "High infection risk sample"
    * text = "High Infection Risk?"
    * type = #choice
    * required = false
    * repeats = false
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * linkId = "LN/74384-9"
    * code[+] = $sct#434711009 "Specimen container"
    * code[+] = $loinc#74384-9
    * text = "Anticoagulant/preservative?"
    * type = #choice
    * required = false
    * repeats = false
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * linkId = "LN/39111-0"
    * code[+] = $loinc#39111-0
    * code[+] = $loinc#31208-2 "Specimen source identified"
    * text = "Tissue source/organ of origin"
    * type = #choice
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.collection.bodySite"
  * item[+]
    * linkId = "LN/3169-0"
    * code[+] = $loinc#3169-0 "Volume of Specimen"
    * code[+] = $loinc#42185-9 "Number of specimens obtained"
    * text = "Specimen Volume/number of slides or scrolls"
    * type = #string
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.collection.quantity"
  * item[+]
    * linkId = "OrderTracking"
    * text = "Audit (Specimen Tracking)"
    * type = #group
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.collection"
    * item[+]
      * linkId = "NOS/xxxx1"
      * text = "Date and time sample received in lab"
      * type = #date
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Specimen#Specimen.receivedTime"
    * item[+]
      * linkId = "NOS/xxxx2"
      * text = "Date and time sample sent"
      * type = #date
    * item[+]
      * linkId = "NOS/xxxx3"
      * text = "Transport used"
      * type = #string
    * item[+]
      * linkId = "LN/97209-1"
      * code[+] = $loinc#97209-1
      * text = "Tracking number"
      * type = #string
    * item[+]
      * linkId = "NOS/xxxx5"
      * text = "Sample sent to"
      * type = #string
    * item[+]
      * linkId = "NOS/xxxx6"
      * text = "Name of person who sent sample"
      * type = #string


* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"
  * item[+]
    * type = #choice
    * code[+] = $sct#842009 "Consanguinity"
    * linkId = "SNM/842009"
    * text = "Patient is from consanguineous union?"
  // * answerValueSet = Canonical(YNU)
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "SNM/74996004-pathology-report"
    * text = "Confirm that a pathology report will be provided alongside the sample."
    * code[+] = $sct#74996004 "Confirmation of"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #string
    * linkId = "SNM/385675009"
    * text = "Reason for variant re-interpretation request"
    * code[+] = $sct#385675009 "Reason for action (attribute)"
    * code[+] = $loinc#53577-3 "Reason for study"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #string
    * linkId = "SNM/119297000"
    * text = "Specimen Source (Blood Restrictions)"
    * code[+] = $sct#119297000 "Blood specimen"
    * code[+] = $loinc#31208-2 "Specimen source identified"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "SNM/782964007"
    * text = "Clinical Indication"
    * code[+] = $sct#782964007 "Genetic disease"
    * code[+] = $loinc#51967-8 "Genetic disease assessed [ID]"
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
    * extension[preferredTerminologyServer].valueUrl = "https://snowstorm.ihtsdotools.org/fhir"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerValueSet = "http://snomed.info/sct/900000000000207008?fhir_vs=ecl/<782964007"
  * item[+]
    * type = #string
    * linkId = "SNM/78989007"
    * text = "Please enter the trisomy screening risk (including the chromosome of interest if appropriate)."
    * code[+] = $sct#78989007 "Trisomy"
    * code[+] = $loinc#75560-3 "Fetal Trisomy 21 prior risk [Likelihood] Based on maternal age"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "SNM/782902008"
    * text = "Transplant?"
    * code[+] = $sct#782902008 "Implantation procedure"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "SNM/5447007"
      * code[+] = $sct#5447007 "Transfusion"
      * text = "Transplant Type"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
      * extension[preferredTerminologyServer].valueUrl = "https://snowstorm.ihtsdotools.org/fhir"
      * answerValueSet = "http://snomed.info/sct/900000000000207008?fhir_vs=ecl/<737294004"
      * enableWhen[+]
        * question = "SNM/782902008"
        * operator = #=
        * answerCoding = $loinc#LA33-6

  * item[+]
    * type = #choice
    * linkId = "LN/21908-9"
    * code[+] = $loinc#21908-9 "Stage group.clinical Cancer"
    * text = "Advanced Lung Cancer Stage"
    * answerValueSet = "http://snomed.info/sct/900000000000207008?fhir_vs=ecl/<1222594003"
    * extension[preferredTerminologyServer].valueUrl = "https://snowstorm.ihtsdotools.org/fhir"
  * item[+]
    * type = #choice
    * linkId = "SNM/74996004"
    * text = "Extra Testing Form Completed?"
    * code[+] = $sct#74996004 "Confirmation of"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "SNM/74996004-designNote"
      * type = #display
      * text = "Please Note That An Additional Test Order Form 'Whole Genome Sequencing Rare Disease Order Form (Link at Top of Form)' is Required To Activate Testing. If This is Not Received, The DNA Will Be Extracted and Stored"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #choice
    * linkId = "SNM/77386006"
    * text = "Does this test relate to an ongoing pregnancy?"
    * code[+] = $sct#77386006 "Pregnancy"
   //   * answerValueSet = Canonical(YNU)
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #group
      * linkId = "pregnant"
      * text = "Pregnant"
      * enableWhen[+]
        * question = "SNM/77386006"
        * operator = #=
        * answerCoding = $loinc#LA33-6
      * item[+]
        * type = #string
        * linkId = "SNM/370386005"
        * code[+] = $sct#370386005 "Ultrasound scan - multiple fetus"
        * text = "Does this test relate to a pregnancy with > 1 fetus?"
        * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
        * answerOption[+].valueCoding = $loinc#LA32-8 "No"
        * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"

      * item[+]
        * type = #date
        * linkId = "SNM/161714006"
        * code[+] = $sct#161714006 "Estimated date of delivery"
        * text = "Patient expected delivery date"
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueDateTime"
      * item[+]
        * type = #integer
        * linkId = "SNM/598151000005105"
        * code[+] = $sct#598151000005105 "Gestational age"
        * extension[unit].valueCoding = $ucum#wk "Wk"
        * text = "Patient gestation"
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"
      * item[+]
        * type = #string
        * linkId = "SNM/169222003"
        * code[+] = $sct#169222003 "US obstetric scan abnormal"
        * text = "What were the Abnormal Scan Findings"
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"


* item[+]
  * type = #group
  * linkId = "PriorResults"
  * text = "Prior Results"
  * item[+]
    * type = #group
    * linkId = "HaemoglobinopathyTestResults"
    * text = "Haemoglobinopathy Testing Prior Results"
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#HaemoglobinopathyGeneticTesting
    * item[+]
      * type = #reference
      * linkId = "LN/58410-2"
      * text = "CBC panel - Blood by Automated count"
      * extension[referenceProfile].valueCanonical = Canonical(Observation-Panel)
      * extension[referenceResource].valueCode = #Observation
      * item[+]
        * linkId = "LN/58410-2-designNote"
        * type = #display
        * text = "See Questionnaire [CBC panel - Blood by Automated count](https://fhir.nwgenomics.nhs.uk/R4/Questionnaire-58410-2.html)"
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #group
    * linkId = "RareAndInheritedDiseasesGeneticTesting"
    * text = "Rare and Inherited Disease Prior Results"
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#RareAndInheritedDiseasesGeneticTesting
  * item[+]
    * type = #group
    * linkId = "CancerGeneticTesting"
    * text = "Cancer Testing Prior Results"
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#CancerGeneticTesting
    * item[+]
      * type = #group
      * linkId = "UnknownResultsPanel"
      * text = "Unknown Results Panel"
      * item[+]
        * linkId = "SNM/250537006"
        * code[+] = $sct#250537006 "Histopathology finding (finding)"
        * text = "Neoplastic Cell Content Level"
        * type = #quantity
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"

      * item[+]
        * linkId = "NOS/230031"
        * code[+] = $sct#250537006 "Histopathology finding (finding)"
        * text = "Neoplastic Cell Content Level %"
        * type = #quantity
        * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "SNM/252416005"
      * code[+] = $sct#252416005 "Histopathology test (procedure)"
      * text = "Macrodissection Requirements"
      * type = #string

    * item[+]
      * linkId = "NOS/230033"
      * code[+] = $MFTEPIC#230033 "BLAST CELL COUNT"
      * text = "Blast Cell Count"
      * type = #quantity
      * definition = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"
