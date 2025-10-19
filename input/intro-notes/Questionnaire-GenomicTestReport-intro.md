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

### Results

| Entity                    | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 FHIR DiagnosticReport                                                                              | HL7 FHIR Resource (RESTful)                                                |
|---------------------------|-------------|------------------------------------------|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Patient                   | 1..1        | [PID](hl7v2.html#pid)                    | subject                                                                                                | [Patient](https://nw-gmsa.github.io/R4/StructureDefinition-Patient.html)   |
| Episode/Visit/Stay Number | 0..1        | [PV1](hl7v2.html#pv1) PV1-19             | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)            | [Encounter](StructureDefinition-Encounter.html)                            |
| Order Number              | 1..1        | [ORC](hl7v2.html#orc) ORC-3              | basedOn [Filler Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-FillerOrderNumber.html) | [ServiceRequest](StructureDefinition-ServiceRequest.html)                  |
| Genomic Test Code         | 1..1        | [OBR](hl7v2.html#obr) OBR-4              | code [Genomic Test Code](ValueSet-GenomicTestCodes.html)                                               |                                                                            |
| Report date               | 1..1        | [OBR](hl7v2.html#obr) OBR-7              | effectiveDateTime                                                                                      |                                                                            |
| Results Interpreter       | 0..*        | [OBR](hl7v2.html#obr) OBR-32 and OBR-33  | resultsInterpreter [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)  | [Practitioner](StructureDefinition-Practitioner.html)                      |                                                                                            
| Performer (operator)      | 1..*        | [OBR](hl7v2.html#obr) OBR-34             | performer[operator] [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | [Practitioner](StructureDefinition-Practitioner.html)                      |
| Performer (organisation)  | 1..*        |                                          | performer[organisation] [Organisation Code](StructureDefinition-OrganisationCode.html)                 | [Organizaton](StructureDefinition-Organizaton.html)                        |
| Narrative Report          | 1..1        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | presentedForm [Attachment](StructureDefinition-NWAttachment.html)                                      | [DocumentReference](StructureDefinition-DocumentReference.html) and Binary |
| Results                   | 1..1        | [OBX](hl7v2.html#obx)                    | result            | [Observation](StructureDefinition-Observation.html)                        |
