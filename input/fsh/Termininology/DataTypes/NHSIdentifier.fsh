Profile:        NHSIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             NHSIdentifier
Title:          "NHS Identifier"
Description:     """
`Patient Administration` HL7 IdentifierType: **NH** National Health Plan Identifier
`NHS Data Model and Dictionary` England/Wales [NHS NUMBER](https://www.datadictionary.nhs.uk/attributes/nhs_number.html), Northern Ireland [HEALTH AND CARE NUMBER](https://www.datadictionary.nhs.uk/data_elements/health_and_care_number.html) and Scotland [COMMUNITY HEALTH INDEX NUMBER](https://www.datadictionary.nhs.uk/attributes/community_health_index_number.html)
Only traced NHS Number **SHOULD** be used, un-traced NHS Numbers **MUST** be clearly indicated.
"""

* ^purpose = """
"""
* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system from UKNationalHealthIdentifiers
* value 1..1
* type = $v2-0203#NH (exactly)
