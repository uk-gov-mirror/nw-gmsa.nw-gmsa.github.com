Profile:        OrganisationCode
Parent:         CorrelationIdentifier
Id:             OrganisationCode
Title:          "Organisation Code"
Description:     """
`Patient Administration` 'NHS Data Model and Dictionary' [ORGANISATION_CODE](https://www.datadictionary.nhs.uk/attributes/organisation_code.html)
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** Organization.identifier
- **HL7 v2** Extended Composite Name and Identification Number for Organizations (XON.3) and Assigning Authority For Location (PL.11)
- **IHE XDS** author
"""

* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = $ods-code (exactly)
* value 1..1
