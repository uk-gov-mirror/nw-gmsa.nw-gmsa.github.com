Instance: 7b362aa5-41a7-4168-94b4-f12dff0dfb2a
InstanceOf: GenomicStudy
Title: "Genomic Study - Cystic Fibrosis"
Description: "Based on HL7 LRI Example 1 (Ref 5.9.1.2)"

* identifier[+].value = "7b362aa5-41a7-4168-94b4-f12dff0dfb2a"

* status = #completed

* performedDateTime	 = "2025-10-23T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

// * code


* asserter = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Lancaster)
* subject.display = "Jaime LANCASTER"

* reasonCode[+]
  * coding[+]
    * code = #R185
    * display = "Cystic fibrosis carrier testing"
    * system = $GCC

* outcome = $GTOC#321 "VARIANT DETECTED"
