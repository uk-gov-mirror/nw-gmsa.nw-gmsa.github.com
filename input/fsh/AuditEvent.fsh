Profile:        AuditEvent
Parent:         http://hl7.org/fhir/StructureDefinition/AuditEvent
Id:             AuditEvent
Title:          "AuditEvent Core"
Description:    "Core model following [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html)"

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest

* action 1..1

* agent 2..*

* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.ordered = false
* agent contains
  client 1..1 MS and user 0..1 and server 1..1

* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110152
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP

* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity ^slicing.ordered = false
* entity contains
  transaction 1..1 MS and query 0..1

* entity[transaction].type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId
* entity[query] = http://terminology.hl7.org/CodeSystem/audit-entity-type#2
