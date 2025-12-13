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

### Haematological Malignancy Diagnostic Services

#### Greater Manchester

After move of HODS from The Christie to Manchester Foundation Trust.

```mermaid
graph TD
    NHSTrust --> |"1. (Manual) Laboratory Order Entry"| HODS
    HODS --> |"2. (Manual) Laboratory Order + Specimen"| MFTReception{Specimen Reception}
    MFTReception --> |"3a. (Manual) Immunology Laboratory Order + Specimen"| LIMS["Laboratory Information Management System (LIMS)"]
   
    subgraph Laboratory[Greater Manchester Laboratory]
    
        LIMS --> |3b. Laboratory Report ORU_R01| TIE[MFT/CFT Trust Integration Engine]
        
    end 
    TIE --> |3c. Laboratory Report ORU_R01| HODS
    MFTReception --> |"4a. (Manual) Genomics Laboratory Order + Specimen"| TestType
    subgraph NWGenomics[North West Genomics]
        TestType{Test Type} --> |4b. Tests A, B, C, etc| GLHS
        TestType{Test Type} --> |4b. Tests A, B, C, etc| GLHI
        GLHS["Laboratory Information Management System<br/><br/>Shire"]
        GLHS --> |4c. Laboratory Report ORU_R01| RIE 
        GLHI["Laboratory Information Management System<br/><br/>iGene)"]
        GLHI --> |4c. Laboratory Report Currently manually uploaded, ideally ORU_R01| RIE 
        
    end
    RIE["Genomics Regional Integration Engine"] --> |4d. Laboratory Report ORU_R01| HODS
    HODS --> |5. Write Consolidated Report| HODS
    HODS --> |"6. (Email) Consolidated Laboratory Report"| NHSTrust
```

- Trusts will place their orders directly in HODS (1). HODS prints a request form, this is sent with the samples to Central specimen reception at MFT (2a).
- Specimen reception then route the samples to the appropriate labs for testing, e.g. Genomics (4a), Immunology (3a), Christie via transport, etc.
- The orders are manually booked into LIMS (Beaker (3a), iGene (4a + 4b), Shire (4a + 4b), etc). Which Genomic LIMS is used is determined by Genomic Test Type.
- Results are sent electronically from LIMS (3b and 4c) to HODS (with exception of iGene PDFs, these are manually uploaded)
- Reporting consultant writes the final combined report within HODS itself when all results are in (5)
- When report is marked Closed , requesting clinicians are alerted by email (6) to log into HODS and view/export the PDF of the final report

#### Cheshire and Mersey

For elaboration purposes only. This is a more detailed breakdown the the Genomic Tests.

<img style="padding:3px;width:60%;" src="HODS-MerseyAndCheshire.png" alt="HODS Genomic Tests - Mersey and Cheshire GLH"/>
<br clear="all">
<p class="figureTitle">HODS Genomic Tests - Mersey and Cheshire GLH</p> 
<br clear="all">

### NHS England Genomic Order Management Service FHIR API

- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) a [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) based service for managing orders and results at a national level.

### NHS North West Childrens Cancer 

See [Blood Tests](SET.html#blood-sample-collection) which includes inter-organisation workflows around laboratory testing. 
