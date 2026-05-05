<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference

1. [openEHR Laboratory analyte result](https://ckm.openehr.org/ckm/archetypes/1013.1.2881)

## Use Case

> BCR-ABL1 concentration testing is used to monitor the amount of the fusion gene (Philadelphia chromosome) in chronic myeloid leukemia (CML) patients, with results typically reported on an International Scale (%IS) to measure treatment response.

## Data Mapping

| Data Element                       | HL7 v2 - Cepheid                       | iGene   | LOINC | openEHR                  | HL7 FHIR                                                | Example                           |
|------------------------------------|----------------------------------------|---------|-------|--------------------------|-----------------------------------------------------------------|-----------------------------------|
| Variant                            |                                        |         |       |                          | Observation.derivedFrom(Variant) - BCR::ABL Major (e14a2/e13a2) |                                   |
| Sample / Specimen (iGene S-Number) | SPM-2                                  | &#9989; |       | Specimen                         | DiagnosticReport.specimen                                       |                                   |
| Report Number (iGene T-Number)     |                                        | &#9989; |       |                          | DiagnosticReport.identifier[PlacerNumber]                       |                                   |                               
| Test Number (Cepheid)              | OBX-1 ??                               |         |       |                          | DiagnosticReport.identifier[FillerNumber]                       |                                   |
| Test Start DateTime                | TQ1-7                                  |         |       | Analysis performed time                         | DiagnosticReport.effectivePeriod.start                          |                                   |
| Test End DateTime                  | TQ1-8                                  |         |       | Analysis performed time                         | DiagnosticReport.effectivePeriod.end                            |                                   |
| Peformer                           | OBX-1-16                               |         |       |                          | Observation.performer                                           |                                   |
| Reference Range                    | OBX-1-7                                |         |       | Reference range guidance | Observation.referenceRange                                      | 0.0030-55.00                      |
| Value                              | OBX-1 &BCRABL&Xpert BCR-ABL Ultra G2&1 |         |       | Analyte result           | Observation.valueQuantity.value (note value is invalid)         | INVALID [Too high ABL transcript] | 
| Unit                               | OBX-1-6                                |         |       |                          | Obsevation.valueQuantity.unit                                   | % (IS)                            |
| Result Code                        | OBX-2 &BCRABL                          |         |       | Analyte name             | Observation.code                                                |                                   |
|                                    | OBX-3 &BCRABL BCR-ABL&Ct               |         |       |                          | ?? Observation.valueQuantity                                    | ^24.2                             |                                                              |
|                                    | OBX-4 &BCRABL BCR-ABL&EndPt            |         |       | Analyte result detail    | ?? Observation.component.valueQuantity                          | ^636.0                            |                                                                                              |
|                                    | OBX-5 &BCRABL BCR-ABL&Delta Ct         |         |       | Analyte result detail    | ?? Observation.component.valueQuantity                          | ^                                 |                                                                                                |
|                                    | OBX-6 &BCRABL ABL&                     |         |       | Analyte result detail    | ?? Observation.component.valueQuantity                          | FAIL^                             |                                                                                                |
|                                    | OBX-7 &BCRABL ABL&Ct                   |         |       | Analyte result detail    | ?? Observation.component.valueQuantity                          | ^7.9                              |                                                                                                |
|                                    | OBX-8 &BCRABL ABL&EndPt                |         |       | Analyte result detail    | ?? Observation.component.valueQuantity                          | ^205.0                            |                                                                                                |
|                                    |                                        |         |       | Test method                         |                                                                 |                                   |
{:grid}

Key LOINC Codes for BCR-ABL:

- [174041-5](https://loinc.org/74041-5): BCR-ABL1 p210 Major Molecular Response [Presence] in Blood or Tissue.
- [21821-4](https://loinc.org/21821-4): BCR-ABL1 fusion transcript [Ratio] in Blood/Tissue.
- [46434-7](https://loinc.org/46434-7): t(9;22)(q34.1;q11)(ABL1,BCR) fusion transcript [Presence] in Blood/Tissue.
- [50195-7](https://loinc.org/50195-7): t(9;22)(q34.1;q11)(ABL1,BCR) fusion transcript [Ratio] in Blood or Tissue by Molecular genetics method.
