Profile:        DiagnosticReport
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport
Parent:         http://hl7.org/fhir/StructureDefinition/DiagnosticReport
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
'Diagnostic Workflow'
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #diagnostics "Diagnostics"
* ^keyword[+] = #genomics "Genomics"

* extension contains DiagnosticReportProcedure named procedure 0..*

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  OrderFillerNumber 0..1 MS


* identifier[OrderFillerNumber] only OrderFillerNumber
* identifier[OrderFillerNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[OrderFillerNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[OrderFillerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


* basedOn only CodeableReference
* basedOn.identifier 1..1 MS
* basedOn.identifier only CorrelationIdentifier

* basedOn ^slicing.discriminator.type = #value
* basedOn ^slicing.discriminator.path = "identifier.type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  OrderFillerNumber 0..1 MS

* basedOn[OrderFillerNumber] ^short = "Identifier assigned by the lab (ORC-3)"
* basedOn[OrderFillerNumber].type 1..1 MS
* basedOn[OrderFillerNumber].type = "ServiceRequest"
* basedOn[OrderFillerNumber].identifier 1..1
* basedOn[OrderFillerNumber].identifier only OrderFillerNumber
* basedOn[OrderFillerNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* basedOn[OrderFillerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* basedOn[OrderFillerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)


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

* resultsInterpreter.identifier 0..1
* resultsInterpreter.identifier.system 1..1
* resultsInterpreter.identifier.value 1..1
* resultsInterpreter.type 0..1
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
