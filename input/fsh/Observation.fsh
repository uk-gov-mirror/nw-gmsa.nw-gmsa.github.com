Profile:        Observation
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Observation
Parent:         http://hl7.eu/fhir/base/StructureDefinition/medicalTestResult-eu-core
Id:             Observation
Title:          "Observation"
Description:    """
`Diagnostic` `HL7 Europe Laboratory`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #patientcare "Patient Care"
* ^keyword[+] = #diagnostics "Diagnostics"


* category contains labCategory 1..1
                and geCategory 1..1
* category[labCategory].coding 1..1
* category[labCategory].coding = $OBSCAT#laboratory
* category[geCategory].coding 1..1
* category[geCategory].coding = $DIAGNOSTICSERVICE#GE

* identifier 1..* MS

* performer only Reference(PractitionerRole)

* status ^short = "Observation Status  (HL7 v2 OBX-11)"

* subject only Reference(Patient)
* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSIdentifier

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
* valueString MS

* valueString.extension contains http://hl7.org/fhir/StructureDefinition/rendering-markdown named valueMarkdown 0..*

* referenceRange MS
