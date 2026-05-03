<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference

## Use Case

> BCR-ABL1 concentration testing is used to monitor the amount of the fusion gene (Philadelphia chromosome) in chronic myeloid leukemia (CML) patients, with results typically reported on an International Scale (%IS) to measure treatment response.

## Data Mapping

| Data Element                       | Cepheid                                | iGene   | LOINC | Units | Reference Range          | HL7 FHIR                                                   | Example                           |
|------------------------------------|----------------------------------------|---------|-------|-------|--------------------------|------------------------------------------------------------|-----------------------------------|
| Variant                            |                                        |         |       |       |                          | Observation.derivedFrom(Variant) - BCR::ABL Major (e14a2/e13a2) |                                   |
| Sample / Specimen (iGene S-Number) | SPM-2                                  | &#9745; |       |       |                          | DiagnosticReport.specimen                                  |                                   |
| Report Number (iGene T-Number)     |                                        | &#9745; |       |       |                          | DiagnosticReport.identifier[PlacerNumber]                  |                                   |                               
| Report Number (Cepheid)            | OBX-1 ??                               |         |       |       |                          | DiagnosticReport.identifier[FillerNumber]                  |                                   |
| Test Start DateTime                | TQ1-7                                  |         |       |       |                          | DiagnosticReport.effectivePeriod.start                     |                                   |
| Test End DateTime                  | TQ1-8                                  |         |       |       |                          | DiagnosticReport.effectivePeriod.end                       |                                   |
| Peformer                           | OBX-1                                  |         |       |       |                          | Observation                                                |                                   |
|                                    | OBX-1 &BCRABL&Xpert BCR-ABL Ultra G2&1 |         |       |       | ??? % (IS) - <br/> e.g. 0.0030-55.00 | ?? Observation.referenceRange                              | INVALID [Too high ABL transcript] | 
|                                    | OBX-2 &BCRABL                          |         |       |       |                          | ?? Observation.code                                        |                                   |
|                                    | OBX-3 &BCRABL BCR-ABL&Ct               |         |       |       |                          | ?? Observation.valueQuantity                               | ^24.2                             |                                                              |
|                                    | OBX-4 &BCRABL BCR-ABL&EndPt            |         |       |       |                          | ?? Observation.component.valueQuantity                     | ^636.0                            |                                                                                              |
|                                    | OBX-5 &BCRABL BCR-ABL&Delta Ct         |         |       |       |                          | ?? Observation.component.valueQuantity                                                           | ^                                 |                                                                                                |
|                                    | OBX-6 &BCRABL ABL&                     |         |       |       |                          | ?? Observation.component.valueQuantity                                                           | FAIL^                             |                                                                                                |
|                                    | OBX-7 &BCRABL ABL&Ct                   |         |       |       |                          | ?? Observation.component.valueQuantity                                                           | ^7.9                              |                                                                                                |
|                                    | OBX-8 &BCRABL ABL&EndPt                |         |       |       |                          | ?? Observation.component.valueQuantity                                                           | ^205.0                            |                                                                                                |

