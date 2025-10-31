Instance: c8f82825-e4cb-4e1f-b728-3fd2808e93db
InstanceOf: Condition
Title: "Condition - Lynch Syndrome"
Description: "evidenced by genomic diagnostic testing"

* identifier[+].value = "c8f82825-e4cb-4e1f-b728-3fd2808e93db"

* clinicalStatus = #final
* verificationStatus = #confirmed

* recordedDate = "2025-10-24T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"

* code
  * coding[+]
    * code = #716318002
    * display = "Lynch syndrome"
    * system = $sct


* subject = Reference(Patient-Liverpool)
* subject.display = "Paul LIVERPOOL"

* evidence[+]
  * detail[+] = Reference(6beb613f-d303-42af-b025-86e8e0872061)
