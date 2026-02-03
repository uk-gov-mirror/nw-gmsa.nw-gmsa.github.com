Profile:        ReportNumber
Parent:         CorrelationIdentifier
Id:             ReportNumber
Title:          "Report Number"
Description:     """
`Diagnostic Workflow`
"""

* ^purpose = """
## Mapping

`NHS Data Model and Dictionary` nil
- **HL7 FHIR** DiagnosticReport.identifier
- **HL7 v2** Filler Order Number (ORC-3).
"""

* type = $v2-0203#RI
* value 1..1
