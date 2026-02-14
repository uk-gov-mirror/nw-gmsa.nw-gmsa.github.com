Profile:        ObservationDiagnosticImplication
Parent:         Observation
Id:             Observation-DiagnosticImplication
Title:          "Observation Diagnostic Implication"
Description:    """
`HL7 Genomics Reporting` Placeholder for [Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* code MS
//* derivedFrom[variant] MS
//* derivedFrom[variant] only Reference(Variant)
//* component[predicted-phenotype] MS
//* component[clinical-significance] MS
