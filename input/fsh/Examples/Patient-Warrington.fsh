Instance: Patient-Warrington
InstanceOf: Patient
Title: "Patient - Warrington"
Description: """
Test Patient for Warrington
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9662297654"

* name.use = #official
* name.family = "Warrington"
* name.given = "Olenna"

* birthDate = "1938-07-20"
* deceasedBoolean = true

* gender = #female

