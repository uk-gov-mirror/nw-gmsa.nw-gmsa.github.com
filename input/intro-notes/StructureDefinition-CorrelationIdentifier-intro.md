## Reference

- [Rule 3: Reference Other Aggregates by Identity (Implementing Domain Driven Design)](https://www.archi-lab.io/infopages/ddd/aggregate-design-rules-vernon.html#rule-3-reference-other-aggregates-by-identity) 
- [Enterprise Integration Patterns - Correlation Identifier](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html).

## Overview

Identifiers play a central role in both HL7 v2 and FHIR, enabling systems to uniquely reference and track entities such as patients, samples, orders, and clinical documents. In traditional point-to-point messaging, these identifiers are primarily used to correlate and reconcile messages exchanged between two systems—often those operating within the same organisation.

As the Regional Integration and Clinical Data Repository evolves to support genomic data exchange at a national scale, the demands placed on identifier management increase significantly. Genomic workflows involve multiple laboratories, platforms, and services distributed across the UK, all of which must consistently recognise and reference the same entities throughout complex end-to-end processes.

To meet these needs, a standardised and interoperable identifier model is required—one that ensures traceability, prevents collisions, supports cross-organisation communication, and aligns with national data-sharing patterns.

The following identifier data contract is therefore proposed to underpin the reliable exchange, correlation, and lifecycle management of genomic data across the UK health ecosystem.

## Correlation Identifier Data Contract

### [HL7 v2 EI - Entity Identifier](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/EI)

Used in HL7 v2 ORC, SPM and OBR, and FHIR ServiceRequest, Specimen and DiagnosticReport.

| Field             | Optionality | Example Placer                    | Example Filler | HL7 FHIR Identifier | HL7 v2 EI                                                |                                                                                                                                                                                                                             |
|-------------------|-------------|-----------------------------------|----------------|---------------------|----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Entity Identifier | 1..1        | 1012233558                           | T25-8ZEA       | Identifier.value    | EI.1                                                     |                                                                                                                                                                                                                             |
| Namespace Id      | 1..1        | ROA-EPI                           | 699X0-iGene    |                     | EI.2                                                     | This field is ODS code plus an existing Id for a system or a newly allocated one. The system is specified by the assigning authority/NHS Trust                                                                              |
| Universal Id      | 0..1        | urn:oid:1.2.840.114350.1.13.861.1.7.2.798268 | https://fhir.north-west.england.nhs.uk/iGene/ReportIdentifier               | Identifier.system   | EI.3                                                     | The example used here is a generic value, NHS Trusts should supply actual value. Systems with a HL7 FHIR RESTful API e.g. EPIC and Meditech may have provided this value, the values in HL7 v2 and FHIR should be the same. |
| Universal Id Type | 0..1        | URI                               | URI            |                     | EI.4 fixed value `URI`                                   |                                                                                                                                                                                                                             |
| Identifier Type Code | 1..1        | PLAC                              | FILL           | Identifier.type     | n/a - identifiers use seperate fields in HL7 v2 Messages |                                                                                                                                                                                                                             |
{:.grid}

#### Example

HL7 v2 

With EPIC Order Placer OID
```
1029467053^ROA-EPI^urn:oid:1.2.840.114350.1.13.861.1.7.2.798268^URI
```

With self assigned Report Identifier for iGene
```
T25-8ZEA^699X0-iGene^https://fhir.north-west.england.nhs.uk/iGene/ReportIdentifier^URI
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
            "system": "urn:oid:1.2.840.114350.1.13.861.1.7.2.798268",
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

### [HL7 v2 CX - Extended Composite ID with Check Digit](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/CX)

Used in HL7 v2 PID and FHIR Patient.

| Field                | Optionality | Example NHS Number                | Example MRN                     | HL7 FHIR Identifier       | HL7 v2 CX | Notes                                                                                                                                                                                            |
|----------------------|-------------|-----------------------------------|---------------------------------|---------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Id Number            | 1..1        | 921 906 8409                      | 12067204                        | Identifier.value          | CX.1      |                                                                                                                                                                                                  |
| Assigning Authority  | 1..1        | NHS                               | ROA                             | Identifier.assigner.value | CX.4      | For MRN the assigning authority shall be the NHS Trust ODS Code. <br/><br/>For NHS identifiers valid values are <br/> NHS - England and Wales <br/> HSNI - Northern Ireland <br/> CHI - Scotland |
| Identifier Type Code | 1..1        | NH                                | MR                              | Identifier.type           | CX.5      |                                                                                                                                                                                                  |
| Universal Id         | 1..1        | https://fhir.nhs.uk/Id/nhs-number | https://nw-gmsa.github.io/Id/MR | Identifier.system         | N/a       |                                                                                                                                                                                                  |
{:.grid}

#### Example

HL7 v2 

NHS Number

```
9219068409^^^NHS^NH
```

MFT MRN

```
12067204^^^R0A^MR
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
