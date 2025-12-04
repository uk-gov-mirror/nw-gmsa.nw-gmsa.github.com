### Greater Manchester 

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
        GLHS["Laboratory Information Management System Shire (Shire CFT))"]
        GLHS --> |4c. Laboratory Report ORU_R01| RIE 
        GLHI["Laboratory Information Management System Shire (iGene MFT))"]
        GLHI --> |4c. Laboratory Report ORU_R01| RIE 
        
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

### Cheshire and Mersey

For elaboration purposes only. This is a more detailed breakdown the the Genomic Tests.

<img style="padding:3px;width:60%;" src="HODS-MerseyAndCheshire.png" alt="HODS Genomic Tests - Mersey and Cheshire GLH"/>
<br clear="all">
<p class="figureTitle">HODS Genomic Tests - Mersey and Cheshire GLH</p> 
<br clear="all">

