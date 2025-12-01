### Current 

After move of HODS from The Christie to Manchester Foundation Trust.

```mermaid
graph LR
    NHSTrust --> |"1. (Manual) Laboratory Order Entry"| HODS
    HODS --> |"2. (Manual) Laboratory Order + Specimen"| MFTReception{MFT Speciment Reception}
    MFTReception --> |"3a. (Manual) Immunology Laboratory Order + Specimen"| LIMS["Laboratory Information Management System (LIMS)"]
   
    LIMS --> |3b. Laboratory Report ORU_R01| TIE[MFT Trust Integration Engine]
    TIE --> |3c. Laboratory Report ORU_R01| HODS
    MFTReception --> |"4a. (Manual) Genomics Laboratory Order + Specimen"| GLH["Genomic Laboratory Hub (MFT/CFT)"]
    GLH --> |4b. Laboratory Report ORU_R01| RIE 
    RIE["Genomics Regional Integration Engine"] --> |4c. Laboratory Report ORU_R01| HODS
    HODS --> |5. Write Consolidated Report| HODS
    HODS --> |"6. (Email) Consolidated Laboratory Report"| NHSTrust
```

- Trusts will place their orders directly in HODS (1). HODS prints a request form, this is sent with the samples to Central specimen reception at MFT (2a).
- Specimen reception then route the samples to the appropriate labs for testing, e.g. Genomics (4a), Immunology (3a), Christie via transport, etc.
- The orders are manually booked into LIMS (Beaker (3a), iGene, Shire (4a), etc).
- Results are sent electronically from LIMS (3b and 4b) to HODS (with exception of iGene PDFs, these are manually uploaded)
- Reporting consultant writes the final combined report within HODS itself when all results are in (5)
- When report is marked Closed , requesting clinicians are alerted by email (6) to log into HODS and view/export the PDF of the final report

### Future

For elaboration purposes only. This is a more detailed breakdown the the Genomic Tests.

<img style="padding:3px;width:60%;" src="HODS-MerseyAndCheshire.png" alt="HODS Genomic Tests - Mersey and Cheshire GLH"/>
<br clear="all">
<p class="figureTitle">HODS Genomic Tests - Mersey and Cheshire GLH</p> 
<br clear="all">

