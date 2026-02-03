Instance: Patient-Northwich
InstanceOf: Patient
Title: "Patient - Northwich"
Description: """
Test Patient for Northwich
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383311"


* name.use = #official
* name.family = "Northwich"
* name.given = "Mace"

* birthDate = "1957-01-19"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "N81087"
  * display = "Danebridge Medical Practice"
