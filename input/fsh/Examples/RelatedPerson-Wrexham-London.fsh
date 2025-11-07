Instance: RelatedPerson-Wrexham-London
InstanceOf: RelatedPerson
Title: "RelatedPerson Wrexham-London"
Description: """
RelatedPerson for Wrexham-London
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9333397654"

* name.use = #official
* name.family = "Wrexham"
* name.given = "Myrcella"

* relationship[0] = $v3-RoleCode#DAU "daughter"

* patient = Reference(Patient-London)
