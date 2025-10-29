Profile:        Observation
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Observation
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             Observation
Title:          "Observation"
Description:    """
Reference
- **NHS England HL7 v2** OBX [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

"""

* identifier 1..* MS

* performer only Reference(http://hl7.eu/fhir/laboratory/StructureDefinition/PractitionerRole-eu-lab  or Patient)

* status ^short = "Observation Status  (HL7 v2 OBX-11)"

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSNumber

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* code ^short = "The type of observation (code / type). (HL7 v2 OBX-3)"

* value[x] ^short = "Actual result (HL7 v2 OBX-5)"

* effective[x] ^short = "Clinically relevant time/time-period for observation (HL7 v2 OBX-14)"
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* valueCodeableConcept MS
* valueQuantity MS
* valueDateTime MS
