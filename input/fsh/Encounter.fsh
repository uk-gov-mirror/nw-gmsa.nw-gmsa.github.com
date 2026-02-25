Profile:        Encounter
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Encounter
Id:             Encounter
Title:          "Encounter"
Description:    """
`Patient Administration` `Base`, for implementation see
- [Hospital Spell](StructureDefinition-HospitalSpell.html) - an admission (inpatient or outpatient)
- [Visit](StructureDefinition-Visit.html) - an A&E attendance, a community contract, an OP attendance (Appointment), etc
"""

* ^keyword[+] = #core "Base"
* ^keyword[+] = #pam "Patient Administration"


* identifier 1..* MS

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false

* identifier contains
  GS1SRIN 0..1 MS

* identifier[GS1SRIN] only GS1SRIN

* class 1..1
* type 0..1
* type from AdmissionMethod
* serviceType 0..1 MS
* serviceType from Service

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSIdentifier

* location.location only Reference(Location)
* location.location.identifier only OrganisationSiteIdentifier

* period
* participant
* identifier.value MS
* period.start

* hospitalization.admitSource from AdmissionSource
* hospitalization.dischargeDisposition from DischargeDisposition

* serviceProvider 0..1
* serviceProvider.identifier only OrganisationCode
