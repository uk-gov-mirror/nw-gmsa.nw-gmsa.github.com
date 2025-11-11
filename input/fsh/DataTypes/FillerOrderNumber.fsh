Profile:        FillerOrderNumber
Parent:         CorrelationIdentifier
Id:             FillerOrderNumber
Title:          "Filler Order Number"
Description:     """
`Diagnostic Workflow`
"""

* ^purpose = """
## Mapping

- **NHS Data Model and Dictionary** nil
- **HL7 FHIR** ServiceRequest.identifier and DiagnosticReport.identifier (type = FILL)
- **HL7 v2** Filler Order Number (ORC-3).
"""

* type = $v2-0203#FILL
* value 1..1
