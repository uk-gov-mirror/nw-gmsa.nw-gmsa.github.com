
## Actors and Transactions

| Actor                                             | Definition                                                                   |
|---------------------------------------------------|------------------------------------------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)  | Typically a clinician or system that initiates a lab test.                   |
| [Order Filler](ActorDefinition-OrderFiller.html)  | Laboratory or testing system that performs the test and produces the result. |
| Clinical Data Repository                          | Repository or system used for document exchange.                             |  
| [Intermediary](ActorDefinition-Intermediary.html) | E.g. Regional or Trust Integration Engine                                    |

### Process Flow

<img style="padding:3px;width:95%;" src="LTW Use Case 1 and 4.drawio.png" alt="Genomic LTW Business Process"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process</p> 
<br clear="all">

### Transaction & Archetype Maps

The different options include the use of the following archetypes. The differing formats are generally compatible with each other.

| FHIR Document                                                                | HL7 v2 Message                                                                                           | HL7 FHIR Message                                                                               | Data Semantic Standards                                            |
|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
|                                                                              | [OML_O21 Laboratory Order](hl7v2.html#oml_o21-laboratory-order)                                          | [Laboratory (Genomic) Order O21](MessageDefinition-laboratory-order.html)                      |                                                                             |
| [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) | [ORU_R01 Unsolicited Observation](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) | [Unsolicited Observation (Genomic Report) R01](MessageDefinition-unsolicited-observation.html) | [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/) |


## Options 

### Traditional Messaging Option

This option is the existing exchange of ORM_O01/OML_O21 Orders and ORU_R01 Reports, these messages are in either HL7 v2 Pipe+Hat or FHIR Message JSON formats, the messages follow the same semantic model.
This also follows IHE Laboratory and Testing Workflow (LTW)

<figure>
{%include LTW-now-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

- Complete Referral Form
  - The Order Placer completes an order form.
- Placer Order Management (LAB-1) Genomic Order O21 – Command Message
  - A Genomic Order O21 is sent from the Order Placer to the Order Filler.
  - Purpose: To initiate and communicate the genomic testing order.
- Perform Test
  - The Order Filler processes the order and performs the test.
- Order Results Management (LAB-3) Genomic Report R01 – Document Message
  - A document message (HL7 ORU_R01) is sent from the Order Filler back to the Order Placer.
    - This may include preliminary and partial reports before the final report.
  - Purpose: To report the results of the genomic test.

#### Pros/Cons


- Makes use of [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html) and so in secondary care has considerable middleware via Trust Integration Engines (TIE).
- Does not support referral triage processes or other workflow interactions.
- UK and England HL7 standards (including UKCore) do not cover this workflow, especially around the use of business identifiers.
- The order and report messages are semantically aligned and compatible (HL7 v2 and FHIR) with:
    - NHS England HL7 Message Specification
    - NHS England Data Model and Dictionary
    - Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide
- The message interactions will follow:  
  - LAB-1 and LAB-3 from [IHE Laboratory and Testing Workflow (LTW)](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
  - The FHIR Messages defined in this specification are not part of this standard (or another standard), but are following LAB-1 and LAB-3.
- Security—all interactions will use OAuth2 Authorisation (this includes HL7 over http) 
     
#### Notes 

- The NHS England Genomic Order Management Service - [Process genomic test request](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#post-/FHIR/R4) is effectively a HL7 Message same as the Genomic Order O21 Command Message. This does not support Genomic Report R01 Document Message  


### Traditional Messaging plus Enterprise Clinical Data Repository Option

Advanced, flexible, and interoperable genomic reporting workflow that combines traditional HL7 messaging with FHIR-based workflows and centralized data repositories, offering a future-ready health data exchange model.

<img style="padding:3px;width:60%;" src="breakthrough.png" alt="Modernisation"/>
<br clear="all">


This is an evolution of the previous option by adding in an **Enterprise Clinical Data Repository (CDR)** which allows Genomic Orders and Reports data to be shared across the region. 

<figure>
{%include LTW-cdr-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

1. Initial Order Message:
   - The Order Placer completes an order form.
   - Sends a Genomic Order O21 Command Message to RIE.
   - RIE forwards this command to both the CDR and Order Filler.
2. Optional FHIR Workflow (ALT Path):
  - FHIR Task with an `accepted` status is created from the Genominc Order O21 Message and is sent to the CDR.
  - This begins the FHIR-based workflow as an alternative to traditional HL7 messaging.
3. Test Execution:
   - The Order Filler performs the genomic test.
4. Preliminary/Partial Results Reporting:
   - The Genomic Report R01 Document Message is sent from the Order Filler to CDR, this is used to store new FHIR resource and updating existing ones such as the ServiceRequest to a `completed` status.
  - The FHIR Task is updated to with a `in-progress` status and is then sent to indicate completion of the task.
5. Result Reporting:
   - The Genomic Report R01 Document Message is sent from the Order Filler to CDR, this is used to store new FHIR resource and updating existing ones such as the ServiceRequest to a `completed` status.
   - The FHIR Task is updated to with a `completed` status and is then sent to indicate completion of the task.
5. Result Retrieval Options:
   - The Order Placer retrieves results via traditional HL7 v2 ORU_R01 Document Message.

#### Pro/Cons

- Hybrid Support: Works with both HL7 v2 and FHIR.
- Scalability: Central CDR enables easier data sharing across systems.
- Interoperability: Complies with widely accepted health IT standards.
- Flexibility: Supports event-driven or request-driven access to results.
- Initial support for [FHIR Worlflow](https://hl7.org/fhir/R4/workflow.html) which is central to the NHS England Genomic Order Management Service.
  - This is similar to [Workflow Management Opt H](https://hl7.org/fhir/R4/workflow-management.html#optionh)
  - This can be extended to include pub/sub using [FHIR Subscription](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html)
- Introduces Event-based [Conversation Patterns](https://www.enterpriseintegrationpatterns.com/patterns/conversation/index.html) as an alternative option to Command and Document [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html).

<img style="padding:3px;width:60%;" src="follow-up.png" alt="Follow Up"/>
<br clear="all">

- Detailed report will conform semantically with:
  - [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)
  - [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home)
- FHIR REST API will adhere to the following International Standards (this is roughly the same approach as Yorkshire and Humberside Care Record (YHCR)):
  - [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html)
  - [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) for PDF reports.
  - [IHE Internet User Access](https://profiles.ihe.net/ITI/IUA/index.html) (which includes OAuth2 Authorisation) for access control
    - This can be extended to include [SMART on FHIR](https://hl7.org/fhir/smart-app-launch/index.html)   

### FHIR Workflow plus Enterprise Clinical Data Repositories Option

A fully FHIR-based, repository-driven genomic workflow, enabling secure, scalable, and flexible collaboration between order placers and fillers through shared data access and event-driven communication.

Scope: This option is initially aimed at regional and national level workflows. I.e., the Order Placer (or Filler) can be NHS England Genomic Order Managment System or North West GMSA RIE+CDR. 

> This differs from the current proposal to send in **Genomic Test Requests** via messaging ([Process genomic test request](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#post-/FHIR/R4)), instead they would be shared from the enterprise CDR, and the request to `process genomic test request` would be [Create a new Task](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#post-/FHIR/R4/Task)


<figure>
{%include LTW-fhir-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

1. Initiation:
   - The Order Placer completes a referral form.
   - A Genomic Order is stored on the Order Placer’s Clinical Data Repository.
     - When the order is placed with the North West region, this will be a Genomic Order O21 Message, which the RIE sends to the Enterprise CDR.
   - A FHIR Task (requested) event message is also generated.
2. Order Acceptance & Retrieval:
   - The Order Filler Clinical Data Repository retrieves the order using Placer Order Management (LAB-1) Genomic Order O21 REST API.
   - A FHIR Task with a status of `accepted` event message is returned to the Order Placer confirming acceptance.
3. Test Execution:
   - The Order Filler performs the genomic test.
4. Results Submission:
   - The Order Filler creates the Genomic Report (which may have multiple versions e.g., partial, preliminary, and final)
   - The Genomic Report is stored on the Order Filler Clinical Data Repository.
     - When the order is stored within the North West region, this will be via a Genomic Report R01 Message, which the RIE sends to the Enterprise CDR.
   - The FHIR Task event message with a status of `completed` is sent back to the Order Placer.
5. Result Retrieval:
   - The Order Placer retrieves the genomic report FHIR REST API from the Order Filler’s Clinical Data Repository.
   - The RIE on reciept of a `completed` task will then convert the report to a Genomic Report R01 Message and send onto the original Order Placer.  

#### Pro/Cons

- Orders and results are shared via FHIR repositories and APIs rather than direct HL7 v2 messages.
- Provides an alternative to message-based workflow.
- Decouples systems – allowing asynchronous, federated access to shared data.
- Scalability & Interoperability: Built for modern health IT ecosystems.
- Flexibility: Systems can retrieve data when needed.
- FHIR-Centric: Enables real-time tracking and status updates via FHIR Task.
- Full adoption of [FHIR Workflow Management Communication Patterns](https://build.fhir.org/workflow-management.html)
- Uses international standards for Data/Document sharing and [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) via [Conversation Patterns](https://www.enterpriseintegrationpatterns.com/patterns/conversation/index.html), this combination removes Command and Document [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html)
  - This can be extended to include pub/sub using [FHIR Subscription](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html)  


### Federated Genomic Data Access and Health Information Exchange (HIE) Option

This approach enables real-time, federated access to patient data spread across multiple NHS organizations, without needing to centralize all data. It supports **clinical portals** that provide clinicians with a holistic view of patient information while respecting data sovereignty and system independence.
Notable examples of this pattern include:

- NHS Scotland South-East Region (XML/SOAP API)
- Yorkshire and Humberside Care Record (FHIR STU3 REST API + [Care Connect API](https://nhsconnect.github.io/CareConnectAPI/))

<img style="padding:3px;width:60%;" src="Health Information Exchange.drawio.png" alt="Follow Up"/>
<br clear="all">

These exchanges typically use an [Aggregator](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Aggregator.html) pattern, similar to the approach defined in [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html), which is implemented in London.

<figure>
{%include HIE-QEDm-Federated-Sequence.svg%}
</figure>
<br clear="all">

#### Key Components:

- Clinical Data Consumer
  - The system or application (e.g., a clinical portal) that initiates the query to retrieve patient data.
- Health Information Exchange - Regional Orchestration Engine (RIE)
  - Acts as the central orchestrator that receives the query and distributes it across multiple data sources.
- Clinical Data Sources
  - Examples shown:
    - NW GMSA (North West Genomic Medicine Service Alliance)
    - NHS England GOMS (Genomics Order Medical Services)
  - These are systems that store patient genomic records and respond to data queries.
  - Additional clinical data repositories can be integrated into the HIE. This includes systems from regional NHS Trusts that already support IHE QEDm-compatible FHIR REST APIs in their EPR platforms—such as Meditech, EPIC, and Oracle.

#### Sequence of Events (from top to bottom):

- Initial Query
  - The Clinical Data Consumer sends a FHIR REST API request using IHE Query Existing Data (QEDm) [PCC-44](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html) to the RIE.
- Federated Query Access Start
  - The RIE starts a federated query process.
  - It forwards the same IHE QEDm PCC-44 query to each connected clinical data source.
- Responses from Data Sources
  - Each clinical data source responds individually with relevant data.
- Aggregation
  - The RIE aggregates the responses from all sources into a unified result set.
- Final Response
  - The aggregated data is sent back to the Clinical Data Consumer as a single, combined response.


