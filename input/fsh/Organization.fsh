Profile:        Organization
Parent:         http://hl7.eu/fhir/base/StructureDefinition/organization-eu-core
Id:             Organization
Title:          "Organization"
Description:    """
`Care Directory`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #cds "Care Directory"

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  odsOrganisationCode 0..1 MS

* identifier[odsOrganisationCode] only OrganisationCode


//* address.extension contains http://hl7.org/fhir/StructureDefinition/geolocation named GeoLocation 0..1
