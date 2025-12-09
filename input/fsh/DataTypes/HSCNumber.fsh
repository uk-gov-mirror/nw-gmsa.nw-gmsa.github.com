Profile:        HSCNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             HSCNumber
Title:          "Health and Care Number"
Description:     """
`NHS Data Model and Dictionary` [HEALTH AND CARE NUMBER](https://www.datadictionary.nhs.uk/attributes/health_and_care_number.html)
"""

* ^purpose = """
"""
* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = "https://fhir.nhs.uk/Id/hsc-number"
* value 1..1
* type = $v2-0203#NH (exactly)
