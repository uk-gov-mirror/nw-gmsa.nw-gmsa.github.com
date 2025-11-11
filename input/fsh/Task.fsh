Profile: Task
Parent: http://hl7.org/fhir/StructureDefinition/Task
Id: Task
Description: """
`Diagnostic Workflow` Based on [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html)
"""

* status MS
* intent MS
* code 1..1
* for 1..1 MS
* for.identifier only NHSNumber
* requester 1..1 MS
* owner 1..1 MS
* focus 1..1 MS
