Instance: Order-PCC-44
InstanceOf: AuditEvent
Title: "AuditEvent Mobile Query Existing Data [PCC-44]"
Description: """
AuditEvent Mobile Query Existing Data [PCC-44]
"""
Usage: #example

//* type = $DCM#110109 "Order Record"
* type = $audit#rest "RESTful Operation"
* subtype = urn:ihe:event-type-code#PCC-44

* action = http://hl7.org/fhir/audit-event-action#E

* recorded = "2024-10-13T10:33:00+00:00"

* agent[oClient]
  * type = $DCM#110150 "Application"
  * requestor = true
  * who.identifier.value = "dQEn0UXFRP0ucQmBKkroYN_q4VdEsqUEFJJRR-e_sSs"
  * network.address = "192.168.1.20"
  * network.type = #2

* agent[server]
  * type = $DCM#110152 "Destination Role ID"
  * requestor = false
  * network.address = "192.168.1.20"
  * network.type = #2

* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#5
* source.observer.type = "Device"
* source.observer.identifier.value = "RIE-Repository"

* entity[restful]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * query = "U2VydmljZVJlcXVlc3Q/cGF0aWVudD1QYXRpZW50LU9jdGF2aWFDSElTTEVUVC05NDQ5MzA1NTUy"

* entity[transaction]
  * type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId
  * what.identifier.value = "407094"

* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * lifecycle = http://terminology.hl7.org/CodeSystem/dicom-audit-lifecycle#1 "Origination / Creation"
  * what = Reference(Patient-OctaviaCHISLETT-9449305552)
  * what.identifier
    * system = $nhs-number
    * value = "9449305552"
