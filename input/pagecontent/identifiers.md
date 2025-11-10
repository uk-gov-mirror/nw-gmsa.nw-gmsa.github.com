
The conventions described below are taken from several UK national HL7 specifications, including:

- [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
- [Digital Health and Care Scotland - (EH4001) CLINICAL DOCUMENT INDEXING STANDARDS ](https://www.digihealthcare.scot/app/uploads/2024/05/CDI-Standard-V4.5-FINAL.pdf)
- [IHE Europe Document Metadata](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf) (this contains references to NHS England Data Dictionary and Model)

Both guides are effectively merged in this guide and applied to both HL7 v2 and FHIR. The pattern used here is [Canonical Data Mode](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html), this can also be applied to other formats such as IHE XDS and DICOM. 

| v2 Segment      | FHIR Resource     | IHE XDS       | National Guide                                          |
|-----------------|-------------------|---------------|---------------------------------------------------------|
| PID             | Patient           |               | NHS England (v2) and Digital Health and Care Wales (v2) |
| PV1             | Encounter         |               | NHS England (v2)                                        |
| OBX             | Observation       |               |                                                         |
| OBX (type = ED) | DocumentReference | DocumentEntry | Digital Health and Care Scotland and IHE Europe         | 
| ORC             | ServiceRequest    |               | Digital Health and Care Wales (v2)                      |
| OBR             | DiagnosticReport  |               | Digital Health and Care Wales (v2)                      | 

This is also conformant with [HL7 UK Core](https://simplifier.net/guide/ukcoreversionhistory?version=current), which this extends.

The scope of this guide is the North West NHS region (for Genomics) and sits in the between English NHS Trusts (and their system suppliers) and NHS England.

## Patient (PID) Identifiers 

Only validated patient identifiers should be provided, unverified NHS Numbers are not permitted. 
At least one patient identifier be should be provided, the types supported are **Medical Record Number (type=MR)** and **NHS Number (type=NH)** (other types can be present). 
HL7 v2 PID.3 CX type and FHIR Patient.identifier have similar structures, see [ConceptMap: Datatype CX to Identifier Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cx-to-identifier.html)

Changes to v2 and FHIR:


### Example




### Conversion Table

| Organisation                                    | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR) | OID (FHIR, v3 and IHE) | Alternate name                       | 
|-------------------------------------------------|--------------------------------------|------------|---------------|------------------------|--------------------------------------|
| Alder Hey Children’s NHS Foundation Trust       | RBS                                  | MR         |               |                        |                                      |
| Liverpool Women’s Hospital NHS Foundation Trust | REP                                  | MR         |               |                        |                                      |
| The Christie NHS Foundation Trust               | RBV                                  | MR         |               |                        |                                      |
| Manchester University NHS Foundation Trust      | ROA                                  | MR         |               |                        | Equivalent to internal v2 type = EPI |


## Encounter (PV1) 

| Organisation                                    | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR) | OID (FHIR, v3 and IHE) | Alternate name | 
|-------------------------------------------------|--------------------------------------|------------|---------------|------------------------|----------------|
| Alder Hey Children’s NHS Foundation Trust       | RBS                                  | AN         |               |                        |                |
| Liverpool Women’s Hospital NHS Foundation Trust | REP                                  | AN         |               |                        |                |
| The Christie NHS Foundation Trust               | RBV                                  | AN         |               |                        |                |
| Manchester University NHS Foundation Trust      | ROA                                  | AN         |               |                        |                |

## Observation (OBX)

## DocumentReference (OBX type ED)

## ServiceRequest

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                               | OID (FHIR, v3 and IHE) | Alternate name | 
|-----------------------------------------------------|--------------------------------------|------------|---------------------------------------------|------------------------|----------------|
| Alder Hey Children’s NHS Foundation Trust           | RBS                                  | PLAC       |                                             |                        |                |
| Liverpool Women’s Hospital NHS Foundation Trust     | REP                                  | PLAC         |                                             |                        |                |
| The Christie NHS Foundation Trust                   | RBV                                  | PLAC         |                                             |                        |                |
| Manchester University NHS Foundation Trust          | ROA                                  | PLAC         |                                             |                        |                |
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                | FILL       | https://fhir.nw-gmsa.nhs.uk/Id/FillerNumber |                        |                |

## DiagnosticReport

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                                | OID (FHIR, v3 and IHE) | Alternate name | 
|-----------------------------------------------------|--------------------------------------|------------|----------------------------------------------|------------------------|----------------|
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                |            | https://fhir.nw-gmsa.nhs.uk/Id/GenomicReport |                        |                |

## Specimen

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                                      | OID (FHIR, v3 and IHE) | Alternate name | 
|-----------------------------------------------------|--------------------------------------|------------|----------------------------------------------------|------------------------|----------------|
| Alder Hey Children’s NHS Foundation Trust           | RBS                                  | SID        |                                                    |                        |                |
|                                                     | RBS                                  | ASCN       |                                                    |                        |                |
| Liverpool Women’s Hospital NHS Foundation Trust     | REP                                  | SID        |                                                    |                        |                |
|                                                     | REP                                  | ASCN       |                                                    |                        |                |
| The Christie NHS Foundation Trust                   | RBV                                  | SID        |                                                    |                        |                |
|                                                     | RBV                                  | ASCN       |                                                    |                        |                |
| Manchester University NHS Foundation Trust          | ROA                                  | SID        |                                                    |                        |                |
|                                                     | ROA                                  | ASCN       |                                                    |                        |                |
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                | SID        | https://fhir.nw-gmsa.nhs.uk/Id/Specimen            |                        |                |
|                                                     | 699X0                                | ASCN       | https://fhir.nw-gmsa.nhs.uk/Id/AccessionIdentifier |                        |                |

## Notes

To amend an entry in these tables, amend the table directly on this GitHub page https://github.com/nw-gmsa/R4/blob/main/input/pagecontent/identifiers.md and submit a pull request.

For NHS trusts with EPRs with FHIR REST APIs (e.g. [EPIC](https://fhir.epic.com/Documentation?docId=epicidtypes), Oracle and Cerner), the FHIR system used here **SHOULD** be the same.
An OID can be used instead of a FHIR system, this may be defined for use with IHE XDS. 
