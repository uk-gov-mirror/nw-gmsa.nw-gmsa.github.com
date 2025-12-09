## Mapping 

- **HL7 FHIR** Patient.identifier (type = NH)
- **HL7 v2** Patient Identifier List (PID-3)
- **IHE XDS** sourcePatientId and patientId

Format: NNNNNNNNNN
- Scotland ranges: 010 100 0000 to 311 299 9999.
- Testing: 999 000 0000 to 999 999 9999 

Values include a checksum, details can be found in [NHS NUMBER](https://www.datadictionary.nhs.uk/attributes/nhs_number.html)  



| Field               | HL7 FHIR Identifier | OID / URI                         | HL7 FHIR Value                                   | HL7 v2 CX | HL7 v2 Value | Example    |
|---------------------|---------------------|-----------------------------------|--------------------------------------------------|-----------|--------------|------------|
| Value               | value               |                                   | -                                                | CX.1      |              | 9449305552 |
| Type                | type                |                                   | http://terminology.hl7.org/CodeSystem/v2-0203#NH | CX.5      | NH           | -          |
| Assigning Authority | assigner.identifier |                                   |                                                  | CX.6      | CHI          | -          |
| System              | system              | 2.16.840.1.113883.2.1.3.2.4.16.53 | urn:oid:2.16.840.1.113883.2.1.3.2.4.16.53        | N/a       | N/a          | -          |


