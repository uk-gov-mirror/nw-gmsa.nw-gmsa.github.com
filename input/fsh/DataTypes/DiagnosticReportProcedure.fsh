Extension: DiagnosticReportProcedure
Id: DiagnosticReportProcedure
Title: "DiagnosticReport procedure"
Description: "Backport of FHIR R6 DiagnosticReport,procedure"

* ^context.type = #element
* ^context.expression = "Element"
* value[x] 1..1
* value[x] only Reference(ProcedureGenomicStudy)
