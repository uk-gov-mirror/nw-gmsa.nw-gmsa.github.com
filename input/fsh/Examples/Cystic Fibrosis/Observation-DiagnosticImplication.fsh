Instance: a954a98c-f427-4968-9022-8b760de66628
InstanceOf: ObservationDiagnosticImplication
Title: "DiagnosticImplication - Cystic Fibrosis Carrier"
Description: "Based on HL7 LRI Example 2 (Ref 5.9.1.2)"

* identifier[+].value = "a954a98c-f427-4968-9022-8b760de66628"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #diagnostic-implication
    * display = "Diagnostic Implication"
    * system = "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs"


* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* derivedFrom = Reference(bca547c1-78a5-41be-8cfc-03c05805ac85)

* subject = Reference(Patient-Lancaster)
* subject.display = "Jaime LANCASTER"

* component[0].code = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
* component[=].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[+].code = $loinc#81259-4
* component[=].valueCodeableConcept.coding[0] = $GCC#R185 "Cystic fibrosis carrier testing"
* component[=].valueCodeableConcept.coding[+] = $sct#441520002 "Carrier of cystic fibrosis gene mutation"
* component[=].valueCodeableConcept.text = "Cystic fibrosis carrier testing"

