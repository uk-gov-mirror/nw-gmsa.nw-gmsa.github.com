Instance: f0036554-cd1a-463c-ac8a-d891ca409af9
InstanceOf: ProcedureGenomicStudy
Title: "Genomic Study - Lynch Syndrome"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "f0036554-cd1a-463c-ac8a-d891ca409af9"

* status = #completed

* performedDateTime	 = "2025-10-23T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

// * code


* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Liverpool)
* subject.display = "Paul LIVERPOOL"

* reasonCode[+]
  * coding[+]
    * code = #R210
    * display = "Inherited MMR deficiency (Lynch syndrome)"
    * system = $GCC

* outcome = $GTOC#321 "VARIANT DETECTED"
