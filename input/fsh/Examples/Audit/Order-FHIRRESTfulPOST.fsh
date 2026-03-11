Instance: Order-FHIRRESTful
InstanceOf: AuditEvent
Title: "FHIR RESTful POST ServiceRequest"
Description: """
FHIR RESTful POST ServiceRequest
"""
Usage: #example

//* type = $DCM#110109 "Order Record"
* type = $audit#rest "RESTful Operation"

* action = http://hl7.org/fhir/audit-event-action#C

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

* entity[message]
  * type = https://fhir.nwgenomics.nhs.uk/CodeSystem/BasicAuditEntityType#XcorrelationId
  * what.identifier.value = "urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095"

* entity[transaction]
  * type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId
  * what.identifier.value = "407094"

* entity[restful]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"

* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1
  * role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
  * lifecycle = http://terminology.hl7.org/CodeSystem/dicom-audit-lifecycle#1 "Origination / Creation"
  * what = Reference(Patient-OctaviaCHISLETT-9449305552)
  * what.identifier
    * system = $nhs-number
    * value = "9449305552"
