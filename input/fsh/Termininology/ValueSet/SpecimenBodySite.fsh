ValueSet: SpecimenBodySite
Id: specimen-bodysite
Title: "Specimen Body Site"
Description: """
A subset of [HL7 Europe Laboratory Report ValueSet: Specimen Types](https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-specimenType-eu-lab.html)
"""

* ^experimental  = false

* include codes from system https://fhir.hl7.org.uk/CodeSystem/ISUBTYPE
