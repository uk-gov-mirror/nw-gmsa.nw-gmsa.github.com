Instance: Patient-FetusLondon
InstanceOf: Patient
Title: "Patient - Fetus London"
Description: """
Test Fetus Patient for London
"""
Usage: #example

* active = true


* identifier[0].type = $v2-0203#MR
* identifier[0].value = "67890"
* identifier[0].system = "urn:oid:1.2.840.114350.1.13.611.3.7.5.737384.14"
* identifier[0].assigner.identifier.system = $ods-code
* identifier[0].assigner.identifier.value = "RPY"

* name.use = #temp
* name.family = "London"
* name.given = "Baby"

* birthDate = "2026"
