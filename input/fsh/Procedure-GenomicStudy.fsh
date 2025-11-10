Profile:        ProcedureGenomicStudy
Parent:         Procedure
Id:             Procedure-GenomicStudy
Title:          "Procedure Genomic Study"
Description:    """
<span class="badge badge-primary">Genomic Procedure</span>
"""

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* outcome MS
* outcome from GenomicTestOutcomeCodes
