Instance: Patient-Bolton
InstanceOf: Patient
Title: "Patient - Bolton"
Description: """
Test Patient for Bolton
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383273"


* name.use = #official
* name.family = "Bolton"
* name.given = "Ramsay"

* birthDate = "1985-05-13"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "Y02790"
  * display = "Bolton Medical Practice"
