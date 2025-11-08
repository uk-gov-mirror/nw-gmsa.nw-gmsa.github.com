Profile:        PractitionerRole
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-PractitionerRole
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/PractitionerRole-eu-lab
Parent:         http://hl7.org/fhir/StructureDefinition/PractitionerRole
Id:             PractitionerRole
Title:          "PractitionerRole"
Description:    """
`Patient Admin`
"""

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

