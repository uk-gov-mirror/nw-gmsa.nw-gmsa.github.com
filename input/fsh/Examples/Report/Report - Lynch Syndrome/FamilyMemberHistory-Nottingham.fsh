Instance: c76b8bc2-ec36-4ce1-a2ea-8c57215115e2
InstanceOf: FamilyMemberHistory
Title: "FamilyMemberHistory - Sarah-Jane Nottingham"
Description: "FamilyMemberHistory - Sarah-Jane Nottingham"

* status = #partial

* patient = Reference(Patient-Liverpool)
* patient.display = "Paul LIVERPOOL"

* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"

* name = "Sarah-Jane Nottingham"

* bornDate = "1924-01-05"

* deceasedBoolean = true

* reasonReference = Reference(6beb613f-d303-42af-b025-86e8e0872061)

* sex = #female

* condition[+]
  * code = $sct#126765001 "Gastrointestinal obstruction (disorder)"
  * contributedToDeath = true
