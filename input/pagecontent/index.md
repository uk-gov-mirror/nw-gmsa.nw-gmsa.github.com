## Business Overview

Diagnostic testing is essential to modern clinical care, offering objective information that supports decision-making at every stage of a patient’s journey—from initial evaluation to long-term monitoring and assessment of outcomes.

Genomic diagnostic testing contributes to this process by examining a patient’s DNA or RNA to detect genetic variations that influence disease susceptibility, diagnosis, treatment choices, and prognosis. By delivering highly specific and personalised insights, genomic testing improves the accuracy and effectiveness of clinical management.

<img style="padding:3px;width:80%;" src="NWGenomicsOverview.png" alt="NW Genomics Overview"/>
<br clear="all">

NHS North West Genomics is a new regional NHS service that consolidates clinical genomic testing across the North West of England. Although the service is delivered regionally, it also processes genomic test requests from across the UK. The service is hosted by Manchester University NHS Foundation Trust.

As part of the service transition, existing systems for electronic test ordering and reporting will be enhanced through the introduction of a Regional Integration Engine (RIE) and a Genomic Clinical Data Repository. These components enable seamless data exchange between local clinical systems and regional genomic laboratory services.

## Technical Overview

### Traditional Point-To-Point Messaging Transformation

The diagram below illustrates [point to point](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PointToPointChannel.html) messaging between an `Order Placer` and an `Order Filler`. The `Order Filler` is typically a Laboratory Information Management System (LIMS), while the `Order Placer` is usually a clinical system such as an Electronic Patient Record (EPR).

Not all interactions will necessarily be electronic. For example, reports may be sent by email, and orders may be submitted via email or physically accompany the specimen.

```mermaid
graph LR
    OrderPlacer --> |1. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller --> |2. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer  
```

In many NHS Trusts, a Trust Integration Engine (TIE) is used to facilitate this point-to-point messaging.

```mermaid
graph LR

    OrderPlacer --> |1. General Order<br/>HL7 v2 ORM_O01| TIE[Trust Integration Engine]
    TIE --> |2. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller --> |3. Laboratory Report<br/>HL7 v2 ORU_R01| TIE
    TIE --> |4. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer  
```

TIEs typically handle transformations between the different HL7 v2 variants used by Order Placers (e.g. EPRs) and Order Fillers (e.g. LIMS).

### Regional Message Routing

The regional service may support more than 20 NHS Trusts, each using different clinical systems. Within NHS North West Genomics itself, multiple LIMS and supporting clinical systems are in use.

The diagram shows a subset of these interactions for laboratory orders:

```mermaid
graph LR
  
    RIE[Regional Integration Engine]
    NHSA --> |Laboratory Order<br/>HL7 OML_O21<br/>HE LTW LAB-1| RIE
    NHSB --> RIE
    RIE --> |Laboratory Order<br/>HL7 v2 OML_O21| LIMSA
    RIE --> LIMSB

    subgraph DataContracts[Data Contract]
        NHSA[Order Placer<br/>NHS Trust A]
        NHSB[Order Placer<br/>NHS Trust B] 
    end 
      subgraph Multiple[Data Contracts & Mixed Standards]
        LIMSA[<b>Order Filler</b><br>LIMS iGene]
        LIMSB[<b>Order Filler</b><br>LIMS Shire]
    end
```

Equivalent patterns apply to laboratory reports.

```mermaid
graph LR
    subgraph Multiple[Data Contracts & Mixed Standards]
        LIMSA[<b>Order Filler</b><br>LIMS iGene]
        LIMSB[<b>Order Filler</b><br>LIMS Shire]
        LIMSC[<b>Order Filler</b><br>LIMS C]
        LIMSD[<b>Order Filler</b><br>LIMS D]
    end
    LIMSA --> |Laboratory Report<br/>HL7 v2 ORU_R01| RIE
    LIMSB --> RIE
    LIMSC --> RIE
    LIMSD --> RIE
    RIE[Regional Integration Engine] --> |Laboratory Report<br/>HL7 v2 ORU_R01<br/>IHE LTW LAB-3| NHSA
    RIE --> NHSB
    RIE --> |Document Notification<br/>HL7 MDM_T02<br/>IHE XDS/MHD| ICSA
    RIE --> ICSB
    RIE --> |Laboratory Report<br/>HL7 v2 ORU_R01<br/>IHE LTW LAB-3| APPB
    RIE --> APPA

    subgraph DataContracts[Data Contract]
        NHSA[Order Placer<br/>NHS Trust A]
        NHSB[Order Placer<br/>NHS Trust B] 
        ICSA[NHS ICS A]
        ICSB[NHS ICS B]
        APPA[NW Genomics Application 1]
        APPB[NW Genomics Application 2]
    end 
```

The main distinction between a Regional Integration Engine (RIE) and a Trust Integration Engine is that the RIE functions as a central routing hub. Each participant connects only to the RIE rather than individually integrating with multiple other systems. This significantly reduces integration complexity. Trust TIEs will still be responsible for transforming messages between their internal EPR systems and the RIE.

Because the RIE operates at a regional level, certain HL7 v2 message components must be standardised or updated. These changes ensure global uniqueness for identifiers such as medical record numbers, order numbers, and report numbers. Standard terminology sets such as SNOMED CT and LOINC will be used to define observations and orderable items. These requirements are outlined in the [Data Contract](data-intro.html). HL7 v2 message exchanges are aligned with HL7 v2.5.1 and the following IHE profiles:

#### API Contracts Part 1 – IHE Profiles and HL7 v2.5.1 Standards

- [IHE Laboratory Testing Workflow (LTW)](TLW.html) profile
- [IHE Inter Laboratory Workflow (ILW)](ILW.mw) profile (Future)
- [IHE Specimen Event Tracking (SET)](SET.html) profile (Future)

### Regional Data and Document Sharing

Traditional messaging focuses solely on communication between two systems—the order placer and the order filler—and does not support wider sharing of genomic data across multiple organisations such as NHS Trusts, GP practices, or other clinical teams.

To address this, a central Genomic Clinical Data Repository (CDR) will be established. This repository will provide a read-only [FHIR RESTful (read only API)](https://hl7.org/fhir/R4/http.html) and will be populated via data flows through the RIE.

<figure>
{%include overview-hie.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - Overview</p>
</figure>
<br clear="all">

The [Data Contract](datta-intro.html) and data structures used in the FHIR interfaces follow the same conventions as those used in the HL7 v2 message exchanges.

#### API Contracts Part 2 – IHE Profiles and HL7 FHIR R4 Standards

The CDR is expected to adopt emerging IHE Europe standards for clinical data and document sharing. These currently include:

- [IHE Mobile access to Health Documents (MHD) ITI-66 and ITI-67](MHD.html) HL7 FHIR
- [IHE Query for Existing Data for Mobile (QEDm) PCC-44](QEDm.html) HL7 FHIR
- [IHE Patient Demographics Query for Mobile (PDQm) ITI-78](PDQm.html) HL7 FHIR
- [IHE Internet User Authorization (IUA)](IUA.md) OAuth2
- [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html) HL7 FHIR

## How to Read this IG

<table >
  <thead>
    <tr>
      <th></th>
      <th>Menu Item</th>
      <th>Description</th>
      <th>Audience</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="background-color: #E1D5E7">&nbsp;&nbsp;</td>
      <td>Analysis and Design (Volume 1)</td>
      <td>Description of the processes and corresponding technical frameworks</td>
      <td>General</td>
    </tr>
    <tr>
      <td style="background-color: #F8CECC">&nbsp;&nbsp;</td>
      <td>Interfaces (Volume 2)</td>
      <td>Description of the processes and corresponding technical frameworks (HL7 v2 and FHIR Interactions)</td>
      <td>Detailed Technical (Integration Developer)</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Data Models (Volume 3)</td>
      <td>NHS North West Forms, Templates, Reports and Compositions</td>
      <td>Data Modeling (Detailed Technical)</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Artefacts (Volume 4)</td>
      <td>NHS North West Common Data Models</td>
      <td>Detailed Technical</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Development</td>
      <td>Testing, Suppport and Architecture</td>
      <td>Detailed Technical (Developer)</td>
    </tr>
  </tbody>
</table>

| Diagnostic Process                          | Analysis and Design                                                  | Interfaces                                                                                                                         | Domain Archetype                                                        | Domain Entity (Resources) <br/> Data Contract                                                     |
|---------------------------------------------|----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| [Test Order](#test-order)                   | [Send Laboratory Order (IHE LTW)](LTW.html)                          | HL7 FHIR [IHE LTW LAB-1](LAB-1.html)                                                                                               | [North West Genomics Test Order](Questionnaire-GenomicTestOrder.html)   | [ServiceRequest](StructureDefinition-ServiceRequest.html)                                         |
|                                             | [Read & Search Laboratory Order (HIE)](HIE.html)                     | HL7 FHIR [IHE QEDm PCC-44](QEDm.html)                                                                                              |                                                                         | Various [Resource Profiles](artifacts.html#7)                                                     |  
| [DiagnosticTesting](#diagnostic-testing)    | [Laboratory Testing Workflow (LTW)](LTW.html)                        | HL7 FHIR [IHE LAB-3](LAB-3.html) and HL7 v2 ORU [LAB-3/R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) | [North West Genomics Test Report](Questionnaire-GenomicTestReport.html) | [DiagnosticReport](StructureDefinition-DiagnosticReport.html)                                     |
|                                             | [Inter Laboratory Workflow (ILW)](ILW.html)                          |                                                                                                                                    |                                                                         | 
|                                             | [Send Laboratory Report Document (HIE)](HIE.html#publish-a-document) | HL7 v2 MDM [T02](hl7v2.html#mdm_t02-original-document-notification-and-content)                                                    | [North West Genomics Test Report](Questionnaire-GenomicTestReport.html) | [DocumentReference](StructureDefinition-DocumentReference.html)                                   |
|                                             | [Read & Search Laboratory Report Data (HIE)](HIE.html)               | HL7 FHIR [IHE QEDm PCC-44](QEDm.html)                                                                                              |                                                                         | Various [Resource Profiles](artifacts.html#7)                                                     |                                                             | 
|                                             | [Read & Seerch Laboratory Report Documents (HIE)](HIE.html)          | HL7 FHIR [IHE MHD ITI-66 and ITI-67](MHD.html)                                                                                     |                                                                         | [DocumentReference](StructureDefinition-DocumentReference.html)                                   | 
| [Specimen Collection](#specimen-collection) | [Specimen Event Tracking (SET)](SET.html)                            |                                                                                                                                    |                                                                         | [Specimen](StructureDefinition-Specimen.html)                                                     |
| Other                                       | [Patient Administration](PAM.html)                                   | HL7 FHIR [IHE PDQm ITI-78](QEDm.html)                                                                                              |                                                                         | [Patient](StructureDefinition-Patient.html) <br/> [Encounter](StructureDefinition-Encounter.html) |
|                                             | [Authorisation (OAuth2](authorisation.html)                          | OAUth2 [IHE IUA ITI-103 ITI-71 ITI-102](IUA.html)                                                                                  |                                                                         |                                                                                                   | 



## SNOMED CT

UK edition of SNOMED (83821000000107)

## Dependencies

{% include dependency-table.xhtml %}

## Credits

| Role(s)        | Contributor(s)                               | 
|----------------|----------------------------------------------|
|                | North West Genomic Medicine Service Alliance |
|                | Alder Hey Children's Hospital Trust          |
|                | Manchester University NHS Foundation Trust   |
|                | Liverpool Womens NHS Foundation Trust        |
|                | The Christie NHS Foundation Trust            |
|                | NHS England                                  |
| Staff Engineer | Kevin Mayfield, Aire Logic & Mayfield IS     |      
