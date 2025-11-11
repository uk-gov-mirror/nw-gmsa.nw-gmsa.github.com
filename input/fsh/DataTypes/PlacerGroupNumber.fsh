Profile:        PlacerGroupNumber
Parent:         CorrelationIdentifier
Id:             PlacerGroupNumber
Title:          "Placer Group Number"
Description:     """
`Diagnostic Workflow`
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** ServiceRequest.requisition (type = PGN)
- **HL7 v2** Placer Group Number (ORC-4).
"""

* type = $v2-0203#PGN
* value 1..1
