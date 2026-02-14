Profile:        ObservationVariant
Parent:         Observation
Id:             Observation-Variant
Title:          "Observation Variant"
Description:    """
`HL7 Genomics Reporting` Placeholder for [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* code = $loinc#69548-6

//* code MS
//* valueCodeableConcept MS
//* method MS
//* component[allelic-state] MS
//* component[representative-coding-hgvs] MS
//* component[genomic-ref-seq] MS

