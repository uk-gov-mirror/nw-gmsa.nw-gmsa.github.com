Profile:        DiagnosticReport
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport
Parent:         http://hl7.eu/fhir/base/StructureDefinition/diagnosticReport-eu-core
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/DiagnosticReport-eu-lab
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
`Diagnostic Workflow` `HL7 Europe Core`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #diagnostics "Diagnostics"
* ^keyword[+] = #genomics "Genomics"
// this is not allowed in R4 http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.study named studyR5 0..* and http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo named supportingInfoR5 0..*

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  ReportIdentifier 0..1 MS


* identifier[ReportIdentifier] only ReportIdentifier
* identifier[ReportIdentifier] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[ReportIdentifier] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[ReportIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


* basedOn only CodeableReference
* basedOn.identifier 1..1 MS
* basedOn.identifier only CorrelationIdentifier

* basedOn ^slicing.discriminator.type = #value
* basedOn ^slicing.discriminator.path = "identifier.type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  OrderIdentifier 0..1 MS

* basedOn[OrderIdentifier] ^short = "Identifier assigned by the placer (ORC-2)"
* basedOn[OrderIdentifier].type 1..1 MS
* basedOn[OrderIdentifier].type = "ServiceRequest"
* basedOn[OrderIdentifier].identifier 1..1
* basedOn[OrderIdentifier].identifier only OrderIdentifier
* basedOn[OrderIdentifier] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* basedOn[OrderIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* basedOn[OrderIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


//* category ^slicing.discriminator.type = #value
//* category ^slicing.discriminator.path = "coding"
//* category ^slicing.rules = #open
//* category ^slicing.description = "Slice based on the category code pattern"
//* category ^slicing.ordered = false
* category contains Genetics 1..1

// Looks like this has is fixe on EU Core newer than hl7.fhir.eu.base#2.0.0-ballot based on FHIR 4.0.1. Generated 2025-12-19
//* category[Genetics].coding 1..1 MS
//* category[Genetics].coding = http://terminology.hl7.org/CodeSystem/v2-0074#GE

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)
* subject.identifier only NHSIdentifier

* effectiveDateTime 0..1 MS
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* issued 0..1

* encounter 0..1 MS
* encounter ^short = "A reference identifier to the episode/stay/visit number in which the report was created. (HL7 v2 PV1-19)"
* encounter only Reference(HospitalSpell)
* encounter.identifier only HospitalProviderSpellIdentifier
* encounter.identifier ^short = "(HL7v2 PV1-19 Visit Number from OML_O21)"
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* code ^short = "ISSUE. See [National Genomic Test Directory](https://www.england.nhs.uk/wp-content/uploads/2018/08/rare-and-inherited-disease-eligibility-criteria-v2.pdf)."
* code 1..1 MS

* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slice based on the system"
* code.coding ^slicing.ordered = false
* code.coding contains
   GenomicTestDirectory 1..1 MS

* code.coding[GenomicTestDirectory] ^short = "Genomic Test Directory"
* code.coding[GenomicTestDirectory].system = $GTD

* performer.identifier 1..1
* performer.identifier.system 1..1
* performer.identifier.value 1..1
* performer.type 1..1
* performer.extension contains
      http://hl7.org/fhir/StructureDefinition/event-performerFunction named performerFunction 0..1
* performer only Reference(Practitioner or Organization)

//* performer ^slicing.discriminator.type = #pattern
//* performer ^slicing.discriminator.path = "type"
//* performer ^slicing.rules = #open
//* performer ^slicing.description = "Slice based on the type"
//* performer ^slicing.ordered = false

//* performer contains operator 0..*

* performer[organization].identifier only OrganisationCode
//* performer[organization].type = #Organization

//* performer[operator].identifier only PractitionerIdentifier
//* performer[operator].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF
//* performer[operator].type = #Practitioner

* resultsInterpreter.identifier 0..1
* resultsInterpreter.identifier.system 1..1
* resultsInterpreter.identifier.value 1..1
* resultsInterpreter.type 0..1
* resultsInterpreter only Reference(Practitioner or PractitionerRole)

//* resultsInterpreter ^slicing.discriminator.type = #value
//* resultsInterpreter ^slicing.discriminator.path = "type"
//* resultsInterpreter ^slicing.rules = #open
//* resultsInterpreter ^slicing.description = "Slice based on the type"
//* resultsInterpreter ^slicing.ordered = false
//* resultsInterpreter contains
//  primaryReporter 0..*

* resultsInterpreter[author].identifier only PractitionerIdentifier
//* resultsInterpreter[author].type = #Practitioner

* specimen 0..* MS

* result only Reference(Observation)


* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "resolve()"
* result ^slicing.rules = #open
* result ^slicing.description = "Slice based on the reference profile and code pattern"
* result contains
    diagnostic-implication 0..* and
   variant 0..* and
   genomic-study 0..1
* result[genomic-study]
* result[genomic-study] only Reference(GenomicStudyPanel)
* result[variant] MS
* result[variant] only Reference(Variant)
* result[diagnostic-implication] MS
* result[diagnostic-implication] only Reference(DiagnosticImplication)

* presentedForm 1..* MS
* presentedForm only NWAttachment

* conclusionCode 0..* MS

* conclusionCode.coding 1..* MS
* conclusionCode.coding ^slicing.discriminator.type = #value
* conclusionCode.coding ^slicing.discriminator.path = "system"
* conclusionCode.coding ^slicing.rules = #open
* conclusionCode.coding ^slicing.description = "Slice based on the system"
* conclusionCode.coding ^slicing.ordered = false
* conclusionCode.coding contains
   GenomicTestOutcomeCode 1..1 MS

* conclusionCode.coding[GenomicTestOutcomeCode] ^short = "Genomic Test Outcome Code"
* conclusionCode.coding[GenomicTestOutcomeCode] from GenomicTestOutcomeCodes
