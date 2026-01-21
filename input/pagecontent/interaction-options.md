## IHE LTW & HL7 v2 Message

Most common method

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 v2 ORM_O01| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |2. Laboratory Report<br/>HL7 v2 ORU_R01| OrderPlacer  
```

## HL7 FHIR Message

FHIR version of the HL7 v2 Message

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |1. General Order<br/>HL7 FHIR Message O21| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |2. Laboratory Report<br/>HL7 FHIR Message R01| OrderPlacer  
```

## HL7 FHIR RESTful Transaction and POST/PUT

Similar to the previous options but without the definition of payloads.

```mermaid
graph LR
    OrderPlacer[<b>Order Placer</b><br/>EPR] --> |HL7 FHIR RESTful transaction and POST/PUT| OrderFiller
    OrderFiller[<b>Order Filler</b><br/>LIMS] --> |HL7 FHIR RESTful transaction and POST/PUT| OrderPlacer  
```

## HL7 FHIR Workflow

Is a modernisation of all the previous methods, it requires both the Order Placer and Order Filler to have a FHIR Repository. Example EPR systems include EPIC and Meditech, example LIMS include NW Genomics Data Repository and Magentus.

```mermaid
sequenceDiagram
    participant OrderPlacer As Order Placer
    participant OrderFiller As Order Filler

    OrderPlacer ->> OrderPlacer: Create OrderPlacer
    OrderPlacer ->> OrderFiller: DiagnosticRequest - Event Notification (FHIR Task (requested))
    OrderFiller ->> OrderPlacer: Retrieve Laboratory Order (FHIR RESTful API Query) 
    alt is accepted
        OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (accepted))
        Note over OrderFiller: Starts Testing
         OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (in-progress))
        Note over OrderFiller: Interpretation of reusults and writes Interprettation/Report
        OrderFiller ->> OrderPlacer: Task DiagnosticRequest - Event Notification (FHIR Task (completed))
        OrderPlacer ->> OrderFiller: Retrieve Laboratory Report (FHIR RESTful API Query)
    else is rejected 
        OrderFiller ->> OrderPlacer: Task Diagnostic Request - Event Notification (FHIR Task (rejected))
    end
```

