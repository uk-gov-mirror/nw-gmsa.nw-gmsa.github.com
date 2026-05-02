Profile:        EventNotification
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             EventNotification
Title:          "Event Notification (MessageHeader)"
Description:    "`Messaging` [Event Messsage](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)"

* meta.lastUpdated	1..1 MS

* eventCoding 1..1 MS

* eventCoding from http://terminology.hl7.org/ValueSet/v2-0003

* sender.identifier 1..1 MS
* sender.identifier only OrganisationCode

* focus 1..2 MS

* focus ^slicing.discriminator.type = #value
* focus ^slicing.discriminator.path = "type"
* focus ^slicing.rules = #open
* focus ^slicing.description = "Slice based on the type"
* focus ^slicing.ordered = false

* focus contains
  Patient 1..1 MS
  and Resource 0..1 MS

* focus[Patient] only Reference(Patient)
* focus[Patient].identifier 1..1
* focus[Patient].identifier only NHSIdentifier
* focus[Patient].identifier ^short = "UK National Health Identifiers: NHS NUMBER (England and Wales)"
