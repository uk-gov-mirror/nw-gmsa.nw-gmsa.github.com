Data contracts govern all interactions defined in this implementation guide. They are primarily specified using HL7 FHIR; where applicable, mappings to HL7 v2 and IHE XDS will also be provided.


```mermaid
graph TD
    EHR[EPR] <--> |HL7 v2<br/>Orders & Reports| RIE
    LIMS[LIMS] <--> |HL7 v2<br/>Orders & Reports| RIE

    subgraph HIE["Health Information Exchange"]
        RIE[Regional Integration Engine] --> |Store<br/>HL7 FHIR| CDR[Genomic Data Repository]
    end
    Clinician[Data Sharing<br/>Clinical Apps<br/>Single Patient Record] --> |Read<br/>HL7 FHIR| CDR
    AI[Operational AI] --> |Read<br/>HL7 FHIR| CDR
    Ops["Operations Monitoring (Analytics)"] --> |Read<br/>HL7 FHIR| CDR

    CDR --> OLAP[Data Warehouse]
    A[Analytics and AI] --> OLAP
    OLAP --> FDP[Federated Data Platform]
    A --> FDP

    classDef green fill:#D5E8D4;

    class FDP,OLAP,CDR,LIMS,EHR green
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

```mermaid
flowchart TD
    A[Data Consumer<br/>Identifies Issue or New Constraint]
    B[Log Requirement / Issue<br/>NH Genomics IG Issues]
    C[NW Genomics Data Team<br/>Review & Feasibility Assessment]
    D["Create or Update<br/>Data Contract<br/>Implementation Guide (PR)"]
    E[NW Genomics Data Team<br/>Review & Approval]
    F[Release Change]

    A --> B --> C --> D --> E --> F
```
