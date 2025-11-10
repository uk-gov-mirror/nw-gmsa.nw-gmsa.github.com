Profile:        HospitalSpell
Parent:         Encounter
Id:             HospitalSpell
Title:          "Hospital Spell"
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
  HospitalSpellIdentifier 0..1 MS

* identifier[HospitalSpellIdentifier] only HospitalProviderSpellIdentifier
* identifier[HospitalSpellIdentifier] ^short = "Identifier assigned by the Order Placer"
* identifier[HospitalSpellIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[HospitalSpellIdentifier] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[HospitalSpellIdentifier] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

//* participant.individual only Reference(Practitioner or PractitionerRole)
* participant.type 1..1
* participant.type.coding 1..*
* participant.type.coding.code 1..1

* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type.coding"
* participant ^slicing.rules = #open
* participant contains
  referringDoctor 0..1 and
  admittingDoctor 0..1

* participant[referringDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#REF
* participant[referringDoctor].individual.identifier only PractitionerIdentifier
* participant[admittingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ADM
* participant[admittingDoctor].individual.identifier only PractitionerIdentifier

* hospitalization.admitSource from AdmissionSource
* hospitalization.dischargeDisposition from DischargeDisposition

