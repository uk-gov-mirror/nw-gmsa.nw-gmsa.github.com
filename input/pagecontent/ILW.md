<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

1. [IHE Inter Laboratory Workflow](https://wiki.ihe.net/index.php/Inter_Laboratory_Workflow)
2. [IHE Laboratory Technical Framework Supplement Inter-Laboratory Workflow (ILW)](https://www.ihe.net/uploadedFiles/Documents/Laboratory/IHE_LAB_Suppl_ILW.pdf)

## Actors and Transactions

## Overview

See Ref 1 for details.

<img style="padding:3px;width:80%;" src="Ihe_lab_ilw_proc.jpg" alt="IHE ILW Summary"/>
<br clear="all">
<p class="figureTitle">IHE ILW Summary</p> 
<br clear="all">

### Modernisation

The current IHE ILW specification relies on HL7 v2.x, HL7 v3, and IHE XDS. Several modernization paths are available, most of which focus on adopting FHIR, updating relevant IHE profiles, and shifting from Clinical Documents (HL7 CDA and FHIR Documents) to IHE QEDm for data exchange.

<img style="padding:3px;width:80%;" src="ILW and FHIR.drawio.png" alt="IHE ILW Modernistion with FHIR"/>
<br clear="all">
<p class="figureTitle">IHE ILW Modernistion with FHIR</p> 
<br clear="all">

## Scenarios

### NHS England Genomic Order Management Service FHIR API

- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) a [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) based service for managing orders and results at a national level.

### NHS North West Childrens Cancer 

See [Blood Tests](SET.html#blood-sample-collection) which includes inter-organisation workflows around laboratory testing. 
