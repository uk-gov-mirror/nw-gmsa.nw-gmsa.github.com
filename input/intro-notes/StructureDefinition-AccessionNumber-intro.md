## Mapping

- **HL7 FHIR** Specimen.accessionIdentifier (type = ACSN)
- **HL7 v2** Accession ID (SPM-30)
- **IHE XDS** referenceIdList

In pathology and genomics, the accession number refers to the Specimen. 
In imaging the accession number refers to the imaging test [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html)  

| Field    | HL7 FHIR Identifier | OID | HL7 v2 CX | HL7 FHIR Example                                   | HL7 v2 Example |
|----------|---------------------|-----|-----------|----------------------------------------------------|----------------|
| Value    | value               |     | EI.1      | ABC1234                                            | ABC1234        |
| Type     | type                |     |           | http://terminology.hl7.org/CodeSystem/v2-0203#ACSN |                |
| ODS Code | assigner.identifier |     | EI.2      | https://fhir.nhs.uk/Id/ods-organization-code#RBS   | RBS            |
| System   | system              |     | N/a       | https://fhir.example.org/Id/medical-record-number  | N/a            |
