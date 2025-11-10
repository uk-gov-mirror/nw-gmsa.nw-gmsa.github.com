Profile:        Encounter
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Encounter
Id:             Encounter
Title:          "Encounter"
Description:    """
`Patient Administration`
"""

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

* hospitalization.admitSource from AdmissionSource
* hospitalization.dischargeDisposition from DischargeDisposition

* serviceProvider 0..1
* serviceProvider.identifier only OrganisationCode
