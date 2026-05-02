Profile: Task
Parent: http://hl7.org/fhir/StructureDefinition/Task
Id: Task
Description: """
`Diagnostic` Based on [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html)
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #workflow "Patient Care Workflow"

* identifier only CorrelationIdentifier
* identifier MS

* groupIdentifier only CorrelationIdentifier
* groupIdentifier MS

* status MS
* intent MS
* code 1..1
* authoredOn 1..1

* for 1..1 MS
* for only Reference(Patient)
* for.identifier only NHSIdentifier

* requester only Reference(PractitionerRole or Organization)
* requester 1..1 MS
* requester.identifier only OrganisationCode

* owner only Reference(PractitionerRole or Organization)
* owner 1..1 MS
* owner.identifier only OrganisationCode

* focus 1..1 MS
* focus only Reference(ServiceRequest or Specimen)
