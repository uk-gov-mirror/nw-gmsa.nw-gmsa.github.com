Instance: Order-FHIR
InstanceOf: AuditEvent
Title: "FHIR O21 Order"
Description: """
FHIR Message O21 Order
"""
Usage: #example

//* type = $DCM#110109 "Order Record"
* type = $audit#rest "RESTful Operation"

* action = http://hl7.org/fhir/audit-event-action#C

* recorded = "2024-10-13T10:33:00+00:00"

* agent[oClient]
  * type = $DCM#110150 "Application"
  * requestor = true
  * who.identifier.value = "xtq3HKfpx2r6j7khNGAUYWYSuMECCySQCn0L5ypsGP4"
  * network.address = "192.168.1.67"
  * network.type = #2

* agent[server]
  * type = $DCM#110152 "Destination Role ID"
  * requestor = false
  * network.address = "192.168.1.20"
  * network.type = #2

* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4
* source.observer.type = "Device"
* source.observer.identifier.value = "RIE"

* entity[message]
  * type = https://fhir.nwgenomics.nhs.uk/CodeSystem/BasicAuditEntityType#XcorrelationId
  * what.identifier.value = "urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095"

* entity[transaction]
  * type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId
  * what.identifier.value = "407094"

* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1
  * what = Reference(Patient-OctaviaCHISLETT-9449305552)
