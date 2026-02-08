Profile:        SpecimenAccessionNumber
Parent:         CorrelationIdentifier
Id:             SpecimenAccessionNumber
Title:          "Specimen Accession Number"
Description:     """
`Diagnostic Workflow` HL7 IdentifierType: **ACSN** Accession ID
Uniquely identifies a Specimen across multiple laboratory systems.
This is related to [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html) which applies to Imaging Studies.
"""

* ^purpose = """
"""

* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* type = $v2-0203#ACSN
* system ^short = "uri should be defined and unique supplying organisation."
* value 1..1
