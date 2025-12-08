Profile:        CHINumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             CHINumber
Title:          "CHI Number"
Description:     """
`NHS Data Model and Dictionary` [COMMUNITY HEALTH INDEX NUMBER](https://www.datadictionary.nhs.uk/attributes/community_health_index_number.html)
"""

* ^purpose = """
"""
* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = "urn:oid:2.16.840.1.113883.2.1.3.2.4.16.53"
* value 1..1
* type = $v2-0203#NH (exactly)
