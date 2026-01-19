<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

- [NHS England FHIR Genomics Implementation Guide - Current State vs Future State](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Current-State-vs-Future-State)
- [AU eRequesting Implementation Guide](https://build.fhir.org/ig/hl7au/au-fhir-erequesting/index.html) which represents HL7 FHIR pathology orders and reports for two ICS within the region (Magentus).

## Laboratory Order Management

A single laboratory order may generate multiple reports. Throughout the process, the order placer needs to be informed of the order’s progress—particularly when the laboratory has fully completed it.

The overall status of the order is tracked using a `Task`, which is updated as work progresses.


```mermaid
graph TD
    LaboratoryOrder --> CreateTask[Create Task]
    CreateTask --> |"'Process Genomic Test Request'<br/> Task (accepted)"| AutomationMananger[Automation Mananger] 

    UpdateTask --> |"'Process Genomic Test Request'<br/>Task (in-progress)"| AutomationMananger
    LaboratoryReport --> IsOrderComplete{Is Order Completed?}
    IsOrderComplete --> |Yes| CompleteTask
    IsOrderComplete -->  |No| UpdateTask[Update Task]
    CompleteTask -->  |"'Process Genomic Test Request'<br/>Task (completed)"| AutomationMananger
```

- When the order is first received, a Task is created to represent it, and its status is set to `accepted`.
- As each report arrives, the Task is updated to reflect progress, moving to `in-progress`.
- The order is considered complete once all expected reports have been received, at which point the Task moves to `completed`.

### Data Model

This model is based on a merge of NHS England Genomcis and AU eRequesting.

| FHIR Task element                     | Value Set / Data Type                                                                                                                                | Cardinality | Reference                                                 |
|---------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------------------------|
| status                                | [Task Status](https://hl7.org/fhir/R4/valueset-task-status.html)                                                                                     | 1..1        |                                                           |
| businessStatus (NHS England Genomics) | [Business Status Genomics](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/CodeSystems/Genomic-Business-Status) | 0..1        |                                                           | 
| intent                                | [Task Intent](https://hl7.org/fhir/R4/valueset-task-intent.html)                                                                                     | 1..1        |                                                           |
| identifier                            | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                                                                                    | 0..1        |                                                           |
| groupIdentifier                       | [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)                                                                                    | 1..1        |                                                           |  
| code (generic)                        | `fulfill` (http://hl7.org/fhir/CodeSystem/task-code)                                                                                                 | 1..1        |                                                           |
| code (NHS England Genomics)                    | `Process Genomic Test Request` (https://fhir.nhs.uk/CodeSystem/task-code-genomics)                                                                   | 1..1        |                                                           |
| focus                                 |                                                                                                                                                      | 1..1        | [ServiceRequest](StructureDefinition-ServiceRequest.html) |
| for                                   | identifier [NHS Number](StructureDefinition-NHSNumber.html)                                                                                          | 1..1        | [Patient](StructureDefinition-Patient.html)               |
| requester                             | identifier [Organisation Code ](StructureDefinition-OrganisationCode.html)                                                                           | 1..1        | Preferred [Organization][StructureDefinition-Organization.html]     |
| owner                                 | identifier [Organisation Code ](StructureDefinition-OrganisationCode.html)                                                                           | 0..1        | Preferred [Organization][StructureDefinition-Organization.html]     |

### Caveats

The logic for determining when an order is complete may not always be accurate. For example, the laboratory may decide to perform additional or follow-up tests on the same specimen.

For this reason, it is advisable that the laboratory emit explicit events indicating that:

- the order is complete,
- new tests have been initiated, or
- existing tests have been modified.

[IHE Pathology and Laboratory Medicine (PaLM) Volume 2 - LAB-4](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf) from the LIMS, offers a potential approach to handling this.

## Specimen Collection

Testing cannot begin until a specimen has been collected. Activities such as biopsies or sample collection occur outside the core diagnostic workflow. Monitoring the progress of specimen collection is important for supporting timely diagnostic processing.

```mermaid
graph TD
    LaboratoryOrder[Laboratory Order] --> CreateTask[Create Task]
    CreateTask --> |"'Specimen Collection'<br/> Task (requested)"| AutomationMananger[Automation Mananger] 
    Facility[Specimen Collection/Laboratory Facility] --> UpdateTask
    UpdateTask[Update Task] --> |"'Specimen Collection'<br/>Task(as indicated by event)"| AutomationMananger
    LaboratoryReport[Laboratory Report] --> CompleteTask
    CompleteTask --> |"'Specimen Collection'<br/>Task (completed)"| AutomationMananger
```

- When an order is received with Specimen Collection, a Task is created to represent it.
- When a report is received, the Task is updated to reflect progress.

### Data Model

This model is based on a merge of NHS England Genomcis and AU eRequesting.

| FHIR Task element                            | Value Set / Data Type                                                                                                                           | Cardinality | Reference                                                       |
|----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------------------------------|
| status                                       | [Task Status](https://hl7.org/fhir/R4/valueset-task-status.html)                                                                                | 1..1        |                                                                 |
| businessStatus (IHE Specimen Event Tracking) | Specimen related trigger events from [Events v203](http://terminology.hl7.org/ValueSet/v2-0003)                                                 | 0..1        |                                                                 |
| businessStatus (NHS England Genomics)        | [Business Status Genomics](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/CodeSystems/Genomic-Business-Status) | 0..1        |                                                                 | 
| intent                                       | [Task Intent](https://hl7.org/fhir/R4/valueset-task-intent.html)                                                                                | 1..1        |                                                                 |
| identifier                                   | [Placer Specimen Number](StructureDefinition-CorrelationIdentifier.html)                                                                            | 0..1        |                                                                 |
| groupIdentifier                              | [Accession Number](StructureDefinition-AccessionNumber.html)                                                                                    | 1..1        |                                                                 |  
| code (generic)                               | `fulfill` (http://hl7.org/fhir/CodeSystem/task-code)                                                                                            | 1..1        |                                                                 |
| code (NHS England Genomics)                  | `Sample Processing` (https://fhir.nhs.uk/CodeSystem/task-code-genomics)                                                                         | 1..1        |                                                                 |
| focus                                        |                                                                                                                                                 | 1..1        | [Specimen](StructureDefinition-Specimen.html)                   |
| for                                          | identifier [NHS Number](StructureDefinition-NHSNumber.html)                                                                                     | 1..1        | [Patient](StructureDefinition-Patient.html)                     |
| requester                                    | identifier [Organisation Code ](StructureDefinition-OrganisationCode.html)                                                                      | 1..1        | Preferred [Organization][StructureDefinition-Organization.html] |
| owner                                        | identifier [Organisation Code ](StructureDefinition-OrganisationCode.html)                                                                      | 0..1        | Preferred [Organization][StructureDefinition-Organization.html]           |

SNOMED codes for specimen collection exist, e.g. `2620001000004108 Specimen collection procedure`.

### Caveats

Specimen-related information may be limited in both laboratory orders and reports. In some older HL7 implementations, the `SPM` segment may not be included at all.

To address these gaps, the following approaches can be used:

- [IHE Pathology and Laboratory Medicine (PaLM) Volume 2 - LAB-4](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf) from the LIMS, which can be issued whenever specimen details are updated.
- use [IHE Specimen Event Tracking (SET)](SET.html), which allows the laboratory facility to send specimen-related event messages to the central automation management system and from the specimen collection facility—typically an Electronic Patient Record (EPR) system.
