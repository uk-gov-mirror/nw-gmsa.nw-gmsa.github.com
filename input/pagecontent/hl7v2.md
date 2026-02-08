


## OML_O21 Laboratory Order 

HL7 over HTTP is preferred for this message, MLLP is also supported.

<div class="alert alert-success" role="alert">
POST [base]/<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/hl7-v2+er7
</div>

### References

<span class="badge badge-primary">Diagnostic Workflow</span> 

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

### Message

| Segment HL7               | Optionality | Notes                                                   |
|---------------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)               | 1..1        |                                                         |
| [PID](#pid)               | 1..1        |                                                         |
| [PV1](#pv1)               | 0..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER**                 | 1..*        |                                                         |
| - [ORC](#orc)             | 1..*        |                                                         |
| - **OBSERVATION REQUEST** | 1..*        |                                                         |
| -- [OBR](#obr)            | 1..*        |                                                         |
| -- [NTE](#nte)            | 0..*        |                                                         |
| -- [DG1](#dg1)            | 0..*        |                                                         |
| -- **OBSERVATION**        | 0..*        |                                                         |
| --- [OBX](#obx)           | 0..*        |                                                         |
| - **SPECIMEN**            | 0..*        | Conditional - required for complete order               |
| -- [SPM](#spm)            | 0..1        |                                                         |
{:.grid}

## ORU_R01 Unsolicited transmission of an observation message

HL7 over HTTP is preferred for this message, MLLP is also supported.

<div class="alert alert-success" role="alert">
POST [base]/<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/hl7-v2+er7
</div>



### References

<span class="badge badge-primary">Diagnostic Workflow</span> 

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

<span class="badge badge-primary">Genomics</span>

- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

### Message

| Segment HL7           | Optionality | Notes                                                   |
|-----------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)           | 1..1        |                                                         |
| [PID](#pid)           | 1..1        |                                                         |
| [PV1](#pv1)           | 0..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER OBSERVATION** | 1..*        |                                                         |
| - [ORC](#orc)         | 1..*        |                                                         |
| - [OBR](#obr)         | 1..*        |                                                         |
| -- **OBSERVATION**    | 1..*        |                                                         |
| -- [OBX](#obx)        | 1..*        |                                                         |
{:.grid}

<!--
### MASTER HL7 REPORTING PANEL

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                    | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                                            | Cardinality | Term Description                                                       |
|-------------|----------------|-----------------------------------|----------------------|----------------|-------------------------------------------------------------------|-------------|------------------------------------------------------------------------|
| CE          | 51967-8        | Genetic disease assessed [ID]     | LOINC                | 1.a            | R240^Diagnostic testing for known mutation(s)^ClinicalIndication | [0..*]      | [Clinical Indication](CodeSystem-GenomicClinicalIndication.html) |
| ED          | 51969-4        | Genetic analysis report           | LOINC                | 1              | ^AP^PDF^Base64^JVBERi0xL....                                      | [0..1]      |                                                                        |
| CE         | TESTCOME       | NHS England Genomics Test Outcome | NWGMSA         |                | 311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME        | [0..1]      | [Test Outcome](ValueSet-GenomicTestOutcomeCodes.html)    |                                                                     |

### Supplemental Codes (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                          | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                             | Cardinality | Term Description                                                                                                                                                                                     |
|--------------|----------------|-----------------------------------------|----------------------|----------------|----------------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CNE          | 48018-6        | Gene studied [ID]                       | LOINC                | 1.a            | 21497^ACAD9^HGNC-Symb                              | [0..*]      |
| CNE          | 51968-6        | Genetic analysis overall interpretation | LOINC                | 1              | LA6576^Posititive^LN^ <br/>  10828004^Positive^SCT | [0..1]      | [Genetic disease analysis overall predictive risk interpretation (LOINC LL541-4)](https://loinc.org/LL541-4)                                                                                         |
| ST           | 69547-8        | Genomic ref allele [ID]                 | LOINC                | 2a             | C                                                  | [0..1]      | The DNA string in the reference sequence (Ref Allele) with which the DNA string in the test sample differs, starting at the first position given in  LOINC 81254-5’s Genome Allele start-end (B.12). |

### Interpretations (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)             | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5) | Cardinality | Term Description                                                              |
|--------------|----------------|----------------------------|----------------------|----------------|------------------------|-------------|-------------------------------------------------------------------------------|
| CNE          | 53037-8        | Genetic sequence           | LOINC                | 2a             | LA6668-3^Pathogenic^LN | [0..1]      | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6) |
| CWE          | 69548-6        | Genetic variant Assessment | LOINC                | 2a             | LA9633-4^Present^LN    | [0..1]      | [Genetic variant assessment](https://loinc.org/LL1971-2)                      |
-->

## MDM_T02 Original document notification and content

<div class="alert alert-info" role="alert">
This is currently being elaborated and subject to change.
</div>

See also which are functionally equivalent and have a similar data model:

- IHE XDS Cross-Enterprise Document Sharing (XDS.b) or Cross-Enterprise Document Reliable Interchange (XDR) - [Provide and Register Document Set-b [ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html#3.41)
- IHE MHD Mobile access to Health Documents (MHD) - [Simplified Publish [ITI-105]](https://profiles.ihe.net/ITI/MHD/ITI-105.html)

### References 

- [EPIC Incoming Scanned Document Link Interface Technical Specification](https://open.epic.com/Tech/TechSpec?spec=5323)

### Message

| Segment HL7   | Optionality | Notes                                                   |
|---------------|-------------|---------------------------------------------------------|
| [MSH](#msh)   | 1..1        |                                                         |
| EVN           | 1..1        |                                                         | 
| [PID](#pid)   | 1..1        |                                                         |
| [PV1](#pv1)   | 1..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER**     | 0..*        |                                                         |
| - [ORC](#orc) | 1..1        |                                                         |
| - [OBR](#obr) | 1..1        |                                                         |
| [TXA](#txa)   | 1..1        |                                                         |
| **OBXNTE**    | 1..*        |                                                         |
| - [OBX](#obx) | 1..1        |                                                         |
{:.grid}

## Segments

### MSH

This is based on the definition of MSH from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws).

| Field HL7 | Fieldname                 | Data Type | Optionality | Identifier Type or ValueSet                           | Example Values      |
|-----------|---------------------------|-----------|-------------|-------------------------------------------------------|---------------------|
| MSH-1     | Field Separator           |           | R           |                                                       | &#9;                | 
| MSH-2     | Encoding Characters       |           | R           |                                                       | ^~\&                |
| MSH-3     | Sending Application       |           | R           |                                                       | iGene               |
| MSH-4     | Sending Facility          | HD        | R           | [ODS Code](StructureDefinition-OrganisationCode.html) | 699X0               |
| MSH-5     | Receiving Application     | HD        | R           |                                                       | EPIC                |
| MSH-6     | Receiving Facility        |           | R           | [ODS Code](StructureDefinition-OrganisationCode.html) | R0A                 |
| MSH-7     | Date/Time Of Message      |           | R           |                                                       | 20170126143602      |
| MSH-9     | Message Type              |           | R           |                                                       | ORU^R01^ORU_R01     |
| MSH-10    | Message Control ID        |           | R           |                                                       | 2017012614360280000 |
| MSH-11    | Processing ID             |           | R           |                                                       | P                   |
| MSH-12    | Version ID                |           | R           |                                                       | 2.5.1               |
| MSH-13    | Accept AcknowledgmentType |           | R           |                                                       | AL                  |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html" _target="_blank">MSH to FHIR MessageHeader</a> 
<br/>
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-bundle.html" _target="_blank">MSH to FHIR Bundle (message)</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-MessageHeader.html" _target="_blank">MessageHeader</a> 
</div>

### PID

This is based on the definition of PID from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) and [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type | Optionality | Identifier Type or ValueSet                                                                                                               | Example Values                                                                                                                  |
|-----------|------------------------------------|-----------|-------------|-------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| PID-1     | Set ID-PID                         |           | R           |                                                                                                                               | 1                                                                                                                               |
| PID-3     | Patient Identifier List            | [CX](#cx) | R           | [NHS Number](StructureDefinition-NHSIdentifier.html) <br/> [Medical Record Number](StructureDefinition-MedicalRecordNumber.html). | 633^^^R0A^MR~9449305552^^^NHS^NH                                                                                                |
| PID-5     | Patient Name                       |           | R           |                                                                                                                               | CHISLETT^Octavia^^Miss                                                                                                          |
| PID-7     | Date/Time of Birth                 |           | R           |                                                                                                                               | 20080920                                                                                                                        |
| PID-8     | Administrative Sex                 |           | R           |                                                                                                                               | F                                                                                                                               |
| PID-11    | Patient Address                    |           | R           |                                                                                                                               | 1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST                                                                                    |
| PID-13    | Phone Number - Home                |           | R           |                                                                                                                               | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH |
| PID-32    | Identity Reliability Code          |           | O           | Mandatory if the the NHS Number tracing status is not known.                                                                  | 01                                                                                                                              |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html" _target="_blank">PID to FHIR Patient</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

#### Examples

```
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
```

> FHIR Resource Example: [Patient - Octavia CHISLETT NHS Number: 9449305552](Patient-Patient-OctaviaCHISLETT-9449305552.html)

### PD1

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pd1-to-patient.html" _target="_blank">PD1 to FHIR Patient</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

### PV1 

> The PV1 segment should represent the episode/stay/visit number, not a consultant episode. 

This is based on the definition of PV1 from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

| Field HL7 | Fieldname                 | Data Type   | Optionality | Identifier Type or ValueSet                                                                    | Example Values                                |
|-----------|---------------------------|-------------|-------------|------------------------------------------------------------------------------------------------|-----------------------------------------------|
| PV1-1     | Set ID - PV1              | [PL](#pl)   | R           |                                                                                                | 1                                             |
| PV1-3     | Assigned Patient Location |             | R           |                                                                                                | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0 |
| PV1-8     | Admitting Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC             |  
| PV1-8     | Referring Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC             |  
| PV1-9     | Consulting Doctor         | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC             |  
| PV1-10    | Hospital Service          |             | R           | [Service](ValueSet-service.html)                                                               | 311                                           |
| PV1-17    | Admitting Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC             |  
| PV1-19    | Visit Number              | [CX](#cx)   | O - SHOULD  | [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 12345^^^R0A                                   |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html" _target="_blank">PV1 to FHIR Encounter</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-HospitalSpell.html" _target="_blank">HospitalSpell</a> 
<b>FHIR Profile:</b> <a href="StructureDefinition-Visit.html" _target="_blank">Visit</a> 
</div>

#### Examples

```
PV1|1|O|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||100|||||||||1001166717|||||||||||||||||||||||||20250129103726+0000
```

> FHIR Resource Example: [Encounter 'episode/stay' Example](Encounter-984b8a89-4194-4eb4-a7ea-ca8049ebeea3.html)

### ORC

This is based on the definition of ORC from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf).

| Field HL7 | Fieldname                | Data Type   | Optionality | Identifier Type or ValueSet                                                | Example Values                                        |
|-----------|--------------------------|-------------|-------------|----------------------------------------------------------------------------|-------------------------------------------------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R           | [Placer Order Number](StructureDefinition-OrderIdentifier.html)          | 1601737^R0A^150^L                                     |
| ORC-3     | Filler Order Number      | [EI](#ei)   | R           | [Filler Order Number](StructureDefinition-OrderFillerNumber.html)          | 1001166717^699X0^^255^ISO                             |
| ORC-4     | Placer Group Number      | [EI](#ei)   | R           | [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)          | 1001166717^699X0^^255^ISO                             |
| ORC-5     | Order Status             |             | O           |                                                                            |                                                                                                                                 
| ORC-9     | Date/Time of Transaction | TS          | O           |                                                                            |                                                                                                                                 
| ORC-12    | Ordering Provider        | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                     |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)             | MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html" _target="_blank">ORC to FHIR ServiceRequest</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>

#### Examples

```
ORC|NW|1601737^R0A|1001166717^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
```

> FHIR Resource Example: [ServiceRequest Coded Entries Example](ServiceRequest-ServiceRequestGenomicsOrderCodedEntries.html)

### OBR 

This is based on the definition of OBR from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type   | Optionality   | Identifier Type or ValueSet                                                | Example Values                                                              |
|-----------|------------------------------------|-------------|---------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| OBR-1     | Set ID - OBR                       |             | R             |                                                                            | 1                                                                           |
| OBR-2     | Placer Order Number                | [EI](#ei)   | R             | [Placer Order Number](StructureDefinition-OrderIdentifier.html)          | 1601737^ R0A^150^L                                                          |
| OBR-3     | Filler Order Number                | [EI](#ei)   | R             | [Filler Order Number](StructureDefinition-OrderFillerNumber.html)          | 1001166717^699X0^^255^ISO                                                   |
| OBR-4     | Universal Service Identifier       |             | R             | [Genomic Test Directory](ValueSet-genomic-test-directory.html)             | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory |
| OBR-6     | Requested Date/Time                | TS          | R for OML_O21 |                                                                            | 20170126135745                                                              |
| OBR-7     | Observation Date/Time              | TS          | R for ORU_R01 |                                                                            | 20170126135745                                                              |
| OBR-16    | Ordering Provider                  |             | R             | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                           |
| OBR-22    | Results Rpt/Status Chng -Date/Time | TS          | R             |                                                                            | 20170126135745                                                              |
| OBR-25    | Result Status                      |             |               |                                                                            |                                                                             |
| OBR-32    | Principal Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[primaryReporter]                       |                                                                             |
| OBR-33    | Assistant Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[secondaryReporter]                     |                                                                             |
| OBR-34    | Technician                         | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.performer[operator]                                       |                                                                             |                                                                             |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion OML_O21:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html" _target="_blank">OBR to FHIR ServiceRequest</a> 
<br/>
<b>v2 to FHIR Conversion ORU_R01:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html" _target="_blank">OBR to FHIR DiagnosticReport</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

#### Examples

```
OBR|1|1601737^R0A|1001166717^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
```

> FHIR Resource Example: [Diagnostic Report Example](DiagnosticReport-DiagnosticReportGenomicsReport.html)

### NTE

Multiple NTE should be converted to a single FHIR Annotation using markdown

| Field HL7 | Fieldname         | Data Type | Optionality | Identifier Type or ValueSet | Example Values |
|-----------|-------------------|-----------|-------------|-----------------------------|----------------|
| NTE-1     | Set ID - NTE      |           |             |                             |                | 
| NTE-2     | Source of Comment |           |             |                             |                | 
| NTE-3     | Comment           |           |             |                             |                | 
| NTE-4     | Comment Type      |           |             |                             |                | 
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion OML_O21:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html" _target="_blank">NTE to FHIR ServiceRequest</a> 
<br/>
<b>v2 to FHIR Conversion ORU_R01:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-observation.html" _target="_blank">NTE to FHIR Observation</a> 
</div>

#### Examples

```
NTE|1||Referral lab PLEASE do following tests:
NTE|2||
NTE|3||Test(s) required: WGS
NTE|4||Sample type: Blood
NTE|5||Transport used: Merlin Courier
NTE|6||Tracking Number: ABC123
NTE|7||Sample sent to: LWH Genetics
NTE|8||By: PDAY       on: 02/04/25
NTE|9||
NTE|10||.Speciality Requesting Clinician: PAEDS
NTE|11||Test Group: Neurology
NTE|12||Ethnic Group: White British
NTE|13||Patient is from consanguineous union? : Unknown
NTE|14||Specimen Collection Status: Collect & send with order
NTE|15||Infection Risk: No Specific Risk
NTE|16||Clinical details:
NTE|17||
NTE|18||TESTING
NTE|19||Contact/Bleep No: 123
```

> FHIR Resource Example OML_O21: [ServiceRequest Coded Entries Example](ServiceRequest-ServiceRequestGenomicsOrderCodedEntries.html)
> 
> FHIR Resource Example ORU_R01: TODO

### DG1

| Field HL7 | Fieldname         | Data Type | Optionality | Identifier Type or ValueSet | Example Values |
|-----------|-------------------|-----------|-------------|-------------|----------------|
| DG1-3     | Diagnosis Code    | [CE](#ce)          |             |             |                | 
| DG1-4     | Diagnosis Description |           |             |             |                | 
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html" _target="_blank">DG1 to FHIR Condition</a> Note: In orders this is likely to be a coded entry in ServiceRequest.reasonCode as only a code is present.
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Condition.html" _target="_blank">Condition</a> 
</div>

#### Examples

```
DG1|1||363349007^Malignant tumour of stomach^SNM3||20250129103726+0000
```

> FHIR Resource Example ORU_R01: TODO
 
### OBX

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                    | Data Type | Optionality | Identifier Type or ValueSet         | Example Values                                                                                                  |
|-----------|------------------------------|-----------|-------------|-------------------------|-----------------------------------------------------------------------------------------------------------------|
| OBX-1     | Set ID – OBX                 |           | R           |                         | 1                                                                                                               |
| OBX-2     | Value Type                   |           | R           | See next section for ED | CE                                                                                                              |
| OBX-3     | Observation Identifier       | [CE](#ce) | R           |                         | 842009^Consanguinity^SNM3<br/>97209-1^Shipment tracking number^LN<br/>161714006^Estimated date of delivery^SNM3 |
| OBX-5     | Observation Value            | Varies    | R           |                         | LN^Yes^LA33-6 (value type=CE)<br/>UK3096580215 (value type=ST)<br/>20250512103726+0000 (value type=DT)          |
| OBX-11    | Observation Result Status    |           | R           |                         | F                                                                                                               |
| OBX-14    | Date/Time of the Observation | TS        | O - SHOULD  |                         | 20190514102417+0000                                                                                             |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-observation.html" _target="_blank">OBX to FHIR Observation</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Observation.html" _target="_blank">Observation</a> 
</div>

#### Examples

```
OBX|1|CE|GENEAP^GENETICS TEST PERFORMABLE^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|2|CE|230056^What Type of Referral Do You Require?^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|3|CE|281269004^High infection risk sample^SNM3|||||||||||20250129103726+0000
OBX|4|ST|230016^Test Type^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds||Diagnostic Screen/Test|||||||||20250129103726+0000
```

> FHIR Resource Example: [Consanguinity (value type=CE)](Observation-OBX-Consanguinity.html)
> 
> FHIR Resource Example: [Order Tracking Number (value type=ST)](Observation-OBX-OrderTrackingNumber.html)
> 
> FHIR Resource Example: [Pregnancy Expected Delivery Date (value type=DT)](Observation-OBX-PregnancyExpectedDeliveryDate.html)


### OBX (type = ED)

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                    | Data Type | Optionality | Identifier Type or ValueSet                                          | Example Values                       |
|-----------|------------------------------|-----------|-------------|----------------------------------------------------------|--------------------------------------|
| OBX-1     | Set ID – OBX                 |           | R           |                                                          | 1                                    |
| OBX-2     | Value Type                   | ED        | R           |                                                          | ED                                   |
| OBX-3     | Observation Identifier       | [ED](#ed) | R           | [Document Entry Type](ValueSet-document-entry-type.html) | 1054161000000101^Genetic report^SNM3 |
| OBX-5     | Observation Value            |         | R           |                                                          | MOL^IM^PDF^Base64^JVBERI0X...        |
| OBX-11    | Observation Result Status    |           | R           |                                                          | F                                    |
| OBX-14    | Date/Time of the Observation |           | O - SHOULD  |                                                          | 20190514102417+0000                  |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html" _target="_blank">OBX to FHIR DocumentReference</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DocumentReference.html" _target="_blank">DocumentReference</a> 
</div>

#### Examples

```
OBX|1|ED|1054161000000101^Genetic report^SNM3||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```

> FHIR Resource Example: [Document Reference Laboratory Report](DocumentReference-94bf65ba-cd6c-4601-b339-6d547f424646.html)

### SPM

This is based on the definition of SPM from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                     | Data Type | Optionality | Identifier Type or ValueSet                                                 | Example Values                                     |
|-----------|-------------------------------|-----------|-------------|-----------------------------------------------------------------------------|----------------------------------------------------|
| SPM-2     | Specimen ID                   |           | O           | Placer Specimen Number^Filler Specimen Number                               | 25GEN-029GN00001&R0A                               |
| SPM-3     | Specimen Parent IDs           |           | O           |                                                                             | ^1001166717&699X0                                  |
| SPM-4     | Specimen Type                 |           | O           | [Specimen Type](ValueSet-specimen-type.html)                                | 119325001^Skin specimen^SNM3                       |
| SPM-8     | Specimen Source Site          |           | O           |                                                                             | 299706009^Bone structure of wrist and/or hand^SNM3 |
| SPM-9     | Specimen Source Site Modifier |           | O           |                                                                             | 7771000^Left^SNM3                                  |
| SPM-17    | Specimen Collection Date/Time | TS        | O           |                                                                             |                                                    |
| SPM-18    | Specimen Received Date/Time   | TS        | O           |                                                                             |                                                    |
| SPM-20    | Specimen Availability         |           | O           |                                                                             |                                                    |
| SPM-30    | Accession ID                  |           | O           | [Accession Number](StructureDefinition-AccessionNumber.html)                |                                                    |
| SPM-32    | Shipment Tracking Number      |           | O           | [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html) |                                                    |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html" _target="_blank">SPM to FHIR Specimen</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>

### TXA

| Field HL7 | Fieldname                           | Data Type | Optionality | Identifier Type or ValueSet                               | Example Values                       |
|-----------|-------------------------------------|-----------|-------------|-----------------------------------------------------------|--------------------------------------|
| TXA-1     | Set ID - TXA                        |           | R           |                                                           | 1                                    |
| TXA.2     | Document Type                       | CWE       | R           | [Document Entry Type](ValueSet-document-entry-type.html)  | 1054161000000101^Genetic report^SNM3 |
| TXA-4     | Activity Date/Time                  | TS        | R           |                                                           |                                      |
| TXA.5     | Primary Activity Provider Code/Name | XCN       |             |                                                           |                                      |
| TXA.12    | Unique Document Number              | [EI](#ei) | R           |                                                           | 1001166717^699X0                     |
| TXA-17    | Document Completion Status          |           | R           |                                                           | F                                    |
| TXA-24    | Folder Assignment                   | CWE       |             | [DocumentEntry Class](ValueSet-document-entry-class.html) |                                      |                    
| TXA-25    | Document Title                      | ST        |             |                                                           |                                      |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-txa-to-documentreference.html" _target="_blank">TXA to DocumentReference</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DocumentReference.html" _target="_blank">DocumentReference</a> 
</div>

#### Examples

```
SPM|1|25GEN-029GN00001&R0A|^1001166717&699X0|258580003^Whole blood specimen^SNM3|||||||||||||20250129103726+0000|||Y
```

> FHIR Resource Example: [Specimen Example](Specimen-SpecimenExample.html)

## Data Types

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-3, ORC-12 (XCN) and ORC-21 (XON) **SHALL** be populated.

### CE 

Coded Element.
UK SNOMED CT is preferred and may be mandatory depending on use, for example for OXB Type ED, it will be required.

#### Example 

SNOMED

```1054161000000101^Genetic report^SNM3```

LOINC (from HL7 International)

```53577-3^Reason for study^LN```
```51967-8^Genetic disease(s) assessed^LN```
```48018-6^Gene studied^LN```

### CX 

Extended Composite ID with Check Digit
CX.1 - Id Number, CX-4 - Assigning authority and CX.5 - Identifier Type Code are mandatory

#### Example

NHS Number 

```aiignore
9449305552^^^NHS^NH
```

Medical Record Number

```aiignore
633^^^R0A^MR
```

### EI 

Entity Identifier.
EI.1 - Entity Identifier and EI.2 - Namespace Id are mandatory

#### Example

Manchester University NHS Foundation Trust 

```aiignore
1601737^R0A
```

North West GLH Hub

```aiignore
1001166717^699X0
```

### PL

This is based on the definition of PL from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.
In addition, this includes of PL.11 to hold organisation ODS code.  

> The ODS Site Code **SHALL** belong to the ODS Code. This is to help avoid data issues in this codesystem. 

| Field HL7 | Fieldname                        | Data Type | Optionality | Identifier Type or ValueSet                                                         | Example Values |
|-----------|----------------------------------|-----------|-------------|-------------------------------------------------------------------------|----------------|
| PL.4      | Facility                         | HD        | R           | [Organisation Site Code](StructureDefinition-OrganisationSiteIdentifier.html) | R0A09               |
| PL.11     | Assigning Authority For Location | HD        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)          | R0A            | 
{:.grid}

### NDL

This is based on the definitions of NDL from [Royal College of Radiologists](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

| Field HL7   | Fieldname   | Data Type | Optionality | Identifier Type or ValueSet | Example Values |
|-------------|-------------|-----------|-------------|-----------------|----------------|
| NDL-1.CNN.1 | Id Number   | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)      |                |
| NDL-1.CNN.2 | Family Name | ST        | O           | Surname         |                |
| NDL-1.CNN.3 | Given  Name | ST        | O           | Forename        |                |
| NDL-7       | Facility    | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)         |                |
{:.grid}

### XCN

Extended Composite ID Number and Name for Persons.
The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

Example

GMC Code

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

### XON 

Extended Composite Name and Identification Number for Organizations.
The definition of XON from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-21.

Example

```aiignore
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```

## HL7 v2 to FHIR Message Conversion

- [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) 
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

## Example: Example Instances

### OML_O21 Laboratory Order

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [Original Hl7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/O21)             |
| [FHIR Message O21](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/O21)                 |
| [North West Genomics HL7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/O21) |
{:.grid}

### ORU_R01 Unsolicited transmission of an observation message

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [Original Hl7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/R01)             |
| [FHIR Message R01](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/R01)                 |
| [North West Genomics HL7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/R01) |
{:.grid}

### MDM_T02 Original document notification and content

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| Source message is ORU_R01                                                                        |
| [FHIR Message T02](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/T02)                 |
| [North West Genomics HL7 v2 MDM_T02](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/T02) |
{:.grid}
