Profile:        Practitioner
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Practitioner
Id:             Practitioner
Title:          "Practitioner"
Description:    """
`Care Directory`
"""

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

* name 0..1 MS
