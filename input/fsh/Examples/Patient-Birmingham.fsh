Instance: Patient-Birmingham
InstanceOf: Patient
Title: "Patient - Birmingham"
Description: """
Test Patient for Birmingham.
"""
Usage: #example

* active = true

* identifier[nhsNumber].use = #official
* identifier[nhsNumber].type = $v2-0203#NH
* identifier[nhsNumber].system = $nhs-number
* identifier[nhsNumber].value = "9737383249"

* identifier[MedicalRecordNumber].use = #official
* identifier[MedicalRecordNumber].type = $v2-0203#MR
* identifier[MedicalRecordNumber].assigner.identifier.system = $ods-code
* identifier[MedicalRecordNumber].assigner.identifier.value = "RXK"
* identifier[MedicalRecordNumber].value = "1234567"

* name.use = #official
* name.family = "Birmingham"
* name.given = "Tommen"

* birthDate = "1999-09-07"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "M85124"
  * display = "Bellevue Medical Centre"
