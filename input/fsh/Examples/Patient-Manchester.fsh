Instance: Patient-Manchester
InstanceOf: Patient
Title: "Patient - Liam Manchester NHS Number: 9012345678"
Description: """
Test Patient for Cheshire and Merseyside ICS
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9012345678"
* identifier[1].type = $v2-0203#MR
* identifier[1].value = "Z12345"
* identifier[1].system = "http://www.acme.org/patient/identifier"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "R0A"

* name.use = #official
* name.family = "MANCHESTER"
* name.given = "Jon"

* birthDate = "1972-09-21"

* address[+]
  * use = #home
  * type = #both
  * line[+] = "Oxford Rd"
  * city = "MANCHESTER"
  * postalCode = "M13 9PL"

* gender = #male

* contact.name.use = #official
* contact.name.family = "MANCHESTER"
* contact.name.given = "Noel"
* contact.telecom.use = #mobile
* contact.telecom.value = "077021245231"
* contact.telecom.system = #phone

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "F81399"
  * display = "Vallance Medical"
