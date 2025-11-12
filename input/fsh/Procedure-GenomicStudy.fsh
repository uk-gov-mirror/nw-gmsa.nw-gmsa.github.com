Profile:        ProcedureGenomicStudy
Parent:         Procedure
Id:             Procedure-GenomicStudy
Title:          "Procedure Genomic Study"
Description:    """
`Genomic Procedure`
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* outcome MS
* outcome from GenomicTestOutcomeCodes
