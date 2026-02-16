Profile:        Variant
Parent:         Observation
Id:             Variant
Title:          "Variant (Observation)"
Description:    """
`HL7 Genomics Reporting`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* code = $loinc#69548-6

* component contains gene-studied 0..*
  and representative-transcript-ref-seq 0..*

* component[gene-studied] ^short = "Gene Studied"
* component[gene-studied] ^definition = "The gene(s) on which the variant is located."
* component[gene-studied].code = $LNC#48018-6
* component[gene-studied].code ^short = "48018-6"
* component[gene-studied].value[x] only CodeableConcept
* component[gene-studied].value[x] ^short = "The HGNC gene symbol is to be used as display text and the HGNC gene ID used as the code. If no HGNC code issued for this gene yet, NCBI gene IDs SHALL be used."
* component[gene-studied].value[x] 1..1
* component[gene-studied].value[x] from HGNCVS (extensible)

* component[representative-transcript-ref-seq].code = $LNC#51958-7
* component[representative-transcript-ref-seq].code ^short = "51958-7"
* component[representative-transcript-ref-seq] ^short = "Reference Transcript"
* component[representative-transcript-ref-seq] ^definition = "NCBI's RefSeq ('NM_...'), Ensembl ('ENST...'), and LRG ('LRG...' plus 't1' to indicate transcript)"
* component[representative-transcript-ref-seq].value[x] only CodeableConcept
* component[representative-transcript-ref-seq].value[x] ^binding.strength = #example
* component[representative-transcript-ref-seq].value[x] ^binding.description = "Multiple bindings acceptable (NCBI or LRG)"
* component[representative-transcript-ref-seq].value[x] 1..1
* component[representative-transcript-ref-seq].value[x] ^short = "Versioned transcript reference sequence identifier"
