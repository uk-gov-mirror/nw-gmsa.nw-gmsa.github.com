ValueSet: SpecimenBodySite
Id: specimen-bodysite
Title: "Specimen Body Site"
Description: """
Intent is to use SNOMED CT [H:7 ValueSet Body Site](https://hl7.org/fhir/R4/valueset-body-site.html)
"""

* ^experimental  = false

* include codes from system https://fhir.nwgenomics.nhs.uk/CodeSystem/ISUBTYPE

