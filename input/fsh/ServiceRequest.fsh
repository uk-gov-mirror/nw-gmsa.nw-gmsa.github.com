Profile:        ServiceRequest
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/ServiceRequest-eu-lab
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    """
`Diagnostic Workflow`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #diagnostics "Diagnostics"
* ^keyword[+] = #genomics "Genomics"

//* extension[additionalContact] ^short = "Do not use, not supported. Use PractitionerRole instead."

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  OrderIdentifier 0..1 MS and OrderFillerNumber 0..1 MS

* identifier[OrderIdentifier] only OrderIdentifier
* identifier[OrderIdentifier] ^short = "Identifier assigned by the Order Placer. (HL7 v2 ORC-2/OBR-2 Placer Order Number)"
* identifier[OrderIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[OrderIdentifier] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[OrderIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* identifier[OrderFillerNumber]
* identifier[OrderFillerNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[OrderFillerNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[OrderFillerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[OrderFillerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* requisition only OrderGroupNumber
* requisition ^short = "Identifier assigned by the Order Placer. (HL7 v2 ORC-4 Placer Group Number)"
* requisition insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* requisition insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* requisition insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* code ^short = "See [National Genomic Test Directory](https://www.england.nhs.uk/wp-content/uploads/2018/08/rare-and-inherited-disease-eligibility-criteria-v2.pdf)."
* code 1..1 MS

* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slice based on the system"
* code.coding ^slicing.ordered = false
* code.coding contains
  GenomicTestDirectory 1..1 MS
  // and PathologyAndLaboratoryMedicine 0..1 and NICIP 0..1

* code.coding[GenomicTestDirectory] ^short = "Genomic Test Directory"
* code.coding[GenomicTestDirectory].system = $GTD

* orderDetail ^short = "Additional order codes"

* orderDetail 0..* MS

* orderDetail.coding 1..* MS
* orderDetail.coding ^slicing.discriminator.type = #value
* orderDetail.coding ^slicing.discriminator.path = "system"
* orderDetail.coding ^slicing.rules = #open
* orderDetail.coding ^slicing.description = "Slice based on the system"
* orderDetail.coding ^slicing.ordered = false
* orderDetail.coding contains
  GenomicTestDirectory 1..1 MS

* orderDetail.coding[GenomicTestDirectory] ^short = "Genomic Test Directory"
* orderDetail.coding[GenomicTestDirectory].system = $GTD


* category 1..* MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the coding.system"
* category ^slicing.ordered = false
* category contains
  GenomicProcedure 0..1 MS and GenomicsWholeCaseSequencing 0..1 MS


* category[GenomicProcedure].coding.code = #116148004
* category[GenomicProcedure].coding.system = $sct

* category[GenomicsWholeCaseSequencing] 0..1 MS
* category[GenomicsWholeCaseSequencing].coding.system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory"

* encounter 0..1 MS
* encounter ^short = "A reference identifier to the episode/stay/visit number in which the request was created. (HL7 v2 PV1-19)"
* encounter only Reference(HospitalSpell)
* encounter.identifier only HospitalProviderSpellIdentifier
* encounter.identifier 0..1 MS
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* requester 1..1 MS
* requester only Reference(PractitionerRole or Organization)
* requester.identifier only OrganisationCode

* performer only Reference(Organization)
* performer.identifier only OrganisationCode

* authoredOn 1..1 MS

* occurrence[x] 0..1 MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* basedOn 0..* MS
* basedOn ^short = "SHALL reference a parent request where this ServiceRequest is based on a previous request, e.g. in the case of reanalysis and cascade testing, or Germline Late tests in the Tumour First/Germline Late scenario"
* basedOn only Reference(ServiceRequest)
* basedOn.identifier only CorrelationIdentifier

* priority from RequestPriority (required)

* note MS

* specimen 0..* MS

* reasonCode MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* supportingInfo 0..* MS
//* supportingInfo only Reference(ObservationPanel or Observation or DiagnosticReport or QuestionnaireResponse or DocumentReference)

* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the coding.system"
* supportingInfo ^slicing.ordered = false
* supportingInfo contains
  PriorResult 0..1 MS and PatientSummary 0..1 MS

* supportingInfo[PriorResult] ^short = "Equivalent of HL7 v2 OML_O21 PRIOR RESULT (as PDF)"
* supportingInfo[PriorResult] only Reference(DiagnosticReport)
* supportingInfo[PriorResult].type = #DiagnosticReport
* supportingInfo[PriorResult].identifier 1..1 MS
* supportingInfo[PriorResult].identifier only CorrelationIdentifier

* supportingInfo[PatientSummary] only Reference(DocumentReference)
* supportingInfo[PatientSummary].type = #DocumentReference
