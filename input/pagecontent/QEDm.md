<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

This API for the NW GMSA Clinical Data Repository is based on the following API contracts:

- [IHE Mobile Query Existing Data [PCC-44]](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html)
- [INTEROPen/NHS England Care Connect API](https://nhsconnect.github.io/CareConnectAPI) updated to FHIR R4.

The search parameters are based on [FHIR Search](https://hl7.org/fhir/R4/search.html) which provides detailed description of the parameters and value types.

## Condition

<table style="">
    <tr>
        <td>
            <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Condition.html" _target="_blank">Condition</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#dg1" _target="_blank">DG1</a> 
            </div>
        </td>
	</tr>
</table>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Condition/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Condition?[parameter]=[value]]
</div>


| Parameter    | Type      | Search                                               | Note                                        |
|--------------|-----------|------------------------------------------------------|---------------------------------------------|
| _lastUpdated | date      | GET [base]/Condition?_lastUpdated=[date]             | Date the resource was last updated          |
| identifier   | token     | GET [base]/Condition?identifier=[system&#124;][code] | A unique identifier of the condition record |
| patient      | reference | GET [base]/Condition?patient=[id]                    | Who has the condition?                      |

#### Examples

Searching for Conditions for Patient Liverpool.
```
GET [base]/Condition?patient=Patient-Liverpool
Accept: application/fhir+json
```
[Response](Bundle-036ceda5-8eea-42d5-9e8f-f977287c0dd6.json.html)

## DiagnosticReport

<table style="">
    <tr>
        <td>
            <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a> and <a href="hl7v2.html#obr" _target="_blank">OBR</a>  
            </div>
        </td>
	</tr>
</table>

### Read

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                            | Note                                                                                                                                             |
|--------------|-----------|-------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/DiagnosticReport?_lastUpdated=[date]                   | Date the resource was last updated                                                                                                               |
| identifier   | token     | GET [base]/DiagnosticReport?identifier=[system&#124;][code]       | An identifier for the report                                                                                                                     |
| patient      | reference | GET [base]/DiagnosticReport?patient=[id]                          | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query.                                        |
| category     | token     | GET [base]/DiagnosticReport?category=[system&#124;][code]         | Which diagnostic discipline/department created the report                                                                                        |
| code         | token     | GET [base]/DiagnosticReport?code=[system&#124;][code]             | The code for the report, as opposed to codes for the atomic results, which are the names on the observation resource referred to from the result |
| date         | date      | GET [base]/DiagnosticReport?date=[date]                           | The clinically relevant time of the report                                                                                                       |
| _include     |           | GET [base]/DiagnosticReport?_include=DiagnosticResult:[parameter] |                                                                                                                                                  | 
| _id          |           | GET [base]/DiagnosticReport?_id=[id]                              |                                                                                                                                                  |

#### Example

Searching for a DiagnosticReport by code (Diagnostic testing for known variant(s)).

```
GET [base]/DiagnosticReport?code=https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory|R240.1
Accept: application/fhir+json
```

Searching for a DiagnosticReport by category (Genetics) and patient.

```
GET [base]/DiagnosticReport?category=http://terminology.hl7.org/CodeSystem/v2-0074|GE&patient=995525
Accept: application/fhir+json
```

Return a single DiagnosticReport with its associated results (Observation).

```
GET [base]/DiagnosticReport?_id=46120&_include=DiagnosticReport:result
Accept: application/fhir+json
```

## Encounter

<table style="">
    <tr>
        <td>
           <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Encounter.html" _target="_blank">Encounter</a> 
           </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#pv1" _target="_blank">PV1</a> 
            </div>
        </td>
	</tr>
</table>


This Encounter represents the overall episode or stay, for further information see [Interweave Encounter Grouping](https://fhir.interweavedigital.com/R4/StructureDefinition-Interweave-EncounterGrouping.html)

### Read

<div class="alert alert-success" role="alert">
GET [base]/Encounter/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Encounter?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                               | Note                                                |
|--------------|-----------|------------------------------------------------------|-----------------------------------------------------|
| _lastUpdated | date      | GET [base]/Encounter?_lastUpdated=[date]             | Date the resource was last updated                  |
| identifier   | token     | GET [base]/Encounter?identifier=[system&#124;][code] | Identifier(s) by which this encounter is known      |
| patient      | reference | GET [base]/Encounter?patient=[id]                    | The patient present at the encounter                |
| date         | date      | GET [base]/Encounter?date=[date]                     | A date within the actualPeriod the Encounter lasted |

#### Example

Searching for an Encounter by Visit Number.

```
GET [base]/Encounter?identifier=http://www.acme.org/encounter/identifiers/R0A|1001166717
Accept: application/fhir+json
```

## Observation

<table style="">
    <tr>
        <td>
          <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Observation.html" _target="_blank">Observation</a> 
          </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#obx" _target="_blank">OBX</a>  
            </div>
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/Observation/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Observation?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                      | Note                                                                                                      |
|--------------|-----------|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/Observation?_lastUpdated=[date]             | Date the resource was last updated                                                                        |
| identifier   | token     | GET [base]/Observation?identifier=[system&#124;][code] | The unique id for a particular observation                                                                |
| patient      | reference | GET [base]/Observation?patient=[id]                    | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |
| category     | token     | GET [base]/Observation?category=[system&#124;][code]   | The classification of the type of observation                                                             |
| code         | token     | GET [base]/Observation?code=[system&#124;][code]       | The code of the observation type                                                                          |
| date         | date      | GET [base]/Observation?date=[date]                     | Obtained date/time. If the obtained element is a period, a date that falls in the period                  |
| combo-code         | token     | GET [base]/Observation?combo-code=[system&#124;][code]       | The code of the observation type or component type                                                        |

#### Examples

Searching for an [Variant](StructureDefinition-Observation-Variant.html) Observation by code.
```
GET [base]/Observation?code=http://loinc.org|69548-6&patient=Patient-Liverpool
Accept: application/fhir+json
```
[Response](Bundle-187a20ef-9b81-4c83-84f7-140c210f8706.json.html)

---

Searching for a [Variant](StructureDefinition-Observation-Variant.html) Observation with a specific gene (LOINC 48018-6 - Gene studied [ID]) of `7127` (MLH1).
```
GET [base]/Observation?combo-code=http://loinc.org|48018-6&combo-value-concept=7127
Accept: application/fhir+json
```
[Response](Bundle-187a20ef-9b81-4c83-84f7-140c210f8706.json.html)

---

Searching for a [Diagnostic Implication](StructureDefinition-Observation-DiagnosticImplication.html) Observation by code.
```
GET [base]/Observation?code=diagnostic-implication&patient=Patient-Liverpool
Accept: application/fhir+json
```
[Response](Bundle-92a0a6c6-404f-4347-8de4-fa1c457a037e.json.html)


## Patient


<table style="">
    <tr>
        <td>
           <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#pid" _target="_blank">PID</a> 
            </div>
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/Patient/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Patient?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                         | Note                               |
|--------------|-----------|------------------------------------------------|------------------------------------|
| _lastUpdated | date      | GET [base]/Patient?_lastUpdated=[date]      | Date the resource was last updated |
| identifier   | token     | GET [base]/Patient?identifier=[system&#124;][code] | A patient identifier               |

#### Example

Searching for a Patient via NHS Number.
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552
Accept: application/fhir+json
```
[Response](Bundle-PDQSearchResults.json.html)

---

Searching for a Patient via Medical Record Number.
```
GET [base]/Patient?identifier=http://www.acme.org/patient/identifier|A12356565
Accept: application/fhir+json
```
[Response](Bundle-c39fc97b-e99f-47b2-8660-d3d6b8840d20.json.html)

## ServiceRequest

<table style="">
    <tr>
        <td>
         <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a> and <a href="hl7v2.html#obr" _target="_blank">OBR</a>  
            </div>
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest/{id}
</div>

### Search 

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest?[parameter]=[value]]
</div>

| Parameter                                 | Type      | Search                                                    | Note                                                                                                      |
|-------------------------------------------|-----------|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated                              | date      | GET [base]/ServiceRequest?_lastUpdated=[date]             | Date the resource was last updated                                                                        |
| identifier                                | token     | GET [base]/ServiceRequest?identifier=[[system&#124;][code] | Identifiers assigned to this order                                                                        |
| patient                                   | reference | GET [base]/ServiceRequest?patient=[id]                    | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |
| [assigner](SearchParameter-assigner.html) | token | GET [base]/ServiceRequest?assigner=[system&#124;][code]   | Assigning Authority (ODS Code) for identifiers assigned to this order                                     |
| code                                      | token | GET [base]/ServiceRequest?code=[system&#124;][code]       | What is being requested/ordered                                                                           |

#### Example

Searching for a ServiceRequest via Order Placer Number.

```
GET [base]/ServiceRequest?identifier=http://www.acme.org/servicerequest/identifier|1601737
Accept: application/fhir+json
```

Searching for a ServiceRequest via Order Placer Number and Assigning Authority. Note in this example the system for `assigner` and `identifier` have been omitted.

```
GET [base]/ServiceRequest?identifier=1601737&assigner=R0A
Accept: application/fhir+json
```

Searching for a ServiceRequest by code and patient

```
GET [base]/ServiceRequest?code=https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory|R240.1&patient=995525
Accept: application/fhir+json
```

## Specimen

<table style="">
    <tr>
        <td>
                 <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#spm" _target="_blank">SPM</a>   
            </div>
        </td>
	</tr>
</table>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Specimen/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Specimen?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                           | Note                                                                                                      |
|--------------|-----------|--------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/Specimen?_lastUpdated=[date]    | Date the resource was last updated                                                                                                          |
| identifier   | token     | GET [base]/Specimen?identifier=[system&#124;][code] | The unique identifier associated with the specimen                                                                                                          |
| accession   | token     | GET [base]/Specimen?accession=[system&#124;][code] | The accession number associated with the specimen                                                                                                          |
| patient      | reference | GET [base]/Specimen?patient=[id]           | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |


#### Example

Searching for a Specimen via Accession Number.

```
GET [base]/Specimen?identifier=http://www.example.org/specimen/accession|1001166717
Accept: application/fhir+json
```

## Task

<table style="">
    <tr>
        <td>
            <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Task.html" _target="_blank">Task</a> 
            </div>
        </td>
        <td>
            &nbsp;
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/Task/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Task?[parameter]=[value]]
</div>

| Parameter            | Type      | Search                                                    | Note                                                                                                      |
|----------------------|-----------|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated         | date      | GET [base]/Task?_lastUpdated=[date]                       | Date the resource was last updated                                                                                                          |
| identifier           | token     | GET [base]/Task?identifier=[system&#124;][code]           | Search for a task instance by its business identifier                                                                                                          |
| patient              | reference | GET [base]/Task?patient=[id]                              | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |
| code                 | token     | GET [base]/Task?code=[system&#124;][code]                 | Search by task code |
| authored-on          | date      | GET [base]/Task?authored-on=[date]                        | Search by creation date |
| requester:identifier | token     | GET [base]/Task?requester:identifier=[system&#124;][code] | Search by task requester |
| owner:identifier     | token     | GET [base]/Task?owner:identifier=[system&#124;][code]     | Search by task owner |
| status               | token     | GET [base]/Task?status=[code]                             | Search by task status |

#### Example

Searching for a `requested` Task for an Organisation.

```
GET [base]/Task?status=requested&owner:organization=https://fhir.nhs.uk/Id/ods-organization-code|699X0
Accept: application/fhir+json
```

Searching for updates for to a Task requested by an Organisation since 11th July 2025

```
GET [base]/Task?requester:organization=https://fhir.nhs.uk/Id/ods-organization-code|R0A&_lastUpdated=ge2025-07-11
Accept: application/fhir+json
```
