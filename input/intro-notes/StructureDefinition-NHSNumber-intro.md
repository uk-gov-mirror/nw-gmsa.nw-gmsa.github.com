## Mapping 

- **HL7 FHIR** Patient.identifier (type = NH)
- **HL7 v2** Patient Identifier List (PID-3)
- **IHE XDS** sourcePatientId and patientId

Format: NNNNNNNNNN, values include a checksum, details can be found in [NHS NUMBER](https://www.datadictionary.nhs.uk/attributes/nhs_number.html)

- Testing number range: 999 000 0000 to 999 999 9999

### NHS Number (England and Wales)

- England, Wales and the Isle of Man value ranges: 400 000 0000 to 499 999 9999, and 600 000 0000 to 799 999 9999.

| Field               | HL7 FHIR Identifier | OID / URI                 | HL7 FHIR Value                                   | HL7 v2 CX | HL7 v2 Value | Example    |
|---------------------|---------------------|---------------------------|--------------------------------------------------|-----------|--------------|------------|
| Value               | value               |                           | -                                                | CX.1      |              | 9449305552 |
| Type                | type                |                           | http://terminology.hl7.org/CodeSystem/v2-0203#NH | CX.5      | NH           | -          |
| Assigning Authority | assigner.identifier |                           | X24 for NHS England PDS traced patients          | CX.4      | NHS          | -          |
| System              | system              | 2.16.840.1.113883.2.1.4.1 | **https://fhir.nhs.uk/Id/nhs-number**            | N/a       | N/a          | -          |
{:.grid}

### CHI Number (Scotland)

- Scotland ranges: 010 100 0000 to 311 299 9999.

| Field               | HL7 FHIR Identifier | OID / URI                         | HL7 FHIR Value                                   | HL7 v2 CX | HL7 v2 Value | Example    |
|---------------------|---------------------|-----------------------------------|--------------------------------------------------|-----------|--------------|------------|
| Value               | value               |                                   | -                                                | CX.1      |              | 9449305552 |
| Type                | type                |                                   | http://terminology.hl7.org/CodeSystem/v2-0203#NH | CX.5      | NH           | -          |
| Assigning Authority | assigner.identifier |                                   |                                                  | CX.4      | CHI          | -          |
| System              | system              | 2.16.840.1.113883.2.1.3.2.4.16.53 | **urn:oid:2.16.840.1.113883.2.1.3.2.4.16.53**    | N/a       | N/a          | -          |
{:.grid}

### Health and Care Number (Northern Ireland)

- Northern Ireland ranges: 320 000 0000 to 399 999 9999.

| Field               | HL7 FHIR Identifier | OID / URI                 | HL7 FHIR Value                                   | HL7 v2 CX | HL7 v2 Value | Example  |
|---------------------|---------------------|---------------------------|--------------------------------------------------|-----------|--------------|----------|
| Value               | value               |                           | -                                                | CX.1      |              | 9449305552 |
| Type                | type                |                           | http://terminology.hl7.org/CodeSystem/v2-0203#NH | CX.5      | NH           | -        |
| Assigning Authority | assigner.identifier |                           |                                                  | CX.4      | HSC          | -        |
| System              | system              |  | **https://fhir.nhs.uk/Id/hsc-number**            | N/a       | N/a          |          |
{:.grid}
