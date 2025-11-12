Profile:        Organization
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Organization
Id:             Organization
Title:          "Organization"
Description:    """
`Care Directory`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #cds "Care Directory"

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1

* identifier[odsOrganisationCode] only OrganisationCode
* identifier[odsSiteCode] ^short = "DO NOT USE. Sites are to be handled as Locations."
