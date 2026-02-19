Profile:        ReportIdentifier
Parent:         CorrelationIdentifier
Id:             ReportIdentifier
Title:          "Report Identifier"
Description:     """
`Diagnostic Workflow` HL7 IdentifierType: **FILL** Filler Identifier
"""

* ^purpose = """
## Mapping

`NHS Data Model and Dictionary` nil
- **HL7 FHIR** DiagnosticReport.identifier (type = FILL) and ServiceRequest.identifier
- **HL7 v2** Filler Order Number (OBR-3).
"""
* system 1..1
* type = $v2-0203#FILL
* value 1..1
* assigner 1..1
