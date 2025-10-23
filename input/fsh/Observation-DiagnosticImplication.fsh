Profile:        ObservationDiagnosticImplication
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication
Id:             Observation-DiagnosticImplication
Title:          "Observation Diagnostic Implication"
Description:    """
Reference:
- [FHIR Genomic Report - Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html)
- [openEHR Genomic Variant Result](https://ckm.openehr.org/ckm/archetypes/1013.1.3759)
"""

* identifier 1..* MS

* performer only Reference(PractitionerRole or Patient)

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSNumber

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* effective[x] ^short = "Clinically relevant time/time-period for observation (HL7 v2 OBX-14)"
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* code MS
* derivedFrom[variant] MS
* derivedFrom[variant] only Reference(Variant)
* component[predicted-phenotype] MS
* component[clinical-significance] MS
