Instance: 13240a3b-d1db-4f1a-ad7d-b19f23967060
InstanceOf: Procedure
Title: "Procedure - Liver Biopsy"
Description: "TODO"

* identifier[+].value = "13240a3b-d1db-4f1a-ad7d-b19f23967060"

* status = #completed

* performedDateTime	 = "2025-10-09T10:37:26+00:00"

* category[+] = $sct#387713003 "Surgical procedure"

* code = $sct#86259008 "Biopsy of liver"

* asserter = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Liverpool)
* subject.display = "Nedl LIVERPOOL"

* reasonCode[+]
  * coding[+]
    * code = #363508008
    * display = "Malignant neoplasm of intestine"
    * system = $sct

* outcome = $sct#109841003 "Liver cell carcinoma"
