Instance: Patient-Leeds
InstanceOf: Patient
Title: "Patient - Rob Leeds NHS Number: 9737383222"
Description: """
Test Patient for West Yorkshire ICB
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383222"

* identifier[1].type = $v2-0203#MR
* identifier[1].value = "L765432"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "RR8"

* name.use = #official
* name.family = "LEEDS"
* name.given = "Rob"

* birthDate = "1978-01-17"

* address[+]
  * use = #home
  * type = #both
  * line[+] = "Maison Lane"
  * city = "LEEDS"
  * postalCode = "LS8 2HH"

* gender = #male

* contact.name.use = #official
* contact.name.family = "LEEDS"
* contact.name.given = "Andrew"
* contact.telecom.use = #mobile
* contact.telecom.value = "077021231231"
* contact.telecom.system = #phone

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "B86016"
  * display = "Shaftesbury Medical Centre & Church View Surgery"
