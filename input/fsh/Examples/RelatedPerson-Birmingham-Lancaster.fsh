Instance: RelatedPerson-Birmingham-Lancaster
InstanceOf: RelatedPerson
Title: "RelatedPerson Birmingham-Lancaster"
Description: """
RelatedPerson for Birmingham-Lancaster
"""
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9334497654"


* name.use = #official
* name.family = "Birmingham"
* name.given = "Tommen"

* relationship[0] = $v3-RoleCode#DAU "daughter"
* relationship[+] = $v3-RoleCode#NIENEPH "niece/nephew"

* patient = Reference(Patient-Lancaster)
