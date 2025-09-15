


## OML_O21 Laboratory Order 

HL7 over HTTP is preferred for this message, MLLP is also supported.

<div class="alert alert-success" role="alert">
POST [base]/<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/hl7-v2+er7
</div>

### References

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

## ORU_R01 Unsolicited transmission of an observation message

HL7 over HTTP is preferred for this message, MLLP is also supported.

<div class="alert alert-success" role="alert">
POST [base]/<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/hl7-v2+er7
</div>



### References

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
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

### MASTER HL7 REPORTING PANEL

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                    | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                                            | Cardinality | Term Description                                                       |
|--------------|----------------|-----------------------------------|----------------------|----------------|-------------------------------------------------------------------|-------------|------------------------------------------------------------------------|
| CWE          | 51967-8        | Genetic disease assessed [ID]     | LOINC                | 1.a            | R240^Specific target Targeted mutation testing^ClinicalIndication | [0..*]      | [Clinical Indication](CodeSystem-GenomicClinicalIndication.html) |
| ED           | 51969-4        | Genetic analysis report           | LOINC                | 1              | ^AP^PDF^Base64^JVBERi0xL....                                      | [0..1]      |                                                                        |
| CWE          | TESTCOME       | NHS England Genomics Test Outcome | NWGMSA         |                | 311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME        | [0..1]      | [Test Outcome](ValueSet-GenomicTestOutcomeCodes.html)    |                                                                     |

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


## Segments

### MSH

This is based on the definition of MSH from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws).

| Field HL7 | Fieldname                          | Data Type   | Optionality | Identifier Type or ValueSet                                                                                                         | Example Values                                                                                                                  |
|-----------|------------------------------------|-------------|-------------|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| MSH-1     | Field Separator                    |             | R           |                                                                                                                         | &#9;                                                                                                                            |                                                                                                                          | `                                                                                                         |
| MSH-2     | Encoding Characters                |             | R           |                                                                                                                         | ^~\&                                                                                                                            |
| MSH-3     | Sending Application                |             | R           |                                                                                                                         | iGene                                                                                                                           |
| MSH-4     | Sending Facility                   | HD          | R           | [ODS Code](StructureDefinition-OrganisationCode.html)                                                                   | 699X0                                                                                                                           |
| MSH-5     | Receiving Application              | HD          | R           |                                                                                                                         | EPIC                                                                                                                            |
| MSH-6     | Receiving Facility                 |             | R           | [ODS Code](StructureDefinition-OrganisationCode.html)                                                                   | R0A                                                                                                                             |
| MSH-7     | Date/Time Of Message               |             | R           |                                                                                                                         | 20170126143602                                                                                                                  |
| MSH-9     | Message Type                       |             | R           |                                                                                                                         | ORU^R01^ORU_R01                                                                                                                 |
| MSH-10    | Message Control ID                 |             | R           |                                                                                                                         | 2017012614360280000                                                                                                             |
| MSH-11    | Processing ID                      |             | R           |                                                                                                                         | P                                                                                                                               |
| MSH-12    | Version ID                         |             | R           |                                                                                                                         | 2.5.1                                                                                                                           |
| MSH-13    | Accept AcknowledgmentType          |             | R           |                                                                                                                         | AL                                                                                                                              |

### PID

This is based on the definition of PID from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) and [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type | Optionality | Identifier Type or ValueSet                                                                                                               | Example Values                                                                                                                  |
|-----------|------------------------------------|-----------|-------------|-------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| PID-1     | Set ID-PID                         |           | R           |                                                                                                                               | 1                                                                                                                               |
| PID-3     | Patient Identifier List            | [CX](#cx) | R           | [NHS Number](StructureDefinition-NHSNumber.html) <br/> [Medical Record Number](StructureDefinition-MedicalRecordNumber.html). | 633^^^R0A^MR~9449305552^^^NHS^NH                                                                                                |
| PID-5     | Patient Name                       |           | R           |                                                                                                                               | CHISLETT^Octavia^^Miss                                                                                                          |
| PID-7     | Date/Time of Birth                 |           | R           |                                                                                                                               | 20080920                                                                                                                        |
| PID-8     | Administrative Sex                 |           | R           |                                                                                                                               | F                                                                                                                               |
| PID-11    | Patient Address                    |           | R           |                                                                                                                               | 1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST                                                                                    |
| PID-13    | Phone Number - Home                |           | R           |                                                                                                                               | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH |
| PID-32    | Identity Reliability Code          |           | O           | Mandatory if the the NHS Number tracing status is not known.                                                                  | 01                                                                                                                              |

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

### PV1 

> The PV1 segment should represent the episode/stay/visit number, not a consultant episode. 

This is based on the definition of PV1 from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

| Field HL7 | Fieldname                 | Data Type   | Optionality | Identifier Type or ValueSet                                                                   | Example Values                                |
|-----------|---------------------------|-------------|-------------|-----------------------------------------------------------------------------------|-----------------------------------------------|
| PV1-1     | Set ID - PV1              | [PL](#pl)   | R           |                                                                                   | 1                                             |
| PV1-3     | Assigned Patient Location |             | R           |                                                                                   | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0 |
| PV1-8     | Referring Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC             |                                                                                   
| PV1-10    | Hospital Service          |             | R           | [Service](ValueSet-service.html)                                                  | 311                                           |
| PV1-19    | Visit Number              | [CX](#cx)   | O - SHOULD  | [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html)                            | 12345^^^R0A                                   |                                    |

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html" _target="_blank">PV1 to FHIR Encounter</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Encounter.html" _target="_blank">Encounter</a> 
</div>

#### Examples

```
PV1|1|O|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||100|||||||||1001166717|||||||||||||||||||||||||20250129103726+0000
```

> FHIR Resource Example: [Encounter 'episode/stay' Example](Encounter-984b8a89-4194-4eb4-a7ea-ca8049ebeea3.html)

### ORC

This is based on the definition of ORC from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf).

| Field HL7 | Fieldname                | Data Type   | Optionality | Identifier Type or ValueSet                                                                   | Example Values                                                                                                                  |
|-----------|--------------------------|-------------|-------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R           | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                 | 1601737^R0A^150^L                                                                                                               |
| ORC-3     | Filler Order Number      | [EI](#ei)   | R           | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-4     | Placer Group Number      | [EI](#ei)   | R           | [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-5     | Order Status             |             | O           |                                                                                   |                                                                                                                                 |
| ORC-9     | Date/Time of Transaction | TS          | O           |                                                                                   |                                                                                                                                 |
| ORC-12    | Ordering Provider        | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                                               |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)                    |                                                                                                                                 |

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
| OBR-2     | Placer Order Number                | [EI](#ei)   | R             | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)          | 1601737^ R0A^150^L                                                          |
| OBR-3     | Filler Order Number                | [EI](#ei)   | R             | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)          | 1001166717^699X0^^255^ISO                                                   |
| OBR-4     | Universal Service Identifier       |             | R             | [Genomic Test Directory](ValueSet-genomic-test-directory.html)             | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory |
| OBR-6     | Requested Date/Time                | TS          | R for OML_O21 |                                                                            | 20170126135745                                                              |
| OBR-7     | Observation Date/Time              | TS          | R for ORU_R01 |                                                                            | 20170126135745                                                              |
| OBR-16    | Ordering Provider                  |             | R             | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                           |
| OBR-22    | Results Rpt/Status Chng -Date/Time | TS          | R             |                                                                            | 20170126135745                                                              |
| OBR-25    | Result Status                      |             |               |                                                                            | |
| OBR-32    | Principal Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[primaryReporter]                       |                                                                             |
| OBR-33    | Assistant Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[secondaryReporter]                     |                                                                             |
| OBR-34    | Technician                         | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.performer[operator]                                       |                                                                             |                                                                             |


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
|-----------|-------------------|-----------|-------------|-------------|----------------|
| NTE-1     | Set ID - NTE      |           |             |             |                | 
| NTE-2     | Source of Comment |           |             |             |                | 
| NTE-3     | Comment           |           |             |             |                | 
| NTE-4     | Comment Type      |           |             |             |                | 


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


### NDL

This is based on the definitions of NDL from [Royal College of Radiologists](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

| Field HL7   | Fieldname   | Data Type | Optionality | Identifier Type or ValueSet | Example Values |
|-------------|-------------|-----------|-------------|-----------------|----------------|
| NDL-1.CNN.1 | Id Number   | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)      |                |
| NDL-1.CNN.2 | Family Name | ST        | O           | Surname         |                |
| NDL-1.CNN.3 | Given  Name | ST        | O           | Forename        |                |
| NDL-7       | Facility    | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)         |                |

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

#### Genomics Order with Coded Entries

For the FHIR version see [Bundle 'Message' - Genomics Order with Coded Entries](Bundle-GenomicsOrderMessageCodedEntries.html)

```aiignore
MSH|^~\&|HIVE|R0A|LIMS|699X0|20241013103300+0000||OML^O21^OML_O21|urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095|T|2.4|||AL
PID|1||633^^^R0A^MR~9449305552^^^NHS^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|O|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||100|||||||||1001166717|||||||||||||||||||||||||20250129103726+0000
ORC|NW|1601737^R0A|1001166717^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
OBR|1|1601737^R0A|1001166717^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
NTE|1||Referral lab PLEASE do following tests:
NTE|2||
NTE|3||Test(s) required: WGS
NTE|4||Sample type: Blood
NTE|5||Transport used: Merlin Courier
NTE|6||Tracking Number: ABC123
NTE|7||Sample sent to: LWH Genetics
NTE|8||By: PDAY on: 02/04/25
NTE|9||
NTE|10||Speciality Requesting Clinician: PAEDS
NTE|11||Test Group: Neurology
NTE|12||Ethnic Group: White British
NTE|13||Patient is from consanguineous union? : Unknown
NTE|14||Specimen Collection Status: Collect & send with order
NTE|15||Infection Risk: No Specific Risk
NTE|16||Clinical details:
NTE|17||
NTE|18||TESTING
NTE|19||Contact/Bleep No: 123
DG1|1||363349007^Malignant tumour of stomach^SNM3||20250129103726+0000
DG1|2||363349007^Malignant tumour of stomach^SNM3
OBX|1|CE|GENEAP^GENETICS TEST PERFORMABLE^NWGMSA|||||||||||20250129103726+0000
OBX|2|CE|230056^What Type of Referral Do You Require?^NWGMSA||1186936003^Storage of specimen (procedure)^SNM3|||||||||20250129103726+0000
OBX|3|CE|281269004^High infection risk sample^SNM3||LA32-8^No^LN|||||||||20250129103726+0000
OBX|4|ST|230016^Test Type^NWGMSA||Diagnostic Screen/Test|||||||||20250129103726+0000
OBX|5|CE|77386006^Pregnancy^SNM3||LA33-6^Yes^LN|||||||||20250129103726+0000
OBX|6|ST|231284^Please Select R240 Test(s):^NWGMSA||R240.1: Targeted variant testing|||||||||20250129103726+0000
OBX|7|ST|231285^Please Select R242 Test(s):^NWGMSA||R242.1: Targeted variant testing|||||||||20250129103726+0000
OBX|8|ST|230027^Email Addresses of Non-MFT Clinicians for Result Reports^NWGMSA||charu|||||||||20250129103726+0000
OBX|9|CE|762911000000102^Informed consent given for treatment^SNM3||LA33-6^Yes^LN|||||||||20250129103726+0000
OBX|10|ST|230037^Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing^NWGMSA||Acknowledged|||||||||20250129103726+0000
OBX|11|ST|230039^Is the Person Ordering the Test the Referring Clinician^NWGMSA||No|||||||||20250129103726+0000
OBX|12|ST|unknown^Name of Supervising Clinician^NWGMSA||DESHPANDE, CHARULATA|||||||||20250129103726+0000
OBX|13|ST|97209-1^Shipment tracking number^LN||UK3096580215|||||||||20250129103726+0000
OBX|14|CE|842009^Consanguinity^SNM3||LA32-8^No^LN|||||||||20250129103726+0000
OBX|15|DT|161714006^Estimated date of delivery^SNM3||20250512103726+0000|||||||||20250129103726+0000
SPM|1|25GEN-029GN00001&R0A|^1001166717&699X0|258580003^Whole blood specimen^SNM3|||||||||||||20250129103726+0000|||Y
```

#### NonWGSTestOrderForm-CancerSolidTumor-Example

For the FHIR version see [Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example](Bundle-Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example.html)

```aiignore
MSH|^~\&|HIVE|RAX|LIMS|RJZ|20241013103300+0000||OML^O21^OML_O21|156bb6ab-15e7-42f3-a819-ecd16a5b4fbd|T|2.4|||AL
PID|1||9449307555^^^NHS^NH||Hadjkiss^Zelma||20110319||||2 Barclay Close^Fetcham^^^KT22 9SY
ORC|NW||||||||20230908|||9999999998^Smith^Hazel^^^Dr.^^^SDS|||||||||Kingston Hospital NHS Foundation Trust^^RAX01^^^ODS
OBR|1|||M119.5^Multi Target NGS Panel Small^England-GenomicTestDirectory||20230908||||||||||9999999998^Smith^Hazel^^^Dr.^^^SDS
NTE|1||Free text for diagnosis/reason for referral, transplant, life status at time of request details/ e.g. malignant tumour - molecular assessment will aid management
DG1|1||363358000^Malignant tumour of lung^SNM3
DG1|2||relapse^Relapse^England-ReasonForTesting
OBX|1|CE|128462008^Metastatic malignant neoplasm (disorder)^SNM3|||||||||||20230908
OBX|2|CE|6574001^Necrosis (morphologic abnormality)^SNM3|||||||||||20230908
SPM|1|RA257630||364611000000101^Tissue resection sample^SNM3|||||||||||||20230909110000Z|||Y
```

### ORU_R01 Unsolicited transmission of an observation message

This example is created from the original iGene Message in the next section, it is also enriched with data from the [original order example](#genomics-order-with-coded-entries). 

```aiignore
MSH|^~\&|RIE|699X0|EPR|R0A|20250814094223+0000||ORU^R01^ORU_R01|ORIE-250814-0|T|2.5.1|||AL
PID|1||9449305552^^^NHS^NH~633^^^R0A^MR||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1||||||||||||||||||1001166717^^^R0A
ORC|NW|1601737^R0A|T25-01FU^699X0
OBR|1|1601737^R0A|T25-01FU^699X0|R240.1^Specific target Targeted mutation testing^England-GenomicTestDirectory||||||||||||||||||20250814094116+0000|||F|||||||&Suttie&Fraser
OBX|1|CE|311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME|||||||||||20250129103726+0000
OBX|2|ED|1054161000000101^Genetic report^SNM3||^AP^PDF^Base64^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
```

#### Original iGene Message

```aiignore
MSH|^~\&|IGENE|MFT|EPIC|MFT|20250814094223||ORU^R01|ORIE-250814-0|T|2.3
PID||944 930 5552|||CHISLETT^Octavia||20080920|F|||||||||||944 930 5552
ORC|RE|1601737^R0A
OBR|1|1601737^R0A|T25-01FU|SANGER^TEST: Sanger Sequencing^IGEAP||20250805||||||||202508110000||^^^^^^^^PROVID^^^^PROVID||||||20250814094116|||F||^^^202508090900|||||^Suttie^Fraser
OBX|1|CE|SANGER^TEST: Sanger Sequencing^IGENE|PDF|^IGene^application/pdf^Base64^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
OBX|2|CE|311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME|||||||||||20250129103726+0000
OBX|3|CE|R240.1^Specific target Targeted mutation testing^England-GenomicTestDirectory|||||||||||20250129103726+0000
NTE|1|L|R240.1=PACKAGE: R240.1 - Diagnostic testing for known mutation(s) (Targeted mutation testing)
```

### MDM_T02 Original document notification and content

This example is created from the original iGene Message in the previous section, it is also enriched with data from the [original order example](#genomics-order-with-coded-entries).

```
MSH|^~\&|RIE|699X0|HIE|QOP|20250814094223+0000||MDM^T02|ORIE-250814-0|T|2.4|||AL
EVN|T02|20250814094223+0000
PID|1||9449305552^^^NHS^NH~633^^^R0A^MR||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1||||||||||||||||||1001166717^^^R0A
OBX|1|CE|311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME|||||||||||20250129103726+0000
OBX|2|ED|1054161000000101^Genetic report^SNM3||^AP^PDF^Base64^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
TXA||1054161000000101^Genetic report^SNM3||||20250814094116+0000||||||T25-01FU
```
