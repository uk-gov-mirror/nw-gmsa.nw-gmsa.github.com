<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Referenced Standards

- A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 2a (PaLM TF-2a) Transactions](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
- B. [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)

## Scope

It transmits the observation results from the Order Filler to the Order Result Tracker, when a result is acquired, clinically validated, modified, or deleted at the Order Filler level. 

[EIP - Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html)

## Actor Roles

<figure>
{%include LAB3-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Order Results management [LAB-3] Component Diagram</p>
</figure>
<br clear="all">

## Options


<img style="padding:3px;width:70%;" src="Modernisation IHE LTW LAB-3.drawio.png" alt="IHE LTW LAB-3 Options"/>
<br clear="all">
<p class="figureTitle">IHE LTW LAB-3 Modernisation Options</p> 
<br clear="all">

### Traditional Workflow

<img style="padding:3px;width:50%;" src="IHEPhaseSend.drawio.png" alt="Traditional Workflow"/>
<br clear="all">
<p class="figureTitle">Traditional Workflow</p> 
<br clear="all">

This is the most widely used method for exchanging laboratory reports and is based on the [HL7 v2 ORU_R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) message. Currently, many NHS trusts and laboratories use custom implementations of this standard, which are adapted via Trust Integration Engines (TIE). To reduce integration costs and enhance regional interoperability, we propose developing a regional standard for ORU_R01. This will build upon the  [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf) (as NHS England has not issued equivalent guidance) and incorporate elements from:

- The Royal College of Radiologists – [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf) for ORC+OBR/FHIR DiagnosticReport
- [IHE Europe Document Metadata](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf) for OBX (value type = ED)/FHIR DocumentReference metadata
- [Digital Health and Care Scotland - (EH4001) CLINICAL DOCUMENT INDEXING STANDARDS ](https://www.digihealthcare.scot/app/uploads/2024/05/CDI-Standard-V4.5-FINAL.pdf) for OBX (value type = ED)/FHIR DocumentReference metadata

Reports will be shared in PDF format, potentially limited to regionally placed orders (supported by complementary integration methods).

> The regional ORU_R01 design is not specific to genomics and can be reused across the six regional diagnostic networks (including imaging and pathology).

<figure>
{%include LTW-option-traditional-workflow.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW Traditional Workflow Option</p>
</figure>
<br clear="all">

#### Workflow Steps

- Order Placement
  - The Order Placer sends a Laboratory Order O21 (IHE LTW LAB-1) to the Order Filler.
- Test Execution
  - The Order Filler performs the laboratory test (internal step).
- Optional Preliminary Report
  - The Order Filler may send a Laboratory Report (preliminary) R01 (IHE LTW LAB-3) back to the Order Placer.
  - This is marked as optional (opt) in the diagram.
- Final Report
  - The Order Filler sends the Laboratory Report (final) R01 (IHE LTW LAB-3) to the Order Placer.

#### Message (Traditional Workflow)

The following messages are used to support creation and updating of the [Genomics Test Report](StructureDefinition-Composition-GenomicReport.html) [composition](https://martinfowler.com/bliki/AggregationAndComposition.html)

| Message                                   | Purpose                                       | EIP Type                                                                                                 |
|-------------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------|
| [Laboratory Results](#laboratory-results) | The results for a `laboratory-order` request. | [Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) |


##### Laboratory Results

<div class="alert alert-info" role="alert">
<b>FHIR Message Definition:</b> <a href="MessageDefinition-unsolicited-observation.html" _target="_blank">Unsolicited Observations (R01)</a> 
</div>

<figure>
{%include LAB3-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Order Results management [LAB-3] Sequence Diagram</p>
</figure>
<br clear="all">


### Regional Genomic Data Sharing

<img style="padding:3px;width:50%;" src="IHEPhaseShare.drawio.png" alt="Regional Genomic Data Sharing"/>
<br clear="all">
<p class="figureTitle">Regional Genomic Data Sharing</p> 
<br clear="all">

One major limitation of the `traditional workflow` is that reports are only accessible within systems that received them via HL7 v2 ORU_R01. This phase introduces a regional Clinical Data Repository (CDR) for genomics, accessible to all care providers in the region.

The CDR will be built using the InterSystems FHIR Repository and follow FHIR RESTful/IHE QEDm (PCC-44) standards. In future phases, it will connect to the national Genomics CDR through a Health Information Exchange (HIE) integration pattern.

Initially, the CDR will be populated by converting HL7 v2 ORU_R01 (and OML_O21) messages into HL7 FHIR, with additional data sources providing structured genomic reports based on the Genomics Reporting Implementation Guide. This will also serve as a useful resource for HL7 v2 developers, offering insights into converting v2 messages into FHIR.

<figure>
{%include LTW-option-shared-repository.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Shared Patient Genomic Record Option</p>
</figure>
<br clear="all">

#### Flow Description

#####  Methods of populating the Clinical Data Repository

- Laboratory Order Submission
  - The Order Placer sends a copy of the laboratory order (O21) to the Clinical Data Repository.
  - This follows the IHE LTW LAB-1 profile.
- Laboratory Test Execution
  - The Order Filler performs the test (internal action).
- Preliminary Laboratory Report (Optional)
  - A preliminary lab report (R01) may be sent to the Clinical Data Repository.
  - This uses IHE LTW LAB-3.
- Final Laboratory Report
  - A final lab report (R01) is sent to the Clinical Data Repository.
  - This also uses IHE LTW LAB-3.

##### Using the Clinical Data Repository

- Querying Genomic Data
  - The Practitioner queries the Shared Patient Genomic Repository using IHE QEDm PCC-44.
- Results Returned
  - The Clinical Data Repository sends back the results to the Practitioner.

### Order Fulfillment Tasking

This introduces an alternative way of requesting a laboratory order which is based on [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html)

<figure>
{%include LTW-option-fhir-workflow.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Order Fulfillment Tasking</p>
</figure>
<br clear="all">

In this workflow, both the order and report are shared instead of being sent. The communication between the Order Placer and Filler changes to a [conversation](https://www.enterpriseintegrationpatterns.com/patterns/conversation/toc.html) rather than messaging pattern around the Fulfillment Task.

### Flow Description:

- Order Creation
  - The Order Placer creates an order (e.g., a laboratory test order).
- Order Fulfillment Task (requested)
  - The Order Placer sends an Order Fulfillment Task request to the Order Filler.
- Query Repository for Order Details (IHE QEDm PCC-44)
  - The Order Filler queries a repository to retrieve the detailed order information, using the IHE QEDm PCC-44 profile.
- Order Fulfillment Task (accepted)
  - The Order Filler accepts the order and confirms receipt.
  - At this stage, the laboratory or service acknowledges that it will perform the requested task.
- Order Fulfillment Task (in-progress)
  - The Order Filler begins processing the order.
  - Internally, this corresponds to starting testing.
- Testing Completion & Report Generation
  - Once the testing is finished, the Order Filler writes the report.
  - The Order Fulfillment Task is marked as completed.
- Query Repository for Laboratory Report (IHE QEDm PCC-44)
  - The Order Placer queries the repository to retrieve the laboratory report produced by the Order Filler.


This modernisation is central to the [NHS England Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) and the North West Regional Integration will provide the adapter from `tradtional workflow` to `FHIR workflow`

<figure>
{%include LTW-option-GOMS-workflow.svg%}
<p id="fX.X.X.X-X" class="figureTitle">RIE and GOMS Workflow</p>
</figure>
<br clear="all">

#### Workflow Steps

- Order Creation
  - The NHS Trust system creates a laboratory order (Order O21, IHE LTW LAB-1).
  - This order is sent to the Regional Orchestration Engine.
- Order Fulfillment Request
  - The RIE sends an Order Fulfillment Task (requested) to the Order Filler.
- Order Details Query
  - The Order Filler queries the repository for laboratory order details (IHE QEDm PCC-44).
- Order Acceptance
  - The Order Filler accepts the order fulfillment task and sends acknowledgment back to the RIE.
- Order Processing (Testing Phase)
  - The Order Filler begins testing (internally marked as “Start testing”).
  - It updates the RIE with Order Fulfillment Task (in-progress).
- Order Completion
  - After completing tests and writing the report (internally marked “Finish testing and Write Report”),
  - The Order Filler sends Order Fulfillment Task (completed) back to the RIE.
- Report Query and Distribution
  - The RIE queries the repository for the laboratory report (IHE QEDm PCC-44).
  - The final Laboratory Report (R01, IHE LTW LAB-3) is sent to the NHS Trust system.

#### Key Notes

- Traditional HL7 v2/IHE LTW messages (O21, R01, LAB-1, LAB-3) are used alongside FHIR task-based workflow messages (requested, accepted, in-progress, completed).
- The RIE acts as a bridge, integrating traditional order management with modern FHIR-based fulfillment.
- The Order Filler (GOMS) is also a bridge linking to other Order Fillers which perform the actual testing and provides results back through this combined workflow.


### Communication Task, Subscription, and Event Notifications

This phase introduces real-time notification support, similar to online order tracking where updates are sent via email or SMS.

The notification system will be based on the [Subscriptions R5 Backport](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html) and initially support:

- Email
- FHIR Messaging – using FHIR Task-based event notifications

Future expansions will include notifications from the national [Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) via its FHIR API.

<figure>
{%include LTW-option-pubsub.svg%}
<p id="fX.X.X.X-X" class="figureTitle">FHIR Subscription</p>
</figure>
<br clear="all">

####  Flow Description:

- Subscription (FHIR Subscription)
  - The Practitioner sends a subscription request (e.g., to an Order, Report, or other clinical resource) to the Regional Orchestration Engine.
  - This is based on the FHIR Subscription standard.
- Communication Request
  - Alternatively, the Practitioner may send a CommunicationRequest Task to the Integration Engine.
  - The Integration Engine converts this task into a Subscription, ensuring the Practitioner will receive updates when relevant events occur.
- Event Notification (when event occurs)
  - Once the subscribed event occurs (e.g., new lab report, status update, or order completion), the Regional Orchestration Engine sends an Event Notification back to the Practitioner.
  - This closes the loop, ensuring the Practitioner is informed in real time.

