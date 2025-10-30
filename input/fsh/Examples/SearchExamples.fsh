Instance: SDCSearchResults
InstanceOf: Bundle
Title:       "Bundle - Form Search Results SDC"
Description: """
Example search results for a form with id of `GenomicTestOrder`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder]])
* insert EntryMatch(Questionnaire, GenomicTestOrder)

Instance: PDQSearchResults
InstanceOf: Bundle
Title:       "Bundle - Patient Search Results by NHS Number PDQ"
Description: """
Example search results for a NHS Number of `9449305552`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552]])
* insert EntryMatch(Patient, Patient-OctaviaCHISLETT-9449305552)

Instance: c39fc97b-e99f-47b2-8660-d3d6b8840d20
InstanceOf: Bundle
Title:       "Bundle - Patient Search Results by Medical Record Number PDQ"
Description: """
Example search results for a MRN Number of `A12356565`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Patient?identifier=A12356565]])
* insert EntryMatch(Patient, Patient-OctaviaCHISLETT-9449305552)


Instance: 187a20ef-9b81-4c83-84f7-140c210f8706
InstanceOf: Bundle
Title:       "Bundle - Genomic Variant for a Patient QEDm"
Description: """
Example search results for a Genomic Variant LOINC `69548-6`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Observation?code=http://loinc.org|69548-6&patient=Patient-Liverpool]])
* insert EntryMatch(Observation, 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)

Instance: 41a20f74-643f-4073-968a-ee003160734f
InstanceOf: Bundle
Title:       "Bundle - Genomic Variant Gene =  NTHL1 QEDm"
Description: """
Example search results for a Genomic Variant Gene = `NTHL1`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Observation?combo-code=http://loinc.org|48018-6&combo-code-value-concept=NTHL1]])
* insert EntryMatch(Observation, 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)