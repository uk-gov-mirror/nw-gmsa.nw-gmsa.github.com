Profile:        CorrelationIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             CorrelationIdentifier
Title:          "Correlation Identifier"
Description:     """
Core Data Contract for FHIR Identifier, v2 CX and EI
"""

* ^purpose = """
"""

* type 0..1 MS
* type from NWIdentifierType
* system 0..1 MS
* system ^short = "uri is defined by supplying organisation."
* value 1..1 MS
* value ^short = "The value MUST be unique to the organisation"

* assigner 1..1 MS
* assigner.identifier 1..1 MS
* assigner.identifier.value 1..1 MS
* assigner.identifier.system 1..1 MS
* assigner.identifier.system = $ods-code
* assigner.identifier.value ^example.valueString = "R0A"
* assigner.identifier.value ^example.label = "Manchester University NHS Foundation Trust"
