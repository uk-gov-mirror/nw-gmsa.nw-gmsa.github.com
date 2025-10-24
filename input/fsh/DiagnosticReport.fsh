Profile:        DiagnosticReport
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
**HL7 v2** [OBR](hl7v2.html#obr) *mapping* [OBR to DiagnosticReport](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html)

Reference:
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)
- [NHS England Genomics DiagnosticReport](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-DiagnosticReport) use text descriptions only, not the rendered profile.

"""

// https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGGeneral.fsh

* extension contains DiagnosticReportProcedure named procedure 0..*

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  ReportNumber 0..1 MS and FillerOrderNumber 0..1 MS

* identifier[ReportNumber] only ReportNumber
* identifier[ReportNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[ReportNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[ReportNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* identifier[FillerOrderNumber] only FillerOrderNumber
* identifier[FillerOrderNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[FillerOrderNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[FillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


* basedOn only CodeableReference
* basedOn.identifier 1..1 MS
* basedOn.identifier only CorrelationIdentifier

* basedOn ^slicing.discriminator.type = #value
* basedOn ^slicing.discriminator.path = "identifier.type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  fillerOrderNumber 0..1 MS

* basedOn[fillerOrderNumber] ^short = "Identifier assigned by the lab (ORC-3)"
* basedOn[fillerOrderNumber].type 1..1 MS
* basedOn[fillerOrderNumber].type = "ServiceRequest"
* basedOn[fillerOrderNumber].identifier 1..1
* basedOn[fillerOrderNumber].identifier only FillerOrderNumber
* basedOn[fillerOrderNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* basedOn[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* basedOn[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category code pattern"
* category ^slicing.ordered = false
* category contains Genetics 1..1

* category[Genetics].coding 1..1 MS
* category[Genetics].coding = http://terminology.hl7.org/CodeSystem/v2-0074#GE

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* effectiveDateTime 0..1 MS
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* issued 0..1

* encounter 0..1 MS
* encounter ^short = "A reference identifier to the episode/stay/visit number in which the report was created. (HL7 v2 PV1-19)"
* encounter only Reference(Encounter)
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

* performer ^slicing.discriminator.type = #pattern
* performer ^slicing.discriminator.path = "type"
* performer ^slicing.rules = #open
* performer ^slicing.description = "Slice based on the type"
* performer ^slicing.ordered = false
* performer contains
  organisation 1..1 and operator 0..*

* performer[organisation].identifier only OrganisationCode
* performer[organisation].type = #Organization

* performer[operator].identifier only PractitionerIdentifier
* performer[operator].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF
* performer[operator].type = #Practitioner

* resultsInterpreter.identifier 1..1
* resultsInterpreter.identifier.system 1..1
* resultsInterpreter.identifier.value 1..1
* resultsInterpreter.type 1..1
* resultsInterpreter only Reference(Practitioner or PractitionerRole)

* resultsInterpreter ^slicing.discriminator.type = #value
* resultsInterpreter ^slicing.discriminator.path = "type"
* resultsInterpreter ^slicing.rules = #open
* resultsInterpreter ^slicing.description = "Slice based on the type"
* resultsInterpreter ^slicing.ordered = false
* resultsInterpreter contains
  primaryReporter 0..*

* resultsInterpreter[primaryReporter].identifier only PractitionerIdentifier
* resultsInterpreter[primaryReporter].type = #Practitioner

* specimen 0..* MS


* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "resolve()"
* result ^slicing.rules = #open
* result ^slicing.description = "Slice based on the reference profile and code pattern"
* result contains
    diagnostic-implication 0..* and
    variant 0..*

* result[variant] MS
* result[variant] only Reference(ObservationVariant)
* result[diagnostic-implication] MS
* result[diagnostic-implication] only Reference(ObservationDiagnosticImplication)

* presentedForm 1..* MS
* presentedForm ^short = "a reference to the full report (presentedForm)"
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
