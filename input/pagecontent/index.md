
## Introduction

This guide is to support Genomic Testing Workflow at a regional level and is designed to be compatible with:

- [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home) which defines the conformance requirements for Genomics in England
- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) a [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) based service for managing orders and results at a national level.

The general workflow is based on IHE LTW profiles and HL7 v2 OML and ORU

<img style="padding:3px;width:70%;" src="Standardising Health.drawio.png" alt="Process Orientated Interoperability"/>
<br clear="all">
<p class="figureTitle">Process Orientated Interoperability</p> 
<br clear="all">

<table >
  <thead>
    <tr>
      <th></th>
      <th>Menu Item</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="background-color: #E1D5E7">&nbsp;&nbsp;</td>
      <td>Analysis and Design (Volume 1)</td>
      <td>Description of the processes and corresponding technical frameworks</td>
    </tr>
    <tr>
      <td style="background-color: #F8CECC">&nbsp;&nbsp;</td>
      <td>Interfaces (Volume 2)</td>
      <td>Description of the processes and corresponding technical frameworks (HL7 v2 and FHIR Interactions)</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Domain Archetype (Volume 3)</td>
      <td>NHS North West Forms, Templates, Reports and Compositions</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Artefacts (Volume 4)</td>
      <td>NHS North West Common Data Models</td>
    </tr>
  </tbody>
</table>


This Implementation Guide is implemented in the Regional Integration Engine (RIE)

<figure>
{%include RIE-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Integration Engine Scope</p>
</figure>
<br clear="all">

This guide follows [IHE Laboratory Testing Workflow](https://wiki.ihe.net/index.php/Laboratory_Testing_Workflow), which describes how to use HL7 v2 orders and reports at an enterprise level. It will contain several modifications in order to support HL7 [FHIR Messasging](https://hl7.org/fhir/R4/messaging.html), these messages will be closely related to HL7 v2 Messages to help with adoption.
For documentation purposes, HL7 v2 version used will be 2.5.1 (this also matches NHS England FHIR Genomics, HL7 International v2 standards around structured Genomic reporting and Digital Health and Care Wales standards around ORU_R01)

It also brings in both data and workflow requirements from a variety of other guides.

<img style="padding:3px;width:70%;" src="GenomicsIG.drawio.png" alt="North West GMSA IG"/>
<br clear="all">
<p class="figureTitle">North West GMSA IG</p> 
<br clear="all">

### GLH Regional Integration Engine (GLH RIE)

This implementation guide will be supported by a **Genomics Regional Integration Engine (RIE)** which will:

- [Message Routing](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRouter.html) to deliver orders and reports to the regional GLH (and in the future national GLH's).
- [Message Translation](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) to 
  - LAB-1 converts HL7 FHIR based orders to HL7 v2 Messages (for Order Placer (local GLH))
  - LAB-3 converts HL7 v2 based results (from Order Placer (local GLH)) to HL7 FHIR Messages
- [Message Bridge](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessagingBridge.html) between regional Trust Integration Engines (TIE)/GLH Laboratory Information System (LIMS) and the national Genomic Order Management Service (LAB-4 and LAB-5)
- May contain a Structured Reporting [Message Translation](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) to convert HL7 v2 ORU_R01 structured reports to a [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) to replace the use of PDF reports.

### Testing 

This implementation guide will also enable use of FHIR Testing tools such as [Command Line FHIR Validation](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) and [Online FHIR Validation](https://validator.fhir.org/)


## SNOMED CT

UK edition of SNOMED (83821000000107)

## Dependencies

{% include dependency-table.xhtml %}

## Credits

| Role(s)              | Contributor(s)                               | 
|----------------------|----------------------------------------------|
|                      | North West Genomic Medicine Service Alliance |
|                      | Alder Hey Children's Hospital Trust          |
|                      | Manchester University NHS Foundation Trust   |
|                      | Liverpool Womens NHS Foundation Trust        |
|                      | The Christie NHS Foundation Trust            |
|                      | NHS England                                  |
| Enterprise Architect | **Kevin Mayfield** (Aire Logic/Mayfield IS)  |      

