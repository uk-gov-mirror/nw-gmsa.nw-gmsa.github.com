Profile:        AuditEvent
Parent:         http://hl7.org/fhir/StructureDefinition/AuditEvent
Id:             AuditEvent
Title:          "AuditEvent"
Description:    "Core model following [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html)"

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest

* action 1..1 MS

* agent 2..* MS

* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.ordered = false
* agent contains
  oClient 1..1 MS and user 0..1 and server 1..1 and client 0..1

* agent[oClient] ^short = "OAuth2 ClientID. Known as `oClient` in IHE BALP"
* agent[oClient].type = http://dicom.nema.org/resources/ontology/DCM#110150

* agent[client] ^short = "Client DNS or IP address"
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153
* agent[client].who only Reference(Organization)
* agent[client].who.identifier only OrganisationCode

* agent[server] ^short = "Server DNS or IP address"
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152
* agent[server].who only Reference(Organization)
* agent[server].who.identifier only OrganisationCode

* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP
* agent[user].who only Reference(Practitioner)
* agent[user].who.identifier only PractitionerIdentifier

* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity ^slicing.ordered = false
* entity contains
  transaction 1..1 MS and message 0..1 MS and query 0..1 and patient 0..1

* entity[transaction] ^short = "(HL7 FHIR) RESTful HTTP Header: X-Request-ID"
* entity[transaction].type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId

* entity[message] ^short = "HTTP Header: X-Correlation-ID, HL7 v2 MSH.10 - Message Control ID and HL7 FHIR Message Bundle.identifier.value"
* entity[message].type = https://fhir.nwgenomics.nhs.uk/CodeSystem/BasicAuditEntityType#XcorrelationId

* entity[query] ^short = "also known as `data` in IHE BALP"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2

* entity[patient] ^short = "Patient reference plus NHS Number"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1
* entity[patient].what only Reference(Patient)
* entity[patient].what.identifier only NHSNumber
