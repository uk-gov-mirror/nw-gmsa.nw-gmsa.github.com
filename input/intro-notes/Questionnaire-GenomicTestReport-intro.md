## References

- HL7 Europe [DiagnosticReport: Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-DiagnosticReport-eu-lab.html)
- HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
- [openEHR Genomic variant result](https://ckm.openehr.org/ckm/archetypes/1013.1.3759)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)

## Domain Archetype

<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

<div class="alert alert-info" role="alert">
Archetype Viewer <a href="https://project-wildfyre.github.io/domain-archetype/?q=https://nw-gmsa.github.io/Questionnaire-GenomicTestReport.json" target="_blank">Questionnaire-GenomicTestReport.json</a>
</div>

<figure>
{%include LaboratoryReport-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - MindMap</p>
</figure>
<br clear="all">

### Test Detail Mapping

| Entity                                   | LOINC   | Value Set / Data Type                                                                                       | Cardinality | HL7 v2 ORU_RO1 Message  | HL7 FHIR DiagnosticReport | HL7 FHIR Resource (RESTful)                                              |
|------------------------------------------|---------|------------------------------------------------------------------------------------------------|-------------|-------------------------|---------------------------|--------------------------------------------------------------------------|
| Patient                                  |         |                                                                                                | 1..1        | [PID](hl7v2.html#pid)   | subject                   | [Patient](https://nw-gmsa.github.io/R4/StructureDefinition-Patient.html) |
| Case Identification or Visit/Stay Number | 56797-4 | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)    | 0..1        | [PV1](hl7v2.html#pv1)-19 | encounter                 | [Encounter](StructureDefinition-Encounter.html)                          |
| Order Number                             |         | [Placer Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-PlacerOrderNumber.html) | 1..1        | [ORC](hl7v2.html#orc)-2 | basedOn                   | [ServiceRequest](StructureDefinition-ServiceRequest.html)                |
| Report Number                            |         | [Report Number](https://nw-gmsa.github.io/R4/StructureDefinition-ReportNumber.html)            | 1..1        | [OBR](hl7v2.html#obr)-3 | identifier[ReportNumber]  |             |
| Genomic Test Code                        |         | [Genomic Test Code](ValueSet-GenomicTestCodes.html)                                            | 1..1        | [OBR](hl7v2.html#obr)-4 | code                      |                                                                          |
| Report date                              |         |                                                                                                | 1..1        | [OBR](hl7v2.html#obr)-7 | effectiveDateTime         |                                                                          |
| Results Interpreter                      |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)             | 0..*        | [OBR](hl7v2.html#obr)-32 and OBR-33 | resultsInterpreter        | [Practitioner](StructureDefinition-Practitioner.html)                    |                                                                                            
| Performer (operator)                     |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)             | 1..*        | [OBR](hl7v2.html#obr)-34 | performer[operator]       | [Practitioner](StructureDefinition-Practitioner.html)                    |
| Performer (organisation)                 |         | [Organisation Code](StructureDefinition-OrganisationCode.html)                                 | 1..*        |                         | performer[organisation]   | [Organizaton](StructureDefinition-Organizaton.html)                      |
| Specimen                                 | 80398-1 |                                                                                                | 0..1        | [SPM](hl7v2.html#spm)   | specimen                  | [Specimen](StructureDefinition-Specimen.html)                            |

### Results Mapping

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

| Entity                                      | LOINC   | Value Set / Data Type | Example | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 v2 OBX-4 | HL7 FHIR Resource (RESTful)                                                                                                                                                     |
|---------------------------------------------|---------|----------|---------|-------------|------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Narrative Report                            | 51969-4 |          |         | 1..1        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | 1            | DiagnosticReport.presentedForm [Attachment](StructureDefinition-NWAttachment.html) and Binary                                                                                   |
| Gene studied [ID]                           | 48018-6 |          | ACAD9   | 0..1        | [OBX](hl7v2.html#obx)                    | 1.a          | [Observation](StructureDefinition-Observation.html) Profile [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component:gene-studied |

#### Variant Mapping

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

| Entity                                                 | LOINC   | Value Set / Data Type                                                                      | Example                     | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                            |
|--------------------------------------------------------|---------|-------------------------------------------------------------------------------|-----------------------------|-------------|--------------|---------------------------------------------------------------------------------------------------------------------|
| Genomic DNA change g.HGVS                              | 81290-9 |                                                                               | NC_000003.11:g.128625063C>T | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component:genomic-hgvs |
| Genetic variant Assessment                             | 69548-6 | [Variant Assess](https://loinc.org/LL1971-2)                                  | Present                     | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).valueCodeableConcept   |
| Variant analysis method [Type]                         | 81304-8 | [Structural variant analysis method](https://loinc.org/LL4048-6)              | SNP Array                   | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).method                 |
| Genetic sequence variation clinical significance [Imp] | 53037-8 | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6) | Pathogenic                  | 0..1        | 2a           |                       |

### Method 

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

| Entity                                      | LOINC             | Value Set / Data Type                                                                                                            | Example   | Cardinality | HL7 v2 OBX-4 | FHIR Profile                                                                                                                                                                |
|---------------------------------------------|-------------------|---------------------------------------------------------------------------------------------------------------------|-----------|-------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Analysis method [Type]                      | Might be 81304-8  | [Genomic Study Type ValueSet](https://build.fhir.org/ig/HL7/genomics-reporting/ValueSet-genomic-study-type-vs.html) | SNP Array | 0..1        |            | [Procedure - Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).code                                                   |
| Gene disease assessed / Clinical Indication | 51967-8           |                                                                                                                     |           | 1..1        | 1.a        | [Procedure - Genomic Study (NW)](StructureDefinition-Procedure-GenomicStudy.html).reasonCode |
| Genomic Test Outcome                        | TESTCOME (NWGMSA) | [Genomic Test Outcome Codes](ValueSet-GenomicTestOutcomeCodes.html)                                                 |           |             |            | [Procedure - Genomic Study (NW)](StructureDefinition-Procedure-GenomicStudy.html).outcome                                                                                   |                                                                                                                                                                                 |

