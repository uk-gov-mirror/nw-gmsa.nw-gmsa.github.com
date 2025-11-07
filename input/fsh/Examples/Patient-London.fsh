Instance: Patient-London
InstanceOf: Patient
Title: "Patient - London"
Description: """
Test Patient for London
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9321197654"


* name.use = #official
* name.family = "London"
* name.given = "Cersei"

* birthDate = "1973-10-03"

* gender = #female

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "F83004"
  * display = "Archway Medical Centre"
