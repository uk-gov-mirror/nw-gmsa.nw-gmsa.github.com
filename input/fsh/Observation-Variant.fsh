Profile:        ObservationVariant
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id:             Observation-Variant
Title:          "Observation Variant"
Description:    """
`Genomic Observation`
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* identifier 1..* MS

* performer only Reference(PractitionerRole or Patient)

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSIdentifier

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
* valueCodeableConcept MS
* method MS
* component[allelic-state] MS
* component[representative-coding-hgvs] MS
* component[genomic-ref-seq] MS

