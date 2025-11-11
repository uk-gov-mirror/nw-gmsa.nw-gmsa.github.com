Profile:        PlacerOrderNumber
Parent:         CorrelationIdentifier
Id:             PlacerOrderNumber
Title:          "Placer Order Number"
Description:     """
`Diagnostic Workflow`
"""

* ^purpose = """
## Mapping

- **NHS Data Model and Dictionary** nil
- **HL7 FHIR** ServiceRequest.identifier (type = PLAC)
- **HL7 v2** Placer Order Number (ORC-2).
"""

* type = $v2-0203#PLAC
* value 1..1
