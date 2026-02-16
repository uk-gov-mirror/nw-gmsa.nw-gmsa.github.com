Profile:        Observation
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Observation
Parent:         http://hl7.eu/fhir/base/StructureDefinition/medicalTestResult-eu-core
Id:             Observation
Title:          "Observation"
Description:    """
`Diagnostic` `HL7 Europe Core`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #patientcare "Patient Care"
* ^keyword[+] = #diagnostics "Diagnostics"


* category contains genomicsCategory 1..1
* category[genomicsCategory] = $DIAGNOSTICSERVICE#GE

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

* value[x].extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.value named value-r5 0..1
* value[x].extension[value-r5]
  * value[x] only Attachment
  * ^short = "only for result of type Attachment"

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

* derivedFrom ^slicing.discriminator.type = #profile
* derivedFrom ^slicing.discriminator.path = "resolve()"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the reference profile pattern"

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains conclusion-string 0..1
* component[conclusion-string] ^short = "Clinical Conclusion"
* component[conclusion-string] ^definition = "Concise and clinically contextualized summary conclusion (interpretation/impression) of the observation"
* component[conclusion-string] ^requirements = "Need to be able to provide a conclusion that is not lost among the basic result data."
* component[conclusion-string] ^comment = "An example would be the interpretative information, typically canned, about a variant identified in the patient."
* component[conclusion-string].code = TbdCodesCS#conclusion-string
* component[conclusion-string].code ^short = "conclusion-string"
* component[conclusion-string].value[x] only string or Quantity
* component[conclusion-string].value[x] ^short = "Summary conclusion (interpretation/impression)"
