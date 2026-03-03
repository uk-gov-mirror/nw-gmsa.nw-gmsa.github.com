Instance: Order-LAB-1
InstanceOf: AuditEvent
Title: "AuditEvent Placer Order Management [LAB-1] V2/FHIR/V2 Order"
Description: """
AuditEvent Placer Order Management [LAB-1] V2/FHIR O21 Order
"""
Usage: #example

* type = $DCM#110109 "Order Record"
//* type =  http://dicom.nema.org/resources/ontology/DCM#110109	"Order Record"
* subtype = urn:ihe:event-type-code#LAB-1

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
* source.observer.identifier.value = "RIE-EnterpriseServiceBus"

* entity[message]
  * type = https://fhir.nwgenomics.nhs.uk/CodeSystem/BasicAuditEntityType#XcorrelationId
  * what.identifier.value = "urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095"

* entity[event]
  * type = https://fhir.nwgenomics.nhs.uk/CodeSystem/BasicAuditEntityType#event
  * lifecycle = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* entity[transaction]
  * type = https://profiles.ihe.net/ITI/BALP/CodeSystem/BasicAuditEntityType#XrequestId
  * what.identifier.value = "407094"

* entity[patient]
  * type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1
// Not known at this point  * what = Reference(Patient-OctaviaCHISLETT-9449305552)
  * what.identifier
    * system = $nhs-number
    * value = "9449305552"
