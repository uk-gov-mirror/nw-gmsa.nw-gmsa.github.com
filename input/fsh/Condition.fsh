Profile:        Condition
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Condition
Id:             Condition
Title:          "Condition"
Description:    """

Reference:
- **NHS England HL7 v2** DG1 [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

"""

* identifier 1..* MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber
