Profile:        ProcedureGenomicStudy
Parent:         Procedure
Id:             Procedure-GenomicStudy
Title:          "Procedure Genomic Study"
Description:    """
`HL7 Genomics Reporting`
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* outcome MS
* outcome from GenomicTestOutcomeCodes
