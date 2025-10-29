Instance: 6beb613f-d303-42af-b025-86e8e0872061
InstanceOf: ObservationDiagnosticImplication
Title: "DiagnosticImplication - Lynch Syndrome"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "6beb613f-d303-42af-b025-86e8e0872061"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #diagnostic-implication
    * display = "Diagnostic Implication"
    * system = "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs"


* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* derivedFrom = Reference(8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)

* subject = Reference(Patient-Liverpool)
* subject.display = "Paul LIVERPOOL"

* component[0].code = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
* component[=].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[+].code = $loinc#81259-4
* component[=].valueCodeableConcept.coding[0] = $GCC#R210 "Inherited MMR deficiency (Lynch syndrome)"
* component[=].valueCodeableConcept.coding[+] = $sct#1365861003 "Lynch syndrome gene mutation detected"
* component[=].valueCodeableConcept.text = "Inherited MMR deficiency (Lynch syndrome)"

