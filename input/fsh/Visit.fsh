Profile:        Visit
Parent:         Encounter
Id:             Visit
Title:          "Visit"
Description:    """
`Patient Administration`
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

* identifier[VisitNumber] only VisitNumber
* identifier[VisitNumber] ^short = "Identifier assigned by the Order Placer"
* identifier[VisitNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[VisitNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[VisitNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

//* participant.individual only Reference(Practitioner or PractitionerRole)
* participant.type 1..1
* participant.type.coding 1..*
* participant.type.coding.code 1..1

* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type.coding"
* participant ^slicing.rules = #open
* participant contains
  consultingDoctor 0..*
  and attendingDoctor 0..1

* participant[consultingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CON
* participant[consultingDoctor].individual.identifier only PractitionerIdentifier
* participant[attendingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ATND
* participant[attendingDoctor].individual.identifier only PractitionerIdentifier

* partOf only Reference(HospitalSpell)
* partOf.identifier only HospitalProviderSpellIdentifier

