## Message Based Workflow

### Traditional Point-To-Point Messaging Transformation

The diagram below illustrates [point to point](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PointToPointChannel.html) messaging between an `Order Placer` and an `Order Filler`. The `Order Filler` is typically a Laboratory Information Management System (LIMS), while the `Order Placer` is usually a clinical system such as an Electronic Patient Record (EPR).

Not all interactions will necessarily be electronic. For example, reports may be sent by email, and orders may be submitted via email or physically accompany the specimen.

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |2. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer  
    
    classDef purple fill:#E1D5E7;
    class OrderPlacer,OrderFiller purple
```

In many NHS Trusts, a Trust Integration Engine (TIE) is used to facilitate this point-to-point messaging.

```mermaid
graph LR

    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 v2 ORM_O01| TIE["Trust Integration Engine (TIE)"]
    TIE --> |2. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |3. Laboratory Report<br/>HL7 v2 ORU_R01| TIE
    TIE --> |4. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer 
    
    classDef purple fill:#E1D5E7;
    class OrderPlacer,OrderFiller purple 
```

TIEs typically handle transformations between the different HL7 v2 variants used by Order Placers (e.g. EPRs) and Order Fillers (e.g. LIMS).

### Regional Orchestration Engine (RIE) – Initial Interoperability For Existing Messaging Flows

To support ordering and reporting at a regional level, [IHE Laboratory Testing Workflow (LTW)](LTW.html) will be adopted using HL7 v2.5.1 message formats. This includes moving from ORM_O01 to OML_O21 to support the SPM (Specimen) segment.

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>IHE LTW LAB-1<br/>HL7 v2.5.1 OML_O21| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |2. Laboratory Report<br/>IHE LTW LAB-3<br/>HL7 v2.5.1 ORU_R01| OrderPlacer  
    
    classDef purple fill:#E1D5E7;
    class OrderPlacer,OrderFiller purple
```

Existing interfaces to NW Genomics LIMS will be migrated to use the Regional Orchestration Engine (RIE). The RIE performs similar functions to NHS Trust TIEs, and in the interim phase will perform pass through routing of messages only.
Note the use of the IHE LTW profile and the HL7 v2.5.1 message format is only expected to be implemented between the NHS Trust TIE and Regional RIE..

```mermaid
graph LR

    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 v2 ORM_O01| TIE["Trust Integration Engine (TIE)"]
    TIE --> |2. General Order<br/>IHE LTW LAB-1<br/>HL7 v2.5.1 OML_O21 or FHIR Message O21| RIE
    RIE["Regional Orchestration Engine (RIE)"] --> |3. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |4. Laboratory Report<br/>HL7 v2 ORU_R01| RIE
    RIE --> |5. Laboratory Report<br/>IHE LTW LAB-3<br/>HL7 v2.5.1 ORU_R01| TIE
    TIE --> |6. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer
    
    classDef purple fill:#E1D5E7;
    class OrderPlacer,OrderFiller purple
```


### Regional Orchestration Engine (RIE) - Regional Interoperability

The regional genomic service supports more than 20 NHS Trusts, each potentially operating different clinical systems. Within NHS North West Genomics itself, multiple LIMS and supporting clinical systems are in use. Under a traditional point-to-point integration model, this rapidly leads to a highly complex and fragile integration landscape.

```mermaid
graph LR

    OrderPlacerA[<b>Order Placer</b><br/>NHS Trust A]
    OrderPlacerB[<b>Order Placer</b><br/>NHS Trust B]
    OrderPlacerC[<b>Order Placer</b><br/>NHS Trust C]

    LIMSA[<b>Order Filler</b><br>LIMS iGene]
    LIMSB[<b>Order Filler</b><br>LIMS B]
    LIMSC[<b>Order Filler</b><br>LIMS C]
    LIMSD[<b>Order Filler</b><br>LIMS D]

    OrderPlacerA <--> LIMSA
    OrderPlacerA <--> LIMSB
    OrderPlacerA <--> LIMSC
    OrderPlacerA <--> LIMSD

    OrderPlacerB <--> LIMSA
    OrderPlacerB <--> LIMSB
    OrderPlacerB <--> LIMSC
    OrderPlacerB <--> LIMSD

    OrderPlacerC <--> LIMSA
    OrderPlacerC <--> LIMSB
    OrderPlacerC <--> LIMSC
    OrderPlacerC <--> LIMSD
```

To address this challenge, the RIE acts as a **central routing and interoperability hub**. All orders and reports are exchanged between NHS Trust ordering systems and North West Genomics LIMS platforms via the RIE.

Rather than maintaining multiple bespoke integrations, each participant integrates once with the RIE. Trust Integration Engines remain responsible for transforming messages between local EPR systems and the regional standard used by the RIE.

A key element of this approach is the introduction of `standardised message formats and interactions` between Trust TIEs and the RIE. These standards are based on a single, shared data model known as the `Data Contract`.


```mermaid
graph LR
  
    subgraph NHSTrustA[NHS Trust A]
        NHSA[<b>Order Placer</b><br/>EPR]
      
    end    

    subgraph NHSTrustB[NHS Trust B]
        NHSB[<b>Order Placer</b><br/>EPR] 
        
    end
    subgraph DataContracts[Data Contract]
        TIEA["NHS Trust A Integration Engine (TIE)"]
        TIEB["NHS Trust B Integration Engine (TIE)"]
        RIE["Regional Orchestration Engine (RIE)"]
    end
    NHSA --> |Laboratory Order<br/>HL7 ORM_O01| TIEA
    NHSB --> |Laboratory Order<br/>HL7 OML_O21| TIEB 
    TIEA --> |Laboratory Order<br/>HL7 OML_O21<br/>HE LTW LAB-1| RIE
    TIEB --> |Laboratory Order<br/>HL7 OML_O21<br/>HE LTW LAB-1| RIE
 
    NHSB --> RIE
    RIE --> |Laboratory Order<br/>HL7 v2 OML_O21| LIMSA
    RIE --> LIMSB
    RIE --> LIMSC
    RIE --> LIMSD
     
    LIMSA[<b>Order Filler</b><br>LIMS iGene]
    LIMSB[<b>Order Filler</b><br>LIMS Shire]
    LIMSC[<b>Order Filler</b><br>LIMS C]
    LIMSD[<b>Order Filler</b><br>LIMS D]
```

Equivalent patterns apply to laboratory reports.

```mermaid
graph LR
    subgraph NHSTrustA[NHS Trust A]
        NHSA[<b>Order Placer</b><br/>EPR]
    end    

    subgraph NHSTrustB[NHS Trust B]
        NHSB[<b>Order Placer</b><br/>EPR] 
    end

    subgraph DataContracts[Data Contract]
        RIE["Regional Orchestration Engine (RIE)"]
        TIEA["NHS Trust A Integration Engine (TIE)"]
        TIEB["NHS Trust B Integration Engine (TIE)"]
  
    end 
    ICSA[NHS ICS A]
    ICSB[NHS ICS B]
    APPA[NW Genomics Application 1]
    APPB[NW Genomics Application 2]

    LIMSA[<b>Order Filler</b><br>LIMS iGene]
    LIMSB[<b>Order Filler</b><br>LIMS Shire]
    LIMSC[<b>Order Filler</b><br>LIMS C]
    LIMSD[<b>Order Filler</b><br>LIMS D]
   
    LIMSA --> |Laboratory Report<br/>HL7 v2 ORU_R01| RIE
    LIMSB --> RIE
    LIMSC --> RIE
    LIMSD --> RIE
    RIE["Regional Orchestration Engine (RIE)"] --> |Laboratory Report<br/>HL7 v2 ORU_R01<br/>IHE LTW LAB-3| TIEA
    RIE --> |Laboratory Report<br/>HL7 v2 ORU_R01<br/>IHE LTW LAB-3| TIEB
    TIEA --> |Laboratory Report<br/>HL7 v2 ORU_R01| NHSA
    TIEB --> |Laboratory Report<br/>HL7 v2 ORU_R01| NHSB
    RIE --> |Document Notification<br/>HL7 MDM_T02<br/>IHE XDS/MHD| ICSA
    RIE --> ICSB
    RIE --> |Laboratory Report<br/>HL7 v2 ORU_R01<br/>IHE LTW LAB-3| APPB
    RIE --> APPA
```

#### RIE vs Trust Integration Engine

The primary distinction between a Regional Orchestration Engine and a Trust Integration Engine is scope:

- **Trust Integration Engines** focus on internal interoperability within a single organisation.
- The **Regional Orchestration Engine** operates at a regional level, providing centralised routing and orchestration across multiple organisations.

This hub-and-spoke model significantly reduces integration complexity, improves maintainability, and supports consistent data quality across the region.
The main distinction between a Regional Orchestration Engine (RIE) and a Trust Integration Engine is that the RIE functions as a central routing hub. Each participant connects only to the RIE rather than individually integrating with multiple other systems. This significantly reduces integration complexity. Trust TIEs will still be responsible for transforming messages between their internal EPR systems and the RIE.

#### Identifier and Codes (Terminology) Standardisation

Because the RIE operates at a regional level, certain HL7 v2 message components must be standardised or updated. These changes ensure global uniqueness for identifiers such as:

- Patient identifiers: NHS Number (England and Wales), CHI Number (Scotland), HSCN Number (Northern Ireland), and local NHS Trust medical record numbers
- Order identifiers: placer and filler order numbers
- Report identifiers
- Visit identifiers: spell or episode numbers
- Specimen identifiers: including accession and pathology specimen identifiers

Standard clinical terminologies are used to ensure semantic interoperability:

- SNOMED CT for clinical concepts
- LOINC (and SNOMED CT) for laboratory observations and orderable items

These requirements are outlined in the [Data Contract](data-intro.html). HL7 v2 message exchanges are aligned with HL7 v2.5.1 and the following IHE profiles (**API Contracts**):

- [IHE Laboratory Testing Workflow (LTW)](TLW.html) profile
- [IHE Inter Laboratory Workflow (ILW)](ILW.mw) profile (Future)
- [IHE Specimen Event Tracking (SET)](SET.html) profile (Future)

#### Practical Implementation

From a practical perspective, the RIE is introduced into the existing point-to-point messaging flow. It is at this boundary—between the TIE and the RIE—that the use of the [Data Contracts](data-intro.html)
, including HL7 v2.5.1 and adoption of IHE LTW, is mandated.

Data Contracts are not mandated between the RIE and LIMS, nor between the TIE and EPR. For practical reasons, these systems may require changes in the future to align with the central Data Contracts.

NHS Trust TIEs do not interface directly with the LIMS within NHS North West Genomics and, going forward, will not interface directly with LIMS from other regional genomic systems and NHS England Genomic Order Management Service. All such interactions will be managed by the RIE.

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 v2 ORM_O01/OML_O21| TIE
    subgraph DataContract[Data Contract]
        TIE["Trust Integration Engine (TIE)"]
        RIE["Regional Orchestration Engine (RIE)"]
    end 
    TIE --> |2. General Order<br/>HL7 v2.5.1 OML_O21| RIE
    RIE --> |3. General Order<br/>HL7 v2 ORM_O01/OML_O21| OrderFiller
    
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |4. Laboratory Report<br/>HL7 v2 ORU_R01| RIE
    RIE --> |5. Laboratory Report<br/>HL7 v2.5.1 ORU_R01| TIE 
    TIE --> |6. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer  
```

## Data and Document Sharing

### Regional Data and Document Sharing - Genomic Data Repository (GDR)

Traditional messaging focuses solely on communication between two systems—the order placer and the order filler—and does not support wider sharing of genomic data across multiple organisations such as NHS Trusts, GP practices, or other clinical teams.

To address this, a central Genomic Data Repository (GDR) will be established. This repository will provide a read-only [FHIR RESTful (read only API)](https://hl7.org/fhir/R4/http.html) and will be populated via data flows through the RIE (See [Health Information Exhange (HIE)](#health-information-exchange-hie)) and will focus primarily on sharing data produced by NHS North West Genomics.

```mermaid
graph TD
    subgraph DataContracts[Data Contract]
        CDR["<b>Data Source</b><br/>Genomic Data Repository (GDR)"]
        subgraph DocS[Document Sharing IHE MHD]
                NHSB[<b>Document Consumer</b><br/>NHS GP/Trust/Board/ICS B] 
          APPB[<b>Document Consumer</b><br/>Application 2]
        end
        subgraph DataS[Data Shareing IHE QEDm/IPA]
            NHSA[<b>Data Consumer</b><br/>NHS GP/Trust/Board/ICS A]
            APPA[<b>Data Consumer</b><br/>Application 1]
        end
    end
    subgraph DocN[Document Sharing IHE MHDS]
        NHSE[<b>Document Consumer</b><br/>National Record Locator<br/>Unified Genomic Record] 
    end 
    CDR --> |HL7 FHIR RESTful<br/>IHE QEDm| NHSA
    CDR --> |HL7 FHIR RESTful<br/>IHE MHD| NHSB
    CDR --> |HL7 FHIR RESTful<br/>IHE MHD| NHSE
    CDR --> |HL7 FHIR RESTful<br/>IHE QEDm|APPA
    CDR --> |HL7 FHIR RESTful<br/>IHE MHD| APPB
    
    classDef purple fill:#E1D5E7;
    class CDR,NHSA,NHSB,APPA,APPB,NHSE purple
```

The [Data Contract](datta-intro.html) and data structures used in the FHIR interfaces follow the same conventions as those used in the HL7 v2 message exchanges.

The CDR is expected to adopt emerging IHE Europe standards for clinical data and document sharing. These currently include (**API Contract**):

- [IHE Mobile access to Health Documents (MHD) ITI-66 and ITI-67](MHD.html) HL7 FHIR
- [IHE Query for Existing Data for Mobile (QEDm) PCC-44](QEDm.html) HL7 FHIR
- [IHE Patient Demographics Query for Mobile (PDQm) ITI-78](PDQm.html) HL7 FHIR
- [IHE Internet User Authorization (IUA)](IUA.md) OAuth2
- [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html) HL7 FHIR

## Conversational (Event) Based Workflow

### FHIR Workflow

The introduction of data and document sharing using HL7 FHIR RESTful APIs enables a transition from a traditional message-based workflow to an event-based workflow (see [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html)).

```mermaid
graph LR
    subgraph OrderPlacerM[Order Placer]
        OrderPlacer[<b>Order Placer</b><br/>EPR]

        DataO["<b>Data Source and Consumer</b>"]
    end 
    subgraph OrderFillerM[Order Filler]
        OrderFiller[<b>Order Filler</b><br/>LIMS] 
        DataF["<b>Data Source and Consumer</b>"]
       
    end 

    OrderPlacer--> |Event Notification - FHIR Task| OrderFiller
    OrderFiller --> |Event Notification - FHIR Task| OrderPlacer  

    DataO --> |HL7 FHIR RESTful<r/>IHE QEDm/MHD/PDQm| DataF
    DataF --> |HL7 FHIR RESTful<r/>IHE QEDm/MHD/PDQm| DataO
    
    classDef purple fill:#E1D5E7;
    class OrderPlacer,OrderFiller,DataO,DataF purple
```
In this model, orders and reports are no longer exchanged directly between the Order Placer and the Order Filler. Instead, both systems communicate through FHIR Tasks, using event notifications to coordinate activities and state changes.

This represents a shift from a message-oriented workflow (see [EIP Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/)) to a conversation-based workflow (see [EIP Conversation Patterns](https://www.enterpriseintegrationpatterns.com/patterns/conversation/index.html)). Rather than relying on single, transactional messages, the workflow is managed as an ongoing conversation between participants.

Although this approach involves multiple exchanges between the Order Placer and the Order Filler, it more accurately reflects real-world clinical workflows, where work progresses through a series of coordinated steps, acknowledgements, and state transitions rather than a single request–response interaction.

It is anticipated that event notifications will be implemented using [FHIR Subscriptions](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/), which support a publish–subscribe (pub/sub) pattern, or alternatively through the [NHS England Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service).

```mermaid

sequenceDiagram
    participant OrderPlacer As Order Placer
    participant DataO as Data Source <br/> Order Placer
    participant OrderFiller As Order Filler
    participant DataF as Data Source <br/> Order Filler

    OrderPlacer ->> DataO: Create Order
    OrderPlacer ->> OrderFiller: DiagnosticRequest - Event Notification (FHIR Task (requested))
    OrderFiller ->> DataO: Retrieve Laboratory Order (FHIR RESTful API Query) 
    alt is accepted
        OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (accepted))
        Note over OrderFiller: Starts Testing
         OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (in-progress))
        Note over OrderFiller: Interpretation of results and write Report
        OrderFiller ->> DataF: Creates Laboratory Order
        OrderFiller ->> OrderPlacer: Task DiagnosticRequest - Event Notification (FHIR Task (completed))
        OrderPlacer ->> DataF : Retrieve Laboratory Report (FHIR RESTful API Query)
    else is rejected 
        OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (rejected))
    end
```

This diagram illustrates an event-based, conversation-driven laboratory ordering workflow using HL7 FHIR Tasks.

The Order Placer creates a diagnostic order and notifies the Order Filler via a FHIR Task. The Order Filler retrieves the order using FHIR RESTful queries, accepts or rejects the request, and communicates status updates (accepted, in-progress, completed, or rejected) back to the Order Placer through task-based event notifications. Laboratory testing, result interpretation, and report creation occur asynchronously, with reports retrieved by the Order Placer via FHIR RESTful APIs upon task completion.

### Health Information Exchange (HIE)

A conversational (event-based) workflow, also referred to as a conversation-based workflow, represents a modern approach to clinical messaging. This paradigm assumes that both the Order Placer and the Order Filler can share data using HL7 FHIR RESTful APIs.

In practice, this capability may not always be available. For example, Laboratory Information Management Systems (LIMS) within NHS North West Genomics may not support FHIR RESTful APIs. In such cases, the Genomic Data Repository (GDR) is used to share genomic laboratory reports and other genomic data. Similarly, if Electronic Patient Record (EPR) systems do not support FHIR RESTful APIs, the GDR is used to facilitate the sharing of laboratory orders.

Together, the Regional Orchestration Engine (RIE) and the Genomic Data Repository (GDR) collectively constitute the Health Information Exchange (HIE).


<figure>
{%include overview-hie.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Health Information Exchange (HIE)</p>
</figure>
<br clear="all">
