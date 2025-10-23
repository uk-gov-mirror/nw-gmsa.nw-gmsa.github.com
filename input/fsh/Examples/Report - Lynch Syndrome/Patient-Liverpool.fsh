Instance: Patient-Liverpool
InstanceOf: Patient
Title: "Patient - Test2 Liverpool NHS Number: 9449305552"
Description: """
Test Patient for Cheshire and Merseyside ICS
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9876543210"
* identifier[1].type = $v2-0203#MR
* identifier[1].value = "A765432"
* identifier[1].system = "http://www.acme.org/patient/identifier"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "RBS"

* name.use = #official
* name.family = "LIVERPOOL"
* name.given = "Paul"

* birthDate = "2008-09-20"

* address[+]
  * use = #home
  * type = #both
  * line[+] = "20 Forthlin Road"
  * city = "LIVERPOOL"
  * postalCode = "L18 9TN"

* gender = #female

* contact.name.use = #official
* contact.name.family = "LIVERPOOL"
* contact.name.given = "Ringo"
* contact.telecom.use = #mobile
* contact.telecom.value = "077021231231"
* contact.telecom.system = #phone

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "Y00175"
  * display = "MATHER AVENUE SURGERY"
