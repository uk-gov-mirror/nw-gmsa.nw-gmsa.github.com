Profile:        CompositionGenomicReport
//Parent:         http://hl7.org/fhir/StructureDefinition/Composition
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Id:             Composition-GenomicReport
Title:          "Composition Genomic Report"
Description:    """
`Diagnostic` `HL7 Europe Laboratory`
"""

* identifier 1..1 MS
* identifier only CorrelationIdentifier

* subject 1..1
* subject.reference 1..1
* subject only Reference(http://hl7.eu/fhir/laboratory/StructureDefinition/Patient-eu-lab)
* subject.identifier only NHSIdentifier
* relatesTo.target[x] only Identifier or Reference(Composition)
* custodian.identifier only OrganisationCode

* type.coding ^slicing.discriminator[0].type = #value
* type.coding ^slicing.discriminator[=].path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #closed
* type.coding contains
    SNOMED 0..* MS and
    LOINC 0..*

* type.coding[SNOMED].system = $sct
* type.coding[SNOMED].code = #1054161000000101
* type.coding[LOINC].system = $loinc
* type.coding[LOINC].code = #51969-4

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only HospitalProviderSpellIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* author only Reference(Practitioner or PractitionerRole)
* author.identifier only PractitionerIdentifier

* attester.party only Reference(Practitioner or PractitionerRole)
* attester.party.identifier only PractitionerIdentifier

* custodian only Reference(Organization)
* custodian.identifier only OrganisationCode

* section 1..* MS
//* section.text MS
* section.title 1..1
* section.code 1..1
* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes
* section.code.coding 1..*
* section.code.coding.system 1..1
* section.code.coding.code 1..1


//* section ^slicing.discriminator[0].type = #value
//* section ^slicing.discriminator[=].path = "code"
//* section ^slicing.ordered = false
//* section ^slicing.rules = #open
//* section ^short = "Sections composing the report"
//* section ^definition = "The root of the sections that make up the report."
//* section.text 1.. MS
* section contains
    InformationRecipient 0..* MS
    and Order 0..* MS
    and Specimen 0..* MS
    and Narrative 0..* MS
    and GenomicFinding  0..* MS
    and GenomicImplication 0..* MS
    and RecommendedActions 0..* MS

* section[InformationRecipient] ^short = "Information Recipient"
* section[InformationRecipient].title = "Information Recipient"
//* section[InformationRecipient].code = $loinc#59772-4 	"Planned procedure Narrative"
* section[InformationRecipient].entry ^short = "Order"
* section[InformationRecipient].entry only Reference(Organization)

* section[Order] ^short = "Laboratory Order"
* section[Order].title = "Laboratory Order"
* section[Order].code = $loinc#59772-4 	"Planned procedure Narrative"
* section[Order].entry ^short = "Order"
* section[Order].entry only Reference(ServiceRequest)

* section[Specimen] ^short = "Specimen"
* section[Specimen].title = "Specimen"
* section[Specimen].code = $loinc#59773-2 "Procedure specimens taken Narrative"
* section[Specimen].entry ^short = "Specimen"
* section[Specimen].entry only Reference(Specimen)

* section[Narrative] ^short = "Narrative"
* section[Narrative].title = "Narrative"
* section[Narrative].code = $loinc#29554-3
* section[Narrative].entry ^short = "Procedure Narrative"
* section[Narrative].entry only Reference(DiagnosticReport or DocumentReference)

* section[GenomicFinding] ^short = "Finding"
* section[GenomicFinding].title = "Finding"
* section[GenomicFinding].code = $loinc#59776-5 "Procedure findings"
* section[GenomicFinding].entry only Reference(ObservationVariant or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship)

* section[GenomicImplication] ^short = "Implication"
* section[GenomicImplication].title = "Implication"
* section[GenomicImplication].code = $loinc#59768-2 "Procedure indications"
* section[GenomicImplication].entry only Reference(Observation-DiagnosticImplication or Observation-TherapeuticImplication or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence)

* section[RecommendedActions] ^short = "Recommended Actions"
* section[RecommendedActions].title = "Recommended Actions"
* section[RecommendedActions].code = $loinc#46209-3 "Provider orders"
* section[RecommendedActions].entry only Reference(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation)
