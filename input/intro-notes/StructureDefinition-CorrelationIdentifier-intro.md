## Reference

- [Rule 3: Reference Other Aggregates by Identity (Implementing Domain Driven Design)](https://www.archi-lab.io/infopages/ddd/aggregate-design-rules-vernon.html#rule-3-reference-other-aggregates-by-identity) 
- [Enterprise Integration Patterns - Correlation Identifier](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html).

## Overview

Identifiers are used to identify entities in HL7 v2 and FHIR, in point to point messaging they are used to correlate messages between systems, typically two systems in the same organisation.

The Regional Integration and Clinical Data Repository are scaling this to support Genomic Data accross the UK. In order to support this the following data contract for identifiers are proposed:

## Data Contract

### [EI - Entity Identifier](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/EI)

| Field             | Optionality | Example Placer                    | Example Filler | HL7 FHIR Identifier | HL7 v2 EI              |                                                                                 |
|-------------------|-------------|-----------------------------------|----------------|---------------------|------------------------|---------------------------------------------------------------------------------|
| Entity Identifier | 1..1        | ABC123                            | T25-8ZEA       | Identifier.value    | EI.1                   |                                                                                 |
| Namespace Id      | 1..1        | ROA-EPI                           | 699X0          |                     | EI.2                   |                                                                                 |
| Universal Id      | 0..1        | https://nw-gmsa.github.io/Id/PLAC |                | Identifier.system   | EI.3                   | The example used here is a generic value, NHS Trusts should supply actual value |
| Universal Id Type | 0..1        | URI                               |                |                     | EI.4 fixed value `URI` |                                                                                 |

#### Example

HL7 v2 

```
1029467053^ROA-EPIC^https://nw-gmsa.github.io/Id/PLAC^URI|T25-8ZEA^699X0
```

HL7 FHIR

```
    "identifier": [
          {
            "assigner": {
              "identifier": {
                "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                "value": "699X0"
              }
            },
            "system": "https://fhir.north-west.england.nhs.uk/iGene/ReportIdentifier",
            "type": {
              "coding": [
                {
                  "code": "FILL",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "T25-8ZEA"
          },
          {
            "system": "https://nw-gmsa.github.io/Id/PLAC",
            "type": {
              "coding": [
                {
                  "code": "PLAC",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "1029467053"
          }
        ],
```

where ROA is the ODS code for Manchester University NHS Foundation Trust and 699XO is the ODS code from NW Region GLH

### [CX - Extended Composite ID with Check Digit](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/CX)

| Field                | Optionality | Example NHS Number | Example MRN | HL7 FHIR Identifier       | HL7 v2 CX | Notes                                                                                                                                                                                            |
|----------------------|-------------|--------------------|-------------|---------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Id Number            | 1..1        | 921 906 8409       | 12067204    | Identifier.value          | CX.1      |                                                                                                                                                                                                  |
| Assigning Authority  | 1..1        | NHS                | ROA         | Identifier.assigner.value | CX.4      | For MRN the assigning authority shall be the NHS Trust ODS Code. <br/><br/>For NHS identifiers valid values are <br/> NHS - England and Wales <br/> HSNI - Northern Ireland <br/> CHI - Scotland |
| Identifier Type Code | 1..1        | NH                 | MR          | Identifier.type           | CX.5      |                                                                                                                                                                                                  |


#### Example

HL7 v2 

```
9219068409^^^NHS^NH~12067204^^^R0A^MR
```

HL7 FHIR 

```json
"identifier": [
          {
            "system": "https://fhir.nhs.uk/Id/nhs-number",
            "type": {
              "coding": [
                {
                  "code": "NH",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "9219068409"
          },
          {
            "assigner": {
              "identifier": {
                "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                "value": "R0A"
              }
            },
            "system": "https://nw-gmsa.github.io/Id/MR",
            "type": {
              "coding": [
                {
                  "code": "MR",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "12067204"
          }
        ]
```

where ROA is the ODS code for Manchester University NHS Foundation Trust
