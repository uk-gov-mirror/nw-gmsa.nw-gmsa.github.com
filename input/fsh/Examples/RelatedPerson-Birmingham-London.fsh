Instance: RelatedPerson-Birmingham-London
InstanceOf: RelatedPerson
Title: "RelatedPerson Birmingham-London"
Description: """
RelatedPerson for Birmingham-London
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9334497654"


* name.use = #official
* name.family = "Birmingham"
* name.given = "Tommen"

* relationship[0] = $v3-RoleCode#SON "son"

* patient = Reference(Patient-London)
