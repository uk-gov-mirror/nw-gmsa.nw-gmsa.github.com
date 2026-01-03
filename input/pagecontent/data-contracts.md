Data contracts govern all interactions defined in this implementation guide. They are primarily specified using HL7 FHIR; where applicable, mappings to HL7 v2 and IHE XDS will also be provided.


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

The diagram above illustrates the scope of the data contracts covered by this guide. Specifically, it **excludes** the definition of data contracts for the following systems and domains:

- EPR (Electronic Patient Record) systems (e.g. [openEHR Genomics](https://ckm.openehr.org/ckm/projects/1013.30.50) )
- Genomic Applications (e.g. [Global Alliance for Genomics and Health](https://www.ga4gh.org/)) 
- LIMS 
- OLAP (Online Analytical Processing) and FDP (Federated Data Platform)

This guide **includes** the definition of data contracts for:

- **Business-to-Business (B2B):** Use of HL7 FHIR to read data from the Clinical Data Repository.
- **Data Pipeline:** Internal use of HL7 FHIR for data exchange between the Regional Integration Engine and the Clinical Data Repository.
- **Business-to-Business (B2B):** Use of HL7 v2 and HL7 FHIR for interactions between LIMS and EPR systems.
- **Data Pipeline:** Use of HL7 v2, HL7 FHIR and IHE XDS for data exchange between the CDR and Regional Document Sharing systems such as IHE XDS, GMCR and National Record Locator. Note: data contract downgrades will be present in these pipelines.

## Data Contract Change Process

1. Data consumers identify data constraints or issues.
2. Requirements or issues are logged in the [NH Genomics IG issues](https://github.com/nw-gmsa/nw-gmsa.github.com/issues)
3. Business stakeholders, suppliers, and integration partners (collectively, the `NW Genomics Data Team`) review the item and assess its feasibility.
4. The data contract is created or updated within this implementation guide (for example, via a pull request).
5. The proposed change is reviewed and approved by the `NW Genomics Data Team`.
6. Once approved, the change is released.
