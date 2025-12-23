## Introduction

This guide is to support Genomic Testing Workflow at a regional level and is designed to be compatible with:

- [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home) which defines the conformance requirements for Genomics in England
- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) a [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) based service for managing orders and results at a national level.

The general workflow is based on IHE LTW profiles and HL7 v2 OML and ORU.

### Clinical Process

Genomic Testing Workflow is part of Diagnostic Testing, which is also part of the general clinical process.

```mermaid
graph TD;

    A[Assessment]-->|Creates Observations| B;
    A--> |Needs Diagnostic Testing and Completes| T;
    B[Diagnosis]-->|Creates Condition| C;
    T[<b>Order Placer</b><br/>Genomics Test Order]--> |"Sends Laboratory Order - LAB-1<br/>FHIR Message O21"| AN;
    T --> |Asks for| S
    S[Specimen Collection] --> |Sends Specimen| AN;
    AN["<b>Order Filler</b><br/>Diagnostic Testing"] --> |"Requests further tests <br/>(reflex order)"| T;
    AN --> |"Creates Laboratory Report - LAB-3<br/>HL7 v2 ORU_R01"| B;
    AN --> |Sends Laboratory Report| A;
    C[Plan]-->|Creates Goals and Tasks| D;
    D[Implement/Interventions]-->|Actions Tasks| E;
    E[Evaluate]--> |Reviews Care| A;
    
    click T Questionnaire-GenomicTestOrder.html
    click AN Questionnaire-GenomicTestReport.html
    click S ExampleScenario-BiopsyProcedure.html

    classDef purple fill:#E1D5E7;

    classDef yellow fill:#FFF2CC;
    classDef pink fill:#F8CECC
    classDef green fill:#D5E8D4;
    classDef blue fill:#DAE8FC;
    classDef orange fill:#FFE6CC;

    class A pink
    class B yellow
    class C green
    class D blue
    class E orange

    class O,S,T,AN purple
```


Genomic diagnostic testing follows the same standardized process defined by the [IHE Laboratory Testing Workflow](https://wiki.ihe.net/index.php/Laboratory_Testing_Workflow) used in traditional laboratory testing.
This workflow has been enhanced to support the sharing of laboratory reports (documents) through Integrated Care Systems (ICS). In addition, a new mechanism for sharing laboratory reports has been introduced to establish a regional genomic data repository.

## Laboratory Workflow (LTW)

### Test Order

```mermaid
graph TD;

    Practitioner[fas:fa-user-md Practitioner] --> |1. Selects Order Form| FormManager
    FormManager --> OrderEntry
    Practitioner --> |3. Completes| OrderEntry[Order Form]
    EPR[fas:fa-database Electronic Patient Record] --> |2. Pre Populates with existing data| OrderEntry 
    OrderEntry --> |4. Submits Order| EPR
    EPR --> |5. Sends Laboratory Order| DiagnosticTesting[fas:fa-stethoscope Diagnostic Testing]
```

For more details see:

- [Send Laboratory Order (IHE LTW)](LTW.html) NHS Trust
- [Read & Search Laboratory Order (HIE)](HIE.html)

### Diagnostic Testing

```mermaid
graph TD;

    DiagnosticTesting[fas:fa-stethoscope Diagnostic Testing]  --> |Creates| DiagnosticReport[Diagnostic Report]
    DiagnosticReport --> |Reads Variant and DiagnosticImplication| Consultant[fas:fa-user-md Consultant]
    DiagnosticReport --> |Reads Variant and DiagnosticImplication| GP[fas:fa-user-md GP]
    EPR --> |GC1. Reads Variant and DiagnosticImplication| GeneticCounseling[fas:fa-user-md Genetic Counseling]
    DiagnosticReport --> |Reads Genomic Study and Variant| Oncologist[fas:fa-user-md Oncologist]
    DiagnosticReport --> |Is Persisted| GenomicCDR[fas:fa-database  Genomic Clinical Data Repository]
    DiagnosticReport --> |"Reads DiagnosticImplication (Condition) and Variant (Gene)"| Patient[fas:fa-user Patient]

    Consultant --> |"Records Condition (from Diagnostic Implication)"| EPR[fas:fa-database Electronic Patient Record]
    GP--> |"Records Condition (Genomic Disorder) <br/>or Observation (Genomic Disorder Carrier) <br/>based on Diagnostic Implication"| GPEPR[fas:fa-database GP Electronic Patient Record]
    
    GeneticCounseling --> |GC2. Obtains Family Structure and History| Patient
    GeneticCounseling --> |GC3. Records FamilyMemberHistory| EPR
    Consultant --> |Asks for Genetic Counseling on Genetic Condition?| GeneticCounseling
```

A detailed example of this process can be found in the [Example Scenario - Clinical and Genomic Workflow](ExampleScenario-ClinicalAndGenomicWorkflow.html).

For more details see:

- [Send Laboratory Report Data (IHE LTW)](LTW.html) - NHS Trust
- [Send Laboratory Report Document (HIE)](HIE.html#publish-a-document) - ICS/ICB
- [Read & Search Laboratory Report Data (HIE)](HIE.html)
- [Read & Seerch Laboratory Report Documents (HIE)](HIE.html)

## Inter Laboratary Workflow (ILW)

For illustration purposes only, see [Inter Laboratory Workflow](ILW.html)

## Specimen Event Tracking (SET)

For illustration purposes only, see [Specimen Event Tracking](SET.html)

## Data Modelling

The data model used in this guide is a combination of data and workflow requirements from a variety of other guides.

<img style="padding:3px;width:70%;" src="GenomicsIG.drawio.png" alt="North West GMSA IG"/>
<br clear="all">
<p class="figureTitle">North West GMSA IG</p> 
<br clear="all">

## Testing

This implementation guide will also enable use of FHIR Testing tools such as [Command Line FHIR Validation](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) and [Online FHIR Validation](https://validator.fhir.org/)
