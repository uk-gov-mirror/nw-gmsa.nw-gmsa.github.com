CodeSystem: NationalHealthIdentifiers
Id: NationalHealthIdentifiers
Title: "UK National Health Identifiers"
Description: """
England/Wales NHS Number, Scotland CHI Number and Northern Ireland Health and Care Number
"""

* ^name = "NationalHealthIdentifiers"
* ^content = #complete
* ^caseSensitive = true
* ^experimental = false
* ^status = #draft
* ^version = "0.0.1"
* ^date = "2025-12-13"

* #https://fhir.nhs.uk/Id/nhs-number "NHS Number"
* #urn:oid:2.16.840.1.113883.2.1.3.2.4.16.53 "CHI Number"
* #https://fhir.nhs.uk/Id/hsc-number "Health and Care Number"
