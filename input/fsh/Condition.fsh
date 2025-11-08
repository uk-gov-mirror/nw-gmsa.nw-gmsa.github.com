Profile:        Condition
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Condition
Id:             Condition
Title:          "Condition"
Description:    """
`Patient Care`
"""

* identifier 1..* MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber
