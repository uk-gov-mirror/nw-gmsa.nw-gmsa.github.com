Instance: Patient-Lancaster
InstanceOf: Patient
Title: "Patient - Lancaster"
Description: """
Test Patient for Lancaster
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9332297654"


* name.use = #official
* name.family = "Lancaster"
* name.given = "Jaime"

* birthDate = "1970-07-27"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "P81002"
  * display = "Lancaster Medical Practice"
