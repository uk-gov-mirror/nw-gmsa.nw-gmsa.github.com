Instance: Patient-Nottingham
InstanceOf: Patient
Title: "Patient - Nottingham"
Description: """
Test Patient for Nottinghamshire ICS
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383265"


* name.use = #official
* name.family = "Nottingham"
* name.given = "Lyarra"

* birthDate = "1999-09-07"
* deceasedBoolean = true

* gender = #female



* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "C81010"
  * display = "Moir Medical Centre"
