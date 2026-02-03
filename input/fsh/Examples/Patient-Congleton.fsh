Instance: Patient-Congleton
InstanceOf: Patient
Title: "Patient - Congleton"
Description: """
Test Patient for Congleton
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383281"


* name.use = #official
* name.family = "Congleton"
* name.given = "Margaery"

* birthDate = "1982-02-11"

* gender = #female

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "N81027"
  * display = "Meadowside Medical Centre"
