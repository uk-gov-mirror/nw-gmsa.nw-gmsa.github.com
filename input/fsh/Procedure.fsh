Profile:        Procedure
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Procedure
Id:             Procedure
Title:          "Procedure"
Description:    """
`Patient Care`
"""

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSNumber

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* code 0..1 MS

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slice based on the category code pattern"
* code.coding ^slicing.ordered = false
* code.coding contains snomedCT 1..1

* code.coding[snomedCT] 1..1 MS
* code.coding[snomedCT] from https://fhir.hl7.org.uk/ValueSet/UKCore-ProcedureCode
