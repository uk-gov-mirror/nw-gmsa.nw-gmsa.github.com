Profile:        Practitioner
Parent:         http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu-core
Id:             Practitioner
Title:          "Practitioner"
Description:    """
`Care Directory` `HL7 Europe Core`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #cds "Care Directory"

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  PractitionerIdentifier 1..1 MS

* identifier[PractitionerIdentifier] only PractitionerIdentifier

* name MS
