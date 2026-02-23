Instance: 0878c5de-c22f-4e31-841a-a82ad31c93aa
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Lynch Syndrome"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "0878c5de-c22f-4e31-841a-a82ad31c93aa"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[genomicsCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #81306-3
    * display = "Variables that apply to the overall study"
    * system = $loinc

* asserter = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Liverpool)
* subject.display = "Ned LIVERPOOL"

* component[0].code = $loinc#51967-8 "Genetic disease(s) assessed"
* component[=].valueCodeableConcept = $GCC#R210 "Inherited MMR deficiency (Lynch syndrome)"


