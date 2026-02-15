Instance: d6c19529-a64e-476b-b896-303abec26a79
InstanceOf: Condition
Title: "Condition - Carcinoma"
Description: "evidenced by pathology diagnostic testing"

* identifier[+].value = "d6c19529-a64e-476b-b896-303abec26a79"

* clinicalStatus = #final
* verificationStatus = #confirmed

* recordedDate = "2025-10-28T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"

* code
  * coding[+]
    * code = #109841003
    * display = "Liver cell carcinoma"
    * system = $sct


* subject = Reference(Patient-Liverpool)
* subject.display = "Nedl LIVERPOOL"

* evidence[+]
  * detail[+].display = "Pathology Diagnostic Report"
