Profile:        OrderGroupNumber
Parent:         CorrelationIdentifier
Id:             OrderGroupNumber
Title:          "Order Group Number"
Description:     """
`Diagnostic Workflow` HL7 IdentifierType: **PGN** Placer Group Number
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** ServiceRequest.requisition (type = PGN)
- **HL7 v2** Placer Group Number (ORC-4).
"""

* type = $v2-0203#PGN
* value 1..1
