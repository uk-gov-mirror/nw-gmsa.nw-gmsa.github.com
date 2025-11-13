## References

- A. [HL7 Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) (HL7 v2,5,1)
- B. HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) (HL7 FHIR)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- C. [openEHR Genomics Project](https://ckm.openehr.org/ckm/projects/1013.30.50)
- D. [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)

## Domain Archetype

<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

<div class="alert alert-info" role="alert">
Archetype Viewer <a href="https://project-wildfyre.github.io/domain-archetype/?q=https://nw-gmsa.github.io/Questionnaire-GenomicTestReport.json" target="_blank">Questionnaire-GenomicTestReport</a>
</div>

<figure>
{%include LaboratoryReport-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - MindMap</p>
</figure>
<br clear="all">

### Diagnostic Report

Metadata is data that applies to the patient's entire clinical pathway and so it extends beyond diagnostic tests.
Test detail tends to be common across all diagnostic tests in a patient's pathway, not just genomics.

<span class="badge badge-info">Patient Administration</span>

| Name                                     | LOINC   | Value Set / Data Type                                                                                                  | Cardinality | HL7 v2 ORU_RO1 Message   | HL7 FHIR DiagnosticReport                                                          | HL7 FHIR Resource (RESTful)                                       |
|------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------|-------------|--------------------------|------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Patient                                  |         | [NHS Number](StructureDefinition-NHSNumber.html) [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 1..1        | [PID](hl7v2.html#pid)    | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).subject.identifier              | [Patient](StructureDefinition-Patient.html)                       |
| Case Identification or Visit/Stay Number | 56797-4 | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)                            | 0..1        | [PV1](hl7v2.html#pv1)-19 | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).encounter.identifier | Encounter [HospitalSpell](StructureDefinition-HospitalSpell.html) |

<span class="badge badge-primary">Diagnostic Workflow</span>

| Name                     | LOINC   | Value Set / Data Type                                                              | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 FHIR DiagnosticReport                                                              | HL7 FHIR Resource (RESTful)                               |
|--------------------------|---------|------------------------------------------------------------------------------------|-------------|------------------------------------------|----------------------------------------------------------------------------------------|-----------------------------------------------------------|
| Order Number             |         | [Placer Order Number](https://nw-gmsa.github.io/R4/PlacerOrderNumber.html)         | 1..1        | [ORC](hl7v2.html#orc)-2                  | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).basedOn                  | [ServiceRequest](StructureDefinition-ServiceRequest.html) |
| Report Number            |         | [Report Number](StructureDefinition-ReportNumber.html)                             | 1..1        | [OBR](hl7v2.html#obr)-3                  | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).identifier[ReportNumber] |                                                           |
| Order Code               |         | See below                                                                          | 1..1        | [OBR](hl7v2.html#obr)-4                  | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).code                     |                                                           |
| Report date              |         |                                                                                    | 1..1        | [OBR](hl7v2.html#obr)-7                  | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).effectiveDateTime        |                                                           |
| Results Interpreter      |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 0..*        | [OBR](hl7v2.html#obr)-32 and OBR-33      | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).resultsInterpreter       | [Practitioner](StructureDefinition-Practitioner.html)     |                                                                                            
| Performer (operator)     |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 1..*        | [OBR](hl7v2.html#obr)-34                 | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).performer[operator]      | [Practitioner](StructureDefinition-Practitioner.html)     |
| Performer (organisation) |         | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 1..*        |                                          | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).performer[organisation]  | [Organizaton](StructureDefinition-Organizaton.html)       |
| Specimen                 | 80398-1 | See [Genomic Test Order - Specimen](Questionnaire-GenomicTestOrder.html#specimen)                                              | 0..1        | [SPM](hl7v2.html#spm)                    | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).specimen.identifier                 | [Specimen](StructureDefinition-Specimen.html)             |
| Results                  |         | Domain specific - see below                                                        | 0..*        | [OBX](hl7v2.html#obx)                    | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).results                  | Varies                                                    |   
| Narrative Report         |         | Domain specific - see below                                                        | 0..*        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).presentedForm            |                                                           |

<span class="badge badge-primary">Genomic Observation </span>

| Name                           | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 ORU_RO1 Message              | HL7 FHIR DiagnosticReport                                                               | HL7 FHIR Resource (RESTful)                               |
|--------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|-------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------|
| Order Code - Genomic Test Code |         | [Genomic Test Code](ValueSet-GenomicTestCodes.html)                                         | 1..1        | [OBR](hl7v2.html#obr)-4             | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).code                      |                                                           |


<div class="alert alert-info" role="alert">
<b>HL7 FHIR Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-report.html" _target="_blank">Genomic Report</a> 
<br/>
<b>Localised (NW Genomics) version:</b> <a href="StructureDefinition-DiagnosticReport" _target="_blank">DiagnosticReport</a> 
</div>

### Results Mapping

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

Results section is specific to genomics and is focused on the requirements of general clinicians, not genomic specialists. For this reason this section will tend to be an extract of the wider genomics reporting specifications.

```mermaid
classDiagram
    class GenomicReport["Genomic Laboratory Report (result)"]
    class Variant
    class GenomicStudy["Genomic Study"]
    class DiagnosticImplication["Diagnostic Implication"]
    class TherapeuticImplication["Therapeutic Implication"]
    class GenomicStudyAnalysis["Genomic Study Analysis"]

    Variant --|> GenomicReport 
    GenomicStudy --|> GenomicReport
    GenomicStudyAnalysis --|> GenomicReport
    DiagnosticImplication --|> GenomicReport
    TherapeuticImplication ..|> GenomicReport
    Variant <|--|> DiagnosticImplication
    Variant <|..|> TherapeuticImplication
```

A more detailed mapping of the results section of the laboratory report, see [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/general.html)


| Name              | LOINC   | Value Set / Data Type | Example | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 v2 OBX-4 | HL7 FHIR Resource (RESTful)                                                                                                                                                     |
|-------------------|---------|----------|---------|-------------|------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Narrative Report  | 51969-4 |          |         | 1..1        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | 1            | DiagnosticReport.presentedForm [Attachment](StructureDefinition-NWAttachment.html) and Binary                                                                                   |
| Gene studied [ID] | 48018-6 |          | ACAD9   | 0..1        | [OBX](hl7v2.html#obx)                    | 1.a          | [Observation](StructureDefinition-Observation.html) Profile [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component:gene-studied |

### Genomic Study

Description: [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-study)

#### Genomic Study

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

<span class="badge badge-primary">Genomic Observation </span>

See also [HL7 Genomic Reporting - Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html)

| Name                                        | LOINC             | Value Set / Data Type                                                                                                            | Example   | Cardinality | HL7 v2 OBX-4 | FHIR Profile                                                                                                                  |
|---------------------------------------------|-------------------|---------------------------------------------------------------------------------------------------------------------|-----------|-------------|------------|-------------------------------------------------------------------------------------------------------------------------------|
| Analysis method [Type]                      | Might be 81304-8  | [Genomic Study Type ValueSet](https://build.fhir.org/ig/HL7/genomics-reporting/ValueSet-genomic-study-type-vs.html) | SNP Array | 0..1        |            | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).code  |
| Gene disease assessed / Clinical Indication | 51967-8           |                                                                                                                     |           | 1..1        | 1.a        | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).reasonCode                                                                    |
| Genomic Test Outcome                        | TESTCOME (NWGMSA) | [Genomic Test Outcome Codes](ValueSet-GenomicTestOutcomeCodes.html)                                                 |           |             |            | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).outcome                                                                       |                                                                                                                                                                                 |

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Genomic Reporting:</b> <a href="https://hl7.org/fhir/uv/genomics-reporting/StructureDefinition-genomic-study.html" _target="_blank">Genomic Study</a> 
<br/>
<b>Localised (NW Genomics) version:</b> <a href="StructureDefinition-Procedure-GenomicStudy.html" _target="_blank">Procedure Genomic Study</a> 
</div>

#### Genomic Study Analysis

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

<span class="badge badge-primary">Genomic Observation </span>

TBC - This includes Gene studied [ID] (48018-6) and Gene mutations tested (36908-2). Maybe a requirement from oncology.
This appears to be part of [FHIR R6 GenomicStudy](https://build.fhir.org/genomicstudy.html)

| Name                        | LOINC   | Value Set / Data Type                               | Example | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                                   |
|-----------------------------|---------|-----------------------------------------------------|---------|-------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| regions                     |         |                                                     |         |             |              | [Genomic Study Analysis ](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[regions]             |
| Genomic source class [Type] | 48002-0 | [Genetic variant source](https://loinc.org/LL378-1) | Somatic | 0..1        |            | [Genomic Study Analysis](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[genomic-source-class] |
| specimen                    |         |                                                     |         |             |           | [Genomic Study Analysis](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[specimen]             |

### Findings / Observations

Description: [Genomic Observations](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-observations)

#### Variant

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

<span class="badge badge-primary">Genomic Observation </span>

| Name                                       | LOINC   | Value Set / Data Type                                                                                                                                      | Example                     | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                  |
|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|-------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Gene studied [ID]                          | 48018-6 |                                                                                                                                                            | ACAD9                       | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[gene-studied]                      |
| Genomic DNA change g.HGVS                  | 81290-9 |                                                                                                                                                            | NC_000003.11:g.128625063C>T | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[genomic-hgvs]                      |
| Transcript reference sequence [Identifier] | 51958-7 |                                                                                                                                                            | NM_014049.4                 | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[representative-transcript-ref-seq] |
| Genetic variant Assessment                 | 69548-6 | [Variant Assess](https://loinc.org/LL1971-2)                                                                                                               | Present                     | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).valueCodeableConcept                         |
| Variant analysis method [Type]             | 81304-8 | [Structural variant analysis method](https://loinc.org/LL4048-6)                                                                                           | SNP Array                   | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).method                                       |
| Genomic source class [Type]                | 48002-0 | [Genetic variant source](https://loinc.org/LL378-1)                                                                                                        | Somatic                     | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[genomic-source-class]              |
| DNA change type                            | 48019-4 | [LOINC DNA change type](https://loinc.org/48019-4) or [DNA Change Type](https://build.fhir.org/ig/HL7/genomics-reporting/ValueSet-dna-change-type-vs.html) | Substitution                | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[coding-change-type]                |
| Allelic state                              | 53034-5 | [Genetic variant allelic state](https://loinc.org/LL381-5)                                                                                                 | Heterozygous                | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[allelic-state]                     |
| Genomic ref allele [ID]                    | 69547-8 |                                                                                                                                                            | C                           | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[ref-allele]                        | 
| Allelic phase                              | 82120-7 | [Allelic phase](https://loinc.org/LL4025-4)                                                                                                                | Maternal                    | 0..1        | 2a           | See 94186-4 below?                                                                                                                        |
| Origin of germline genetic variant [Type]  | 94186-4 | [Origin of Genetic Variance](https://loinc.org/LL5489-1)                                                                                                   | Maternal                    | 0..1        | - n/a        | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[variant-inheritance]               |

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html" _target="_blank">Variant</a> 
<br/>
<b>Localised (NW Genomics) version:</b> <a href="StructureDefinition-Observation-Variant.html" _target="_blank">Observation Variant</a> 
</div>


### Implications

Description: [Genomic Implications](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-implications)

#### Diagnostic Implication

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

<span class="badge badge-primary">Genomic Observation </span>

| Name                                                   | LOINC   | Value Set / Data Type                                                                                                                                                                                                                                           | Example        | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                                    |
|--------------------------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|-------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Genetic sequence variation clinical significance [Imp] | 53037-8 | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6)                                                                                                                                                                                   | Pathogenic    | 0..1        | 2a           | [Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html).component[clinical-significance] |
| Probable Associated Phenotype                          | 81259-4 | NHS England [Genomic Clinical Indication Codes](ValueSet-GenomicClinicalIndicationCodes.html) <br/> ?? [SNOMED Genomic Disorder Carrier](ValueSet-GenomicDisorderCarrier.html) <br/> ?? [SNOMED Genetic Finding Detected](ValueSet-GenomicFindingDetected.html) | Lynch syndrome | 0..1        | 2a           | [Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html).component[predicted-phenotype]   |

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Genomic Reporting:</b> <a href="https://hl7.org/fhir/uv/genomics-reporting/StructureDefinition-diagnostic-implication.html" _target="_blank">Diagnostic Implication</a> 
<br/>
<b>Localised (NW Genomics) version:</b> <a href="StructureDefinition-Observation-DiagnosticImplication.html" _target="_blank">Observation Diagnostic Implication</a> 
</div>

## Examples

### Inherited MMR deficiency (Lynch syndrome) - R210

HL7 LRI (Ref A) Example 2 (5.9.1.2) - FOUND DISCRETE – TARGETED MUTATIONS ANALYSIS THAT STUDIES MANY MUTATIONS (106) 

- [Patient LIVERPOOL](Patient-Patient-Liverpool.html) <span class="badge badge-info">Patient Administration</span>
- [Genomic Study- Inherited MMR deficiency (Lynch syndrome)](Procedure-f0036554-cd1a-463c-ac8a-d891ca409af9.html) <span class="badge badge-primary">Genomics</span>
- [Diagnostic Implication - Lynch syndrome](Observation-6beb613f-d303-42af-b025-86e8e0872061.html) <span class="badge badge-primary">Genomics</span>
- [Variant NTHL1](Observation-8385c2fd-313d-4fd5-b98e-d5ea4bae6f99.html) <span class="badge badge-primary">Genomics</span>

#### Primary or Secondary Care Examples

- [Condition - Lynch syndrome](Condition-c8f82825-e4cb-4e1f-b728-3fd2808e93db.html) <span class="badge badge-secondary">Patient Care</span>
- [Observation - Lynch Syndrome Mutation Finding](Observation-4490c092-c78c-480a-8cb7-653b70113fd5.html) <span class="badge badge-secondary">Patient Care</span>

#### Genetic Counseling Examples

- [FamilyMemberHistory - Son Patient Leeds](FamilyMemberHistory-074ea905-8d91-452c-af3c-15b5b860fdb2.html) <span class="badge badge-secondary">Patient Care</span>
- [FamilyMemberHistory - Mother Patient Nottingham](FamilyMemberHistory-c76b8bc2-ec36-4ce1-a2ea-8c57215115e2.html) <span class="badge badge-secondary">Patient Care</span>

### Cystic fibrosis Carrier R184

HL7 LRI (Ref A) Example 3 (5.9.1.3)  - SIMPLE VARIANT – MUTATION ANALYSIS WITH SEQUENCE PLUS DELETION-DUPLICATION STUDY

- [Patient LANCASTER](Patient-Patient-Lancaster.html) <span class="badge badge-info">Patient Administration</span>
- [RelatedPerson](StructureDefinition-RelatedPerson-examples.html)  <span class="badge badge-info">Patient Administration</span>
- [Genomic Study - Cystic fibrosis carrier testing](Procedure-7b362aa5-41a7-4168-94b4-f12dff0dfb2a.html) <span class="badge badge-primary">Genomics</span>
- [Diagnostic Implication - Cystic Fibrosis Carrier](Observation-a954a98c-f427-4968-9022-8b760de66628.html) <span class="badge badge-primary">Genomics</span>
- [Variant CFTR](Observation-bca547c1-78a5-41be-8cfc-03c05805ac85.html) <span class="badge badge-primary">Genomics</span>

