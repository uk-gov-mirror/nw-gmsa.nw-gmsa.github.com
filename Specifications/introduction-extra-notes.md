
### Chimerism

The chimerism testing pathway within the NHS is used to monitor the success of a haematopoietic stem cell transplant (HSCT) and involves a specific process of sample collection, transport, and analysis guided by clinical consensus guidelines. The testing is requested by a patient's clinical team, not directly by the patient.

```mermaid
 graph TD;
    subgraph NHSTrust[NHS Trust]
        Practitioner[Consultant Haematologist<br/>Practitioner] --> |1. Creates Order| EPR[<b>Order Placer</b><br/>EPR]
        Practitioner --> |3. Asks For| Specimen[Sample Collection]
        TIE[Trust Integration Engine] 
    end
    EPR --> |"2a. Sends Laboratory Order<br/>M118.1 Short Tandem Repeat (STR)<br/>HL7 v2 ORM_O01 (MFT)"| TIE
    Specimen --> |4. Send Specimen| LIMS 
    TIE --> |"2b. Sends Laboratory Order<br/>HL7 v2 ORM_O01"| RIE
    subgraph NWGenomics[North West Genomics]
        RIE --> |"2b. Sends Laboratory Order<br/>HL7 v2 ORM_O01"| LIMS
        LIMS[<b>Order Filler</b><br/>LIMS Histotrac]
        LIMS --> |5a. Send Laboratory Report<br/>HL7 v2 ORU_R01| RIE["Regional Integration Engine"]
    end
    RIE --> |5b. Send Laboratory Report<br/>HL7 v2 ORU_R01| TIE
    TIE --> |5c. Send Laboratory Report<br/>HL7 v2 ORU_R01| EPR

    classDef purple fill:#E1D5E7;

    class EPR,LIMS,Specimen,Practitioner purple
```

<img style="padding:3px;width:60%;" src="Chimerism-MFT.png" alt="Chimerism Genomic Tests - MFT"/>
<br clear="all">
<p class="figureTitle">Chimerism Genomic Tests - MFT</p> 
<br clear="all">

### Automated Test Order Delivery

```mermaid
graph TD;
    subgraph NHSTrustA[NHS Trust]
        EPRA[<b>Order Placer</b>] --> |Asks For| SpecimenA[Sample Collection]
        EPRA --> |1a. Laboratory Order| TIE[Trust Integration Engine]
    end
 
    SpecimenA --> |2 Send Specimen| LIMSA
    SpecimenA --> |2 Send Specimen| LIMSB
    SpecimenA --> |2 Send Specimen| LIMSC
    SpecimenA --> |2 Send Specimen| LIMSD

    TIE --> |1b. Laboratory Order| RIE 
    subgraph NWGenomics[NW Genomics]
        RIE --> |1c. Laboratory Order| TD[Test Distribution<br/>By Test Type]
        
        TD --> |1d. Laboratory Order| LIMSA[<b>Order Filler</b><br/>LIMS iGene] 
        TD --> |1d. Laboratory Order| LIMSB[<b>Order Filler</b><br/>LIMS Starlims]
        TD --> |1d. Laboratory Order| LIMSC[<b>Order Filler</b><br/>LIMS Shire]
        TD --> |1d. Laboratory Order| LIMSD[<b>Order Filler</b><br/>LIMS Histotrac]
        
        LIMSA --> |4a. Laboratory Report| RIE[Regional Integration Engine]
        LIMSB --> |4a. Laboratory Report| RIE
        LIMSC --> |4a. Laboratory Report| RIE
        LIMSD --> |4a. Laboratory Report| RIE
    end
    RIE --> |4b. Laboratory Report| TIE
    TIE --> |4c. Laboratory Report| EPRA
    
    classDef purple fill:#E1D5E7;
    class EPRA,SpecimenA,LIMSA,LIMSB,LIMSC,LIMSD purple;
```


