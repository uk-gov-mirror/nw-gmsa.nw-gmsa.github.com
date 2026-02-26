Profile:        RelatedPerson
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-RelatedPerson
Id:             RelatedPerson
Title:          "RelatedPerson"
Description:    """
`Patient Administration`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #pam "Patient Administration"

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

* identifier[nhsNumber] only NHSIdentifier
* identifier[nhsNumber] ^short = "UK National Health Identifiers: NHS NUMBER (England and Wales)"
* identifier[MedicalRecordNumber] only MedicalRecordNumber
* identifier[MedicalRecordNumber] ^short = "Medical Record Number"

* patient
* patient.identifier only MedicalRecordNumber

* birthDate MS
