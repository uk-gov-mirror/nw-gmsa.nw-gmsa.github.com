## Referenced Standards

- A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 2a (PaLM TF-2a) Transactions](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
- B. **Test Order Forms**
  - See [NW GMSA Genomics Test Order](Questionnaire-GenomicTestOrder.html) 
  - 
## Scope

This transaction is used by the Order Placer to place an Order Group (FHIR RequestGroup) (i.e., a set of Orders to be tested together for a patient) or a standalone Order to the Order Filler. The transaction enables both Order Placer and Order Filler to notify all subsequent changes of status and/or content of each Order to the other side.

[EIP - Command Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html)

## Actor Roles

<figure>
{%include LAB1-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Placer Order Management [LAB-1] Component Diagram</p>
</figure>
<br clear="all">

## Messages

The following messages are used to support creation and updating of the [Genomics Test Order](Questionnaire-GenomicTestOrder.html) [aggregation](https://martinfowler.com/bliki/AggregationAndComposition.html)/[archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) 

| Message                                                             | Purpose                                                                                                     | EIP Type                                                                                                |
|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| [Laboratory Order](#laboratory-order)               | Sending the initial `laboratory-order` request.                                                              | [Command Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html) |
| Laboratory Order Acknowledgement | Is used to update the `order-placer` of changes to `laboratory-order` such as an assigned `AccessionNumber` | [Event Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)     |                                                                                      |
| Laboratory Order Updates   | Is used to update master data in the `laboratory-order` such as changes to Patient and Pracitioner details. | [Event Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)     |

### Laboratory Order

<figure>
{%include LAB1-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Placer Order Management [LAB-1] Sequence Diagram</p>
</figure>
<br clear="all">

#### Complete Order Test Form

In many Order Placer applications (i.e. the EPR or Order Comms) the order is captured via a form.

#### Submit Test Order Form (Send HL7 FHIR Message Laboratory Order)

The  [laboratory order (O21)](MessageDefinition-laboratory-order.html) is sent to the RIA via the [$process-message](OperationDefinition-ProcessMessage.html) API

<div class="alert alert-info" role="alert">
<b>FHIR Message Definition:</b> <a href="MessageDefinition-laboratory-order.html" _target="_blank">Laboratory Order (O21)</a> 
</div>

<div class="alert alert-success" role="alert">
POST [base]/$process-message<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/fhir+json
</div>


Example payload [Bundle 'Message' - Genomics Order](Bundle-GenomicsOrderMessageAttachment.html) 


#### Send HL7 v2 Message and Response HL7 v2 Message

The RIE then sends the converted HL7 v2 Message to the Order Filler (LIMS) which responds back with a ORL_O22? message. Depending on the capabilty of the LIMS system this may include a ORC with an accession number (Filler Order Number) and a PID with updated/new identifiers, these can then be converted to a FHIR ServiceRequest and Patient respectively. 

#### Response HL7 FHIR Message

The response message contains a FHIR MessageHeader with a populated response element, the focus element is not populated.

##### Accepted

For sucessful messages the [MessageHeader](StructureDefinition-MessageHeader.html) will have `response.code` returned will be `ok` and will look like:

{% fragment MessageHeader/MessageHeaderGenomicOrderReplyOk JSON EXCEPT:response EXCEPT:identifier|code BASE:response %}

Where the identifier refers to the Bundle.identifier in the original message. The Bundle may also include modified FHIR Patient or ServiceRequest resources with updated and new identifiers.

> Example payload [Bundle 'Message' - Genomics Order Reply](Bundle-GenomicsOrderMessageReplyOk.json.html)

##### Error/Reject

When the RIE is unable to accept the message due to issues such as FHIR Validation issues, the returned [MessageHeader](StructureDefinition-MessageHeader.html) will have `response.code` returned will be `error`, e.g.:

{% fragment MessageHeader/MessageHeaderGenomicOrderReplyFatal JSON EXCEPT:response EXCEPT:identifier|code|details BASE:response %}

where the details section contains a reference to an included OperationOutcome listing details of the failure.

##### Transient Response

When FHIR Validation is active on the RIE, the response will be delayed due to the time taken to validate the message. The immediate response will contain a [MessageHeader](StructureDefinition-MessageHeader.html) with a `response.code` of `transient-error`, e.g.: 

{% fragment MessageHeader/MessageHeaderGenomicOrderReplyTransient JSON EXCEPT:response EXCEPT:identifier|code|details BASE:response %}

The next section details how to retrieve the response.

### Asynchronous Message Response

This follows HL7 FHIR [Asynchronous Messaging using the RESTful API](https://hl7.org/fhir/R4/messaging.html#rest)

The Order Placer (or TIE) FHIR RESTful query to retrieve their response messages.

<div class="alert alert-success" role="alert">
GET [base]/Bundle?message.receiver:identifier=[odsCode]&_lastUpdated=[date]<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/fhir+json
</div>

> Example returned search results [Bundle 'SearchSet' - Genomics Order](Bundle-GenomicsOrderSearchSet.html)

Initially, only queries by ODS Code will be supported to support TIE to TIE exchanges.

### Acknowledge Asynchronous HL7 FHIR Messages

Messages that have been accepted by the calling Order Place (or TIE) need to be acknowledged and removed from the MessageQueue. This is achieved by sending back the messages with the sender and destination fields reversed, i.e.

##### Orignial Message Header

{% fragment MessageHeader/MessageHeaderGenomicOrderReplyFatal JSON EXCEPT:response|sender|destination %}

##### Message Header for returned update

{% fragment MessageHeader/MessageHeaderGenomicOrderReplyFatal JSON JSON EXCEPT:response|sender|destination %}

This update is sent back to the RIE as a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction)

<div class="alert alert-success" role="alert">
POST [base]/<br/>
Authorization: Basic {accessToken}<br/>
Content-Type: application/fhir+json
</div>

{% fragment Bundle/TransactionGenomicsOrderReplyAck JSON %}

### Validate Message

<div class="alert alert-success" role="alert">
POST [base]/$validate<br/>
Content-Type: application/fhir+json
</div>

The incoming order is checked for validity, this may include [FHIR Validation](https://hl7.org/fhir/R4/validation.html) against this Implementation Guide. If the message is accepted it is then transformed to a HL7 v2 Message, else a [Response HL7 FHIR Message](#response-hl7-fhir-message) is returned listing the issues in a [FHIR OperationOutcome](StructureDefinition-OperationOutcome.html) resource.

### Transform FHIR to HL7 v2 Message

> **NOT FOR OPERATIONAL USE**

<div class="alert alert-success" role="alert">
POST [base]:9981/$transformToFHIR<br/>
Content-Type: application/hl7-v2+er7
</div>

### Transform HL7 v2 FHIR Message

> **NOT FOR OPERATIONAL USE**

<div class="alert alert-success" role="alert">
POST [base]:9981/$transformToV2<br/>
Content-Type: application/fhir+json
</div>
