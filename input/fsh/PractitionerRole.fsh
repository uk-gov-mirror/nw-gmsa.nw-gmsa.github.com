Profile:        PractitionerRole
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-PractitionerRole
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/PractitionerRole-eu-lab
//Parent:         http://hl7.org/fhir/StructureDefinition/PractitionerRole
Parent:         http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu-core
Id:             PractitionerRole
Title:          "PractitionerRole"
Description:    """
`Care Directory` [HL7 Europe Core - PractitionerRole](http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu-core)
"""
* ^keyword[+] = #core "Core"
* ^keyword[+] = #cds "Care Directory"

* practitioner 1..1 MS
//* practitioner.identifier 1..1
* practitioner.identifier only PractitionerIdentifier
* practitioner.identifier.value MS
* practitioner.display MS

* organization 1..1 MS
* organization.identifier 1..1
* organization.identifier only OrganisationCode
* organization.identifier.value MS
* organization.display MS

* specialty from Specialty

* telecom.value MS

