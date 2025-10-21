Profile:        ProcedureGenomicStudy
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study
Id:             Procedure-GenomicStudy
Title:          "Procedure - Genomic Study"
Description:    """
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

* code 1..1 MS

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)
