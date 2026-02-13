Profile:        ObservationTherapeuticImplication
Parent:         Observation
Id:             Observation-TherapeuticImplication
Title:          "Observation Therapeutic Implication"
Description:    """
`Genomic Observation` Placeholder for [TherapeuticImplication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-therapeutic-implication.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* code MS
//* derivedFrom[variant] MS
//* derivedFrom[variant] only Reference(Variant)
