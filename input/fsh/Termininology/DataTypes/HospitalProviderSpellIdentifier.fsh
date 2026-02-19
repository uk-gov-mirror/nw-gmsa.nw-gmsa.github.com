Profile:        HospitalProviderSpellIdentifier
Parent:         CorrelationIdentifier
Id:             HospitalProviderSpellIdentifier
Title:          "Hospital Provider Spell Identifier"
Description:     """
`Patient Administration` HL7 IdentifierType: **AN** Account Number
'NHS Data Model and Dictionary' [HOSPITAL PROVIDER SPELL IDENTIFIER](https://www.datadictionary.nhs.uk/data_elements/hospital_provider_spell_identifier.html)
Accession ID
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** Encounter.identifier and EpisodeOfCare.identifier (type = AN)
- **HL7 v2** Visit Number (PV1-19). See also [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) PV1 documentation.
"""

* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* type = $v2-0203#AN "Account number"
* assigner 1..1



