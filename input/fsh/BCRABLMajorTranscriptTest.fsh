Profile:        BCRABLMajorTranscript
Parent:         Observation
Id:             BCRABLMajorTranscript
Title:          "BCR::ABL major transcript (Observation)"
Description:    """
`Diagnostic - Genomics Test`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* derivedFrom only Reference(Variant)
