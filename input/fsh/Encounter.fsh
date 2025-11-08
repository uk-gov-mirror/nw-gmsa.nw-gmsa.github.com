Profile:        Encounter
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Encounter
Id:             Encounter
Title:          "Encounter"
Description:    """
<span class="badge badge-info">Patient Admin</span>
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  VisitNumber 0..1 MS

* identifier[VisitNumber] only HospitalProviderSpellIdentifier
* identifier[VisitNumber] ^short = "Identifier assigned by the Order Placer"
* identifier[VisitNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[VisitNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[VisitNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* class 1..1 MS
* type 0..1 MS
* type from AdmissionMethod
* serviceType 0..1 MS
* serviceType from Service

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* location.location only Reference(Location)
* location.location.identifier only OrganisationSiteIdentifier

* period MS
* participant MS
* identifier.value MS
* period.start MS

//* participant.individual only Reference(Practitioner or PractitionerRole)
* participant.type 1..1
* participant.type.coding 1..*
* participant.type.coding.code 1..1

* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type.coding"
* participant ^slicing.rules = #open
* participant contains
  attendingDoctor 0..1 and
  referringDoctor 0..1 and
  consultingDoctor 0..* and
  admittingDoctor 0..1

* participant[attendingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ATND
* participant[attendingDoctor].individual.identifier only PractitionerIdentifier
* participant[referringDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#REF
* participant[referringDoctor].individual.identifier only PractitionerIdentifier
* participant[consultingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CON
* participant[consultingDoctor].individual.identifier only PractitionerIdentifier
* participant[admittingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ADM
* participant[admittingDoctor].individual.identifier only PractitionerIdentifier

* hospitalization.admitSource from AdmissionSource
* hospitalization.dischargeDisposition from DischargeDisposition

* serviceProvider 0..1
* serviceProvider.identifier only OrganisationCode
