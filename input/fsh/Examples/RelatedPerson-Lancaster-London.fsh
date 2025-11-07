Instance: RelatedPerson-Lancaster-London
InstanceOf: RelatedPerson
Title: "RelatedPerson Lancaster-London"
Description: """
RelatedPerson for Lancaster-London
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9332297654"

* name.use = #official
* name.family = "Lancaster"
* name.given = "Jaime"

* relationship[0] = $v3-RoleCode#BRO "brother"
* relationship[+] = $v3-RoleCode#FTWIN "fraternal twin"

* patient = Reference(Patient-London)
