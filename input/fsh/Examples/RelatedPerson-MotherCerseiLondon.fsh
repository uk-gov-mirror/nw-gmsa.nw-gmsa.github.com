Instance: RelatedPerson-MotherCerseiLondon
InstanceOf: RelatedPerson
Title: "RelatedPerson Mother Cersei London"
Description: """
RelatedPerson for Mother Cersei London to Fetus Baby London
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383230"

* identifier[1].type = $v2-0203#MR
* identifier[1].value = "1234567"
* identifier[1].system = "urn:oid:1.2.840.114350.1.13.611.3.7.5.737384.14"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "RPY"

* name.use = #official
* name.family = "London"
* name.given = "Cersei"

* relationship[0] = $v3-RoleCode#MTH "mother"

* patient = Reference(Patient-FetusLondon)
* patient.identifier.system = "urn:oid:1.2.840.114350.1.13.611.3.7.5.737384.14"
* patient.identifier.system = "67890"
* patient.identifier.assigner.identifier.system = $ods-code
* patient.identifier.assigner.identifier.value = "RPY"

* birthDate = "1973-10-03"

* gender = #female
