Instance: Patient-Birmingham
InstanceOf: Patient
Title: "Patient - Birmingham"
Description: """
Test Patient for Birmingham.
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9334497654"


* name.use = #official
* name.family = "Birmingham"
* name.given = "Tommen"

* birthDate = "1999-09-07"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "M85124"
  * display = "Bellevue Medical Centre"
