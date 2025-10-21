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

## Test Detail Mapping

| Entity                                                | LOINC   | Value Set / Data Type                                                                          | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR ServiceRequest       | HL7 FHIR Resource (Message + RESTful)                                            |
|-------------------------------------------------------|---------|------------------------------------------------------------------------------------------------|-------------|-----------------------------------|-------------------------------|----------------------------------------------------------------------------------|
| Patient                                               |         |                                                                                                | 1..1        | [PID](hl7v2.html#pid)             | subject                       | [Patient](https://nw-gmsa.github.io/R4/StructureDefinition-Patient.html)         |
| Case Identification or Episode/Visit/Stay Number      |         | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)    | 0..1        | [PV1](hl7v2.html#pv1)-19          |                               | [Encounter](StructureDefinition-Encounter.html).identifier                       |
| Filler Order Number                                   |         | [Placer Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-PlacerOrderNumber.html) | 1..1        | [ORC](hl7v2.html#orc)-2           | identifier[PlacerOrderNumber] |                                                                                  |
| Filler Order Number                                   |         | [Filler Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-FillerOrderNumber.html) | 1..1        | [ORC](hl7v2.html#orc)-3           | identifier[FillerOrderNumber] |                                                                                  |
| Genomic Test Code                                     |         | [Genomic Test Directory](https://nw-gmsa.github.io/R4/ValueSet-genomic-test-directory.html)    | 1..1        | [OBR](hl7v2.html#obr)-4           | code                          |                                                                                  |
| Order date                                            |         |                                                                                                | 1..1        | [ORC](hl7v2.html#orc)-9       | authoredOn                    |                                                                                  |
| Ordering Practitioner                                 |         |                                                                                                | 1..1        | [ORC](hl7v2.html#orc)-12          | requester[PractitionerRole]   | [PractitionerRole](StructureDefinition-PractitionerRole.html).practitoner        |                                                                                            
| Ordering Facility                                     |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)             | 1..1        | [ORC](hl7v2.html#orc)-21          | requester[PractitionerRole]   | [PractitionerRole](StructureDefinition-PractitionerRole.html).organization       |
| performer                                             |         | [Organisation Code](StructureDefinition-OrganisationCode.html)                                 | 0..1        | implied by destination of message | performer                     | [Organization](StructureDefinition-Organization.html)                            |
| Clinical Indication / CITT code (Suspected Condition) |         | [Genomic Condition Codes](ValueSet-genomic-condition-codes.html)                               | *..*        | [DG1](hl7v2.html#dg1)-3           | reasonCode                    |                                                                                  |
| Specimen ID                                           | 80398-1 |                                                                                                | 0..*        | [SPM](hl7v2.html#spm)             | specimen                      | [Specimen](StructureDefinition-Specimen.html).identifier[PlacerSpecimenNumber]   |
| Specimen Accession Number                             | 80398-1 |                                                                                                | 0..*        | [SPM](hl7v2.html#spm)             | specimen                      | [Specimen](StructureDefinition-Specimen.html).accessionIdentifier                |
| Shipment Tracking Number                              | 97209-1 |                                                                                                |             |                                   |                               | [Specimen](StructureDefinition-Specimen.html).identifier[ShipmentTrackingNumber] |                                                                                |

