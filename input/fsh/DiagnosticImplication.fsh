Profile:        DiagnosticImplication
Parent:         Observation
Id:             DiagnosticImplication
Title:          "Diagnostic Implication (Observation)"
Description:    """
`Diagnostic - Genomics` [HL7 Genomics Reporting - DiagnosticImplication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGImplications.fsh

* code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#diagnostic-implication

//* component[predicted-phenotype] MS
//* component[clinical-significance] MS

* component contains
    clinical-significance 0..1 and predicted-phenotype 0..*

* component[clinical-significance] ^short = "Clinical significance"
* component[clinical-significance] ^definition = "The clinical impact of an implication on a person's health. There are dozens if not hundreds of clinical-significance value sets, generally providing an ordinal range of codes from low significance (e.g. 'benign') to high significance (e.g. 'pathogenic', 'oncogenic','predictive of drug response')."
* component[clinical-significance].code = $LNC#53037-8
* component[clinical-significance].code ^short = "53037-8"
* component[clinical-significance].value[x] only CodeableConcept or Quantity
* component[clinical-significance].value[x] 1..1
//* component[clinical-significance].value[x] from http://loinc.org/vs/LL4034-6 (example)
* component[clinical-significance].value[x] ^short = "Pathogenic | Likely pathogenic | Uncertain significance | Likely benign | Benign"

* component[predicted-phenotype] ^short = "Predicted phenotype"
* component[predicted-phenotype] ^definition = "An observable characteristic (e.g., condition; disease) of an individual, as predicted by the presence of associated molecular finding(s)associated with the variant.  A code set is not specified, but it is ideal to use terms related to medical findings. Some examples are SNOMED CT descendants of 'Clinical finding' (404684003), ICD-10-CM chapters 1-18 (codes starting with letters A-R), and/or all of Human Phenotype Ontology (HPO). For example, if an individual's variant is associated with Type I Ehlers-Danlos syndrome, a valid response from SNOMED CT would be 'Ehlers-Danlos syndrome, type 1 (code 83470009)'."
* component[predicted-phenotype].code = $LNC#81259-4
* component[predicted-phenotype].code ^short = "81259-4"
* component[predicted-phenotype].value[x] only CodeableConcept or Quantity
* component[predicted-phenotype].value[x] ^short = "Phenotype code, e.g. from SNOMED CT Clinical finding, ICD-10-CM chapters 1-18, or HPO"
* component[predicted-phenotype].value[x] ^binding.strength = #example
* component[predicted-phenotype].value[x] ^binding.description = "Multiple bindings accepted"
* component[predicted-phenotype].value[x] 1..1
