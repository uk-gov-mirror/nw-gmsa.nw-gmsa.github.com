## References

- HL7 Europe [ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- Prior Results (Oncology)
    - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Assessment](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html)

## Domain Archetype

<div class="alert alert-info" role="alert">
Archetype Viewer <a href="https://project-wildfyre.github.io/domain-archetype/?q=https://nw-gmsa.github.io/Questionnaire-GenomicTestOrder.json" target="_blank">Questionnaire-GenomicTestOrder.json</a>
</div>

<figure>
{%include Laboratory-Order-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomic Test Order Sections</p>
</figure>
<br clear="all"> 


| Entity                          | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR ServiceRequest                                                                                                           | HL7 FHIR Resource (Message + RESTful)                                    |
|---------------------------------|-------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Patient                         | 1..1        | [PID](hl7v2.html#pid)             | subject                                                                                                                           | [Patient](https://nw-gmsa.github.io/R4/StructureDefinition-Patient.html) |
| Episode/Visit/Stay Number       | 0..1        | [PV1](hl7v2.html#pv1) PV1-19      | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)                                                                           | [Encounter](StructureDefinition-Encounter.html)                          |
| Filler Order Number             | 1..1        | [ORC](hl7v2.html#orc) ORC-2       | identifier [Placer Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-PlacerOrderNumber.html)                         |                                                                          |
| Filler Order Number             | 1..1        | [ORC](hl7v2.html#orc) ORC-3       | identifier [Filler Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-FillerOrderNumber.html)                         |                                                                          |
| Genomic Test Code               | 1..1        | [OBR](hl7v2.html#obr) OBR-4       | code [Genomic Test Directory](https://nw-gmsa.github.io/R4/ValueSet-genomic-test-directory.html)                                  |                                                                          |
| Order date                      | 1..1        | [ORC](hl7v2.html#orc) ORC-9       | authoredOn                                                                                                                        |                                                                          |
| Ordering Practitioner           | 1..1        | [ORC](hl7v2.html#orc) ORC-12      | requester[PractitionerRole].practitoner [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | [PractitionerRole](StructureDefinition-PractitionerRole.html)            |                                                                                            
| Ordering Facility               | 1..1        | [ORC](hl7v2.html#orc) ORC-21      | requester[PractitionerRole].organization [Organisation Code](StructureDefinition-OrganisationCode.html)                           | [PractitionerRole](StructureDefinition-PractitionerRole.html)            |
| performer                       | 0..1        | implied by destination of message | performer [Organisation Code](StructureDefinition-OrganisationCode.html)                                                          | [Organization](StructureDefinition-Organization.html)                    | 
| Ask At Order Entry Questions    | 0..*        | [OBX](hl7v2.html#obx)             | supportingInfo                                                                                                                    | [Observation](StructureDefinition-Observation.html)                      | 
| CITT code (Suspected Condition) | *..*        | [DG1](hl7v2.html#dg1) DG1-3       | reasonCode [Genomic Condition Codes](ValueSet-genomic-condition-codes.html)                                                       |                                                                          |
| Specimen                        | 0..*        | [SPM](hl7v2.html#spm)             | specimen                                                                                                                          | [Specimen](StructureDefinition-Specimen.html)                            |


