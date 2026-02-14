Profile:        Condition
Parent:         http://hl7.eu/fhir/base/StructureDefinition/condition-eu-core
Id:             Condition
Title:          "Condition"
Description:    """
`Patient Care` `HL7 Europe Core`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #patientcare "Patient Care"


* identifier 1..* MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSIdentifier
