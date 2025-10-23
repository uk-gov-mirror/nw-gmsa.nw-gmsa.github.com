Instance: 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99
InstanceOf: ObservationVariant
Title: "Variant - NTHL1"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #69548-6
    * display = "Genetic variant assessment"
    * system = $loinc


* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Liverpool)
* subject.display = "Paul LIVERPOOL"

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:89753 "NTHL1"


