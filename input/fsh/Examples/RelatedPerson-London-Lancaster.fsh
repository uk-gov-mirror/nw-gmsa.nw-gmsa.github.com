Instance: RelatedPerson-London-Lancaster
InstanceOf: RelatedPerson
Title: "RelatedPerson London-Lancaster"
Description: """
RelatedPerson for London-Lancaster
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9321197654"

* name.use = #official
* name.family = "London"
* name.given = "Cersei"

* relationship[0] = $v3-RoleCode#FTWIN "fraternal twin"
* relationship[+] = $v3-RoleCode#SIS "sister"

* patient = Reference(Patient-Lancaster)
