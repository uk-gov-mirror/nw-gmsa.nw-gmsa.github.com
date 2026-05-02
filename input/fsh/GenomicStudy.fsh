Profile:        GenomicStudy
Parent:         Procedure
Id:             GenomicStudy
Title:          "Genomic Study (Procedure)"
Description:    """
`Diagnostic - Genomics` [HL7 Genomics Reporting - GenomicStudy](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* outcome MS
* outcome from GenomicTestOutcomeCodes
