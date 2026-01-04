
This implementation guide primarily focuses on the **Diagnostic Workflow** and how it integrates within the broader **health data model**, as illustrated in the diagram above.
- **Patient Care** and **Patient Administration** are typically found in NHS providers **Electronic Patient Record** systems
- **Care Directory Service** on the other hand, are centrally defined by NHS England, with supporting APIs also provided by NHS England (for example, the ODS API).

In software design, these areas are often referred to as [domains](https://en.wikipedia.org/wiki/Domain-driven_design). The **Genomic Diagnostic Workflow** operates across several of these domains — in software architecture terms, this is known as a [bounded context](https://martinfowler.com/bliki/BoundedContext.html).

<figure>
{%include Diagnostic-Workflow-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Diagnostic Workflow - MindMap</p>
</figure>
<br clear="all">

### Archetypes, Entities, and Events

This guide uses the following concepts:

- Health Informatics [Archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)), this is model associated with messaging.
- [Entities](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) such as HL7 v2 segments and FHIR resources.
- [Events](https://en.wikipedia.org/wiki/Event_(computing)) such as HL7 v2 ADT and SET event feeds.

To align these perspectives, this guide defines the following relationship:

```mermaid
---
title: Archetype, Entities and Events
---
erDiagram 
    Archetype ||--|{ Entity : hasMany
    Archetype }|--|| Event : hasMany
    Event ||--|| Entity : oftenOne2One
```

The **Archetype** follows the **Domain Archetype** concept from [Data Mesh](https://en.wikipedia.org/wiki/Data_mesh) principles and serves as a bridge between data architecture and software engineering.

- **Domain Archetype** may encompass multiple **Entities** and **Events**.
- **Entities** and a **Events** can have the same content and may be used interchangeably.

| Domain Archetype  | Archetype Examples                                 | Entity Examples   | Event Examples |
|-------------------|----------------------------------------------------|-------------------|----------------|
| Laboratory Order  | HL7 v2 OML_O21                                     | HL7 v2 Segment    |                |
| Laboratory Report | HL7 Lab Results Interface (extends HL7 v2 ORU_R01) | HL7 v2 Segment    |                |
|                   | Genomic Reporting - HL7 FHIR Profile               | HL7 FHIR Resource | FHIR Workflow  |
|                   | openEHR Genomic Module Archetypes                  |                   |                |
| Health Document   | IHE XDS Submission Set                             |                   | HL7 v2 MDM_T01 |

This domain focuses on genomic and molecular diagnostics, and the main **Archetypes** are: 

- [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
- [Genomic Test Report](Questionnaire-GenomicTestReport.html) – Summarizes genomic testing results.
  - Variant – Represents a specific genetic variant or mutation.
  - Diagnostic Implication – Links variants to clinical significance (e.g., pathogenicity, treatment implications).


### Data Contracts

Data contracts govern all interactions defined within this implementation guide and apply to all entities, messages (archetypes), and events. They are primarily specified using HL7 FHIR; where appropriate, mappings to HL7 v2 and IHE XDS are also provided.
<div class="alert alert-info" role="alert">
Although this guide primarily uses HL7 FHIR and HL7 v2 to support interactions between health providers, it does not mandate or promote the use of these technical standards for data persistence within EHR, LIMS, or analytics systems. Suppliers may adopt alternative standards where more appropriate, such as <a href="https://openehr.org/" target="_blank">openEHR</a> for electronic health record systems or the <a href="https://www.ga4gh.org/" target="_blank">Global Alliance for Genomics and Health (GA4GH)</a> standards for research and system databases.
</div>

```mermaid
graph TD
    EHR[EPR] <--> |HL7 v2<br/>Orders & Reports| RIE
    LIMS[LIMS] <--> |HL7 v2<br/>Orders & Reports| RIE

    subgraph HIE["Health Information Exchange"]
        RIE[Regional Integration Engine] --> |Store<br/>HL7 FHIR| CDR[Genomic Data Repository]
    end
    Clinician[Data Sharing<br/>Clinical Apps<br/>Single Patient Record] --> |Read<br/>HL7 FHIR| CDR
    AI[Operational AI] --> |Read<br/>HL7 FHIR| CDR
    Ops["Operations Monitoring (Real Time Analytics)"] --> |Read<br/>HL7 FHIR| CDR

    CDR --> OLAP[Data Warehouse]
    A[Analytics and AI] --> OLAP
    OLAP --> FDP[Federated Data Platform]
    A --> FDP

    classDef green fill:#D5E8D4;

    class FDP,OLAP,CDR,LIMS,EHR green
```

The diagram above illustrates the scope of the data contracts covered by this guide. Specifically, it **excludes** the definition of data contracts for the following systems and domains:

- EPR (Electronic Patient Record) systems (e.g. [openEHR Genomics](https://ckm.openehr.org/ckm/projects/1013.30.50) )
- Genomic Applications (e.g. [Global Alliance for Genomics and Health](https://www.ga4gh.org/))
- LIMS
- OLAP (Online Analytical Processing) and FDP (Federated Data Platform)

This guide **includes** the definition of data contracts for:

- **Business-to-Business (B2B):** Use of HL7 FHIR to read data from the Clinical Data Repository.
- **Data Pipeline:** Internal use of HL7 FHIR for data exchange between the Regional Integration Engine and the Clinical Data Repository.
- **Business-to-Business (B2B):** Use of HL7 v2 and HL7 FHIR for interactions between LIMS and EPR systems.
- **Data Pipeline:** Use of HL7 v2, HL7 FHIR and IHE XDS for data exchange between the CDR and Regional Document Sharing systems such as IHE XDS, GMCR and National Record Locator. Note: data contract downgrades will be present in these pipelines.

#### Differences between base HL7 FHIR and V2 standards (including UK Core)

This model requires coordination between NHS Trusts and regional standardisation of HL7 (v2 and FHIR). Key changes include:

- **Medical Record Number (MRN):** MRNs may overlap across Trusts, so they are augmented with the ODS code of the originating NHS organisation.
- **Patient Identifiers: NHS Number, CHI Number, and HSNI** become the primary patient identifiers. NHS Numbers must be verified against national demographic services.
- **Clinical Coding: SNOMED CT and LOINC** are used for OBX segments and observations. Local codes may still be included where required.
- **Specimen Messaging:** Specimen information must be included in orders, requiring the use of HL7 v2.5.1 OML_O21 rather than ORM_O01. This supports distributed genomic testing, where multiple tests may be performed on a single specimen across several laboratories.

<div class="alert alert-success" role="alert">
This data contract uses as <a href="DHCW-HL7-v2-5-1-ORUR01-Specification.pdf" _target="_blank">Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide</a>,
<a href="https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws" _target="_blank">NHS England HL7 v2 ADT Message Specification</a>, and for document metadata
<a href="https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf" _target="_blank">IHE Europe Document Metadata</a> and <a href="https://www.digihealthcare.scot/app/uploads/2024/05/CDI-Standard-V4.5-FINAL.pdf" _target="_blank">Digital Health and Care Scotland - (EH4001) CLINICAL DOCUMENT INDEXING STANDARDS</a> as core UK HL7/IHE standards.
</div>

The **RIE will not undertake any transformation of HL7 messages to meet external system or individual NHS Trust requirements**. Responsibility for transforming messages for supplier systems remains with each NHS Trust’s TIE. It is therefore the responsibility of the NHS Trust TIE to ensure that data is provided in the correct format for its system suppliers. Any amendments to this arrangement may be requested through the [change process](#data-contract-issues-and-change-process).

<div class="alert alert-success" role="alert">
Data contracts are expected to apply across all message and payload formats used at a regional level, including HL7 v2, FHIR, DICOM, and IHE XDS.
</div>

#### Key Data Contracts

| Data Contract                                             | Type              | HL7 FHIR                                                        | HL7 v2 Segment                                           | IHE XDS           | HL7 v2 Message                                                                   | FHIR Message/Transaction                                             | 
|-----------------------------------------------------------|-------------------|-----------------------------------------------------------------|----------------------------------------------------------|-------------------|----------------------------------------------------------------------------------|----------------------------------------------------------------------|
| [Genomic Test Order](Questionnaire-GenomicTestOrder.html) | Message/Archetype |                                                                 |                                                          |                   | [OML_O21](hl7v2.html#oml_o21-laboratory-order)                                   | [Message Definition - Laboratory Order](MessageDefinition-laboratory-order.html)                                                                 |
| [Genomic Test Report](Questionnaire-GenomicTestReport.html)                                   | Message/Archetype |                                                                 |                                                          |                   | [ORU_R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) |                                                                      |  
| Patient                                                   | Entity & Event    | [Patient](StructureDefinition-Patient.html)                     | [PID](hl7v2.html#pid)                                    |                   |                                                                                  |                                                                      |
| Organisation                                              | Entity            | [Organization](StructureDefinition-Organization.html)           |                                                          |                   |                                                                                  |                                                                      |
| Service Request                                           | Entity            | [ServiceRequest](StructureDefinition-ServiceRequest.html)       | [ORC](hl7v2.html#orc)                                    |                   |                                                                                  |                                                                      | 
| Diagnostic Report                                         | Entity            | [DiagnosticReport](StructureDefinition-DiagnosticReport.html)   | [OBR](hl7v2.html#obr)                                    |                   |                                                                                  |                                                                      |
| Observation                                               | Entity            | [Observation](StructureDefinition-Observation.html)             | [OBX](hl7v2.html#obx)                                    |                   |                                                                                  |                                                                      |
| Document Metadata                                         | Entity & Event    | [DocumentReference](StructureDefinition-DocumentReference.html) | [TXA](hl7v2.html#txa) and [OBX](hl7v2.html#obx-type--ed) | Document Entry - [DocumentReference](StructureDefinition-DocumentReference.html) | [MDM_T02](hl7v2.html#mdm_t02-original-document-notification-and-content)         | See [IHE MHD ITI-105](https://profiles.ihe.net/ITI/MHD/ITI-105.html) |

#### Data Contract Issues and Change Process

1. Data consumers identify data constraints or issues.
2. Requirements or issues are logged in the [NH Genomics IG issues](https://github.com/nw-gmsa/nw-gmsa.github.com/issues)
3. Business stakeholders, suppliers, and integration partners (collectively, the `NW Genomics Data Team`) review the item and assess its feasibility.
4. The data contract is created or updated within this implementation guide (for example, via a pull request).
5. The proposed change is reviewed and approved by the `NW Genomics Data Team`.
6. Once approved, the change is released.

```mermaid
flowchart TD
    A[Data Consumer<br/>Identifies Issue or New Constraint]
    B[Log Requirement / Issue<br/>NH Genomics IG Issues]
    C[NW Genomics Data Team<br/>Review & Feasibility Assessment]
    D["Create or Update<br/>Data Contract<br/>Implementation Guide (PR)"]
    E[NW Genomics Data Team<br/>Review & Approval]
    F[Release Change]

    A --> B --> C --> D --> E --> F
```

## Relationship to Other Guides

The data model used in this guide is a combination of data and workflow requirements from a variety of other guides.

<img style="padding:3px;width:70%;" src="GenomicsIG.drawio.png" alt="North West Genomics IG"/>
<br clear="all">
<p class="figureTitle">North West Genomics IG</p> 
<br clear="all">

