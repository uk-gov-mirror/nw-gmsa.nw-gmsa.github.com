Profile:        MessageHeader
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             MessageHeader
Title:          "MessageHeader"
Description:    "DRAFT"

* meta.lastUpdated	1..1 MS

* eventCoding 1..1 MS

* eventCoding from http://terminology.hl7.org/ValueSet/v2-0003

* destination.receiver.identifier 1..1 MS
* destination.receiver.identifier only OrganisationCode

* sender.identifier 1..1 MS
* sender.identifier only OrganisationCode

* response 0..1 MS
* response ^short = "Mandatory for message acknowledgements."
* response.identifier 1..1 MS
* response.code 1..1 MS
