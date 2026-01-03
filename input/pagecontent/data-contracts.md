Data Contracts apply to all interactions used in this implementation guide. They are primarily expressed using HL7 FHIR, when HL7 v2 and IHE XDS mappings will be provided.

```mermaid
graph TD;

    EHR["EPR (Electronic Patient Record)"] <--> |**Data Contract**<br/>Laboratory Order and Reports<br/>HL7 v2 OML + ORU| RIE
    GA["Genomic Applications"] --> |**Data Contract**<br/>HL7 v2/FHIR| CDR
    subgraph DP["HIE (Health Information Exchange)"]
        RIE[Regional Integration Engine] --> |**Data Contract**<br/>Data Pipeline<br/>HL7 FHIR| CDR["Clinical Data Repository<br/><br/>OLTP (Online Transaction Processing)"] 
    end 
    LIMS["LIMS (Laboratory Information Management System)"] <--> |**Data Contract**<br/>Laboratory Order and Reports<br/>HL7 v2 OML + ORU| RIE 
        LIMS --> OLAP
    Clinician["Clinician<br/>via national/regional record sharing"] --> |**Data Contract**<br/>HL7 FHIR| CDR
    AI[Artificial Intelligence] --> |**Data Contract**<br/>HL7 FHIR| CDR
    OP["Operations Monitoring (Data Analytics)"] --> |**Data Contract**<br/>HL7 FHIR| CDR
    subgraph Analytics
        OLAP["Data warehouse<br/><br/>OLAP (Online Analytical Processing)"]  --> FDP["FDP (Federated Data Platform)"]
    end
    CDR --> OLAP
```

The scope of these data contracts is shown in the diagram above. It specifically excludes expressing data contracts for:
- EPR (Electronic Patient Record) systems (e.g. [openEHR Genomics](https://ckm.openehr.org/ckm/projects/1013.30.50) )
- Genomic Applications (e.g. [Global Alliance for Genomics and Health](https://www.ga4gh.org/)) 
- LIMS 
- OLAP (Online Analytical Processing) and FDP (Federated Data Platform)

