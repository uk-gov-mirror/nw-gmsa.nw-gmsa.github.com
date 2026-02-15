Profile:        ObservationDiagnosticImplication
Parent:         Observation
Id:             Observation-DiagnosticImplication
Title:          "Observation Diagnostic Implication"
Description:    """
`HL7 Genomics Reporting`
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#diagnostic-implication
//* derivedFrom[variant] MS
//* derivedFrom[variant] only Reference(Variant)
//* component[predicted-phenotype] MS
//* component[clinical-significance] MS
