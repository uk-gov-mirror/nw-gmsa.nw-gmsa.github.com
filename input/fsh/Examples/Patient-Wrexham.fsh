Instance: Patient-Wrexham
InstanceOf: Patient
Title: "Patient - Wrexham"
Description: """
Test Patient for Wrexham
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9333397654"


* name.use = #official
* name.family = "Wrexham"
* name.given = "Myrcella"

* birthDate = "1999-10-13"

* gender = #female

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "W91022"
  * display = "Plas Y Bryn Medical Centre"
