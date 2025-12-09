## Mapping 

- **HL7 FHIR** Patient.identifier (type = NH)
- **HL7 v2** Patient Identifier List (PID-3)
- **IHE XDS** sourcePatientId and patientId

Format: NNNNNNNNNN
- Northern Ireland ranges: 320 000 0000 to 399 999 9999.
- Testing: 999 000 0000 to 999 999 9999 

Values include a checksum, details can be found in [NHS NUMBER](https://www.datadictionary.nhs.uk/attributes/nhs_number.html)  



| Field               | HL7 FHIR Identifier | OID / URI                 | HL7 FHIR Value                                   | HL7 v2 CX | HL7 v2 Value | Example    |
|---------------------|---------------------|---------------------------|--------------------------------------------------|-----------|--------------|------------|
| Value               | value               |                           | -                                                | CX.1      |              | 9449305552 |
| Type                | type                |                           | http://terminology.hl7.org/CodeSystem/v2-0203#NH | CX.5      | NH           | -          |
| Assigning Authority | assigner.identifier |                           |                                                  | CX.6      | HSC          | -          |
| System              | system              |  |                | N/a       | N/a          | -          |

