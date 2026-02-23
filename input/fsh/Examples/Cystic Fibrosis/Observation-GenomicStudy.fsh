Instance: 7b362aa5-41a7-4168-94b4-f12dff0dfb2b
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Cystic Fibrosis"
Description: "Based on HL7 LRI Example 1 (Ref 5.9.1.2)"

* identifier[+].value = "7b362aa5-41a7-4168-94b4-f12dff0dfb2b"


* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[genomicsCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #81306-3
    * display = "Variables that apply to the overall study"
    * system = $loinc

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Lancaster)
* subject.display = "Jaime LANCASTER"

* component[0].code = $loinc#51967-8 "Genetic disease(s) assessed"
* component[=].valueCodeableConcept = $GCC#R185 "Cystic fibrosis"
