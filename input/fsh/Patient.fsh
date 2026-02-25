Profile: Patient
//Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
Parent: http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core
Id: Patient
Description: """
`Patient Administration` `HL7 Europe Core`
"""
* ^keyword[+] = #core "Core"
* ^keyword[+] = #pam "Patient Administration"

* extension contains https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-EthnicCategory named ethnicCategory 0..1
* extension[ethnicCategory] ^short = "Ethnic Category. NHS England HL7 v2 PID-22 Ethnic Group"

* extension[sex-for-clinical-use]

* identifier 1..* MS
* identifier.assigner ^short = "Assigning Facility"
* identifier.assigner 0..1 MS
* identifier.assigner.identifier 1..1 MS
* identifier.assigner.identifier.value 1..1 MS
* identifier.assigner.identifier.system = $ods-code

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false

* identifier contains
  MedicalRecordNumber 0..* MS
  and nhsNumber 0..* MS
  and SRIN 0..1

//  solved via ServiceRequest.requisition and GenomicsPedigreeNumber 0..*

* identifier[nhsNumber] only NHSIdentifier
* identifier[nhsNumber] ^short = "UK National Health Identifiers: NHS NUMBER (England and Wales)"
//* identifier[nhsNumber].extension[nhsNumberVerificationStatus] ^short = "NOT REQUIRED. As all NHS Numbers **MUST** be *01 Number present and verified*, this status will be assumed."
* identifier[MedicalRecordNumber] only MedicalRecordNumber
* identifier[MedicalRecordNumber] ^short = "Medical Record Number"
* identifier[GS1GSRN] only GS1GSRN
* identifier[GS1GSRN] ^short = "GS1 Global Service Relation Number"

//* identifier[GenomicsPedigreeNumber] only GenomicsPedigreeNumber
//* identifier[GenomicsPedigreeNumber] ^short = "Genomics Pedigree Number"

* address.postalCode 1..1

* name 1..* MS
* gender 0..1 MS
* birthDate 1..1 MS

* name.family
* name.given
* deceasedDateTime

