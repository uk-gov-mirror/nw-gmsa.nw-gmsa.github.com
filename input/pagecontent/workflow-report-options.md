## Data and Document Sharing - Local/Regional Genomic Reports

Allows a consumer to retrieve genomic reports either as structured or unstructured

### Unstructured Documents

Pattern: FHIR RESTful + IHE [Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) 

```mermaid
sequenceDiagram
    participant Consumer As Document Consumer
    participant Repository As Document Registry and Repository

    Consumer ->> Repository: Query Document Metadata
    Repository -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> Repository: Retrieve Document (PDF)
    Repository -->> Consumer: PDF
```

### Structured Data

Pattern: FHIR RESTful + IHE [Query for Existing Data for Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/index.html) also following [HL7 Genomic Report](https://build.fhir.org/ig/HL7/genomics-reporting/)

```mermaid
sequenceDiagram
    participant Consumer As Data Consumer
    participant Repository As Data Repository

    Consumer ->> Repository: Query Data (Diagnostic Report, Observation, etc)
    Repository -->> Consumer :FHIR Resources
```

### Unstructured Documents + Events

In the Regional NW Genomics environment the following pattern is used.

```mermaid
sequenceDiagram
    participant Producer As Document Producer<br/>via NW Regional Integration Engine
    participant Consumer As Document Consumer
    participant Repository As Document Registry + Repository<br/>NW Genomic Data Repository

    Note over Producer,Repository: Adding document to the Repository
    Producer ->> Repository: FHIR Message or HL7 v2 ORU_R01
    Note over Consumer,Repository: Retrieving documents from the Repository
    Consumer ->> Repository: Query Document Metadata
    Repository -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> Repository: Retrieve Document (PDF)
    
    Repository -->> Consumer: PDF
```

For document sharing within an ICS/LHCRE e.g. Greater Manchester Care Record (GMCR), the above pattern is modified as follows:

```mermaid
sequenceDiagram
    participant Producer As Document Producer<br/>via NW Regional Integration Engine
    participant Consumer As Document Consumer
    participant Repository As Document Registry + Repository<br/>NW Genomic Data Repository
    participant RepositoryICS As Document Registry + Repository<br/>ICS e.g. GMCR

    Note over Producer,Repository: Adding document to the NW Repository
    Producer ->> Repository: FHIR Message or HL7 v2 ORU_R01 
    Note over Repository,RepositoryICS: Adding document to the NW Repository
    Repository ->> RepositoryICS: HL7 v2 MDM_T02 
    Note over Consumer,Repository: Retrieving documents from the Repository
    Consumer ->> RepositoryICS: Query Document Metadata
    RepositoryICS -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> RepositoryICS: Retrieve Document (PDF)
    
    RepositoryICS -->> Consumer: PDF
```

See also England national variation [Structured/Unstructured Documents + Events](#structuredunstructured-documents--events)

## National Genomic Reports

### Unstructured Documents

Pattern: FHIR RESTful + IHE [Mobile Health Document Sharing](https://profiles.ihe.net/ITI/MHDS/index.html) - this is essentially the same as the local genomic reports but the registry is now a seperate service.

```mermaid
sequenceDiagram
    participant Consumer As Document Consumer
    participant Registry As Document Registry<br/>National Record Locator Service
    participant Repository As Document Repository

    Consumer ->> Registry: Query Document Metadata
    Registry -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> Repository: Retrieve Document (PDF)
    Repository -->> Consumer: PDF
```

### Structured Data (Composition)

Pattern: FHIR RESTful + IHE [Mobile Health Document Sharing](https://profiles.ihe.net/ITI/MHDS/index.html) - as above, but the document is now a FHIR Document, probably [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/en/index.html) combined with [HL7 Genomic Report](https://build.fhir.org/ig/HL7/genomics-reporting/) 

```mermaid
sequenceDiagram
    participant Consumer As Document Consumer
    participant Registry As Document Registry<br/>National Record Locator Service
    participant Repository As Document Repository

    Consumer ->> Registry: Query Document Metadata
    Registry -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> Repository: Retrieve Document (FHIR Document)
    Repository -->> Consumer: FHIR Document
```

Technically this would likely be implemented as a aggregation using the local structured API's (this is how YHCR is implementing International Patient Summary which is also a FHIR Document)
Unified Genomic Registry (UGR) has not decided on a specific option yet.

```mermaid
sequenceDiagram
    participant Consumer As Document Consumer
    participant Registry As Document Registry<br/>National Record Locator Service
    participant RepositoryFacade As Document Repository Facade
    participant Repository As Data Repository

    Consumer ->> Registry: Query Document Metadata
    Registry -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> RepositoryFacade: Retrieve Document (FHIR Document)
    RepositoryFacade ->> Repository: Query Data (Diagnostic Report, Observation, etc)
    Repository -->> RepositoryFacade:FHIR Resources
    RepositoryFacade ->> RepositoryFacade: Assemble FHIR Document
    RepositoryFacade -->> Consumer: FHIR Document
```

### Structured/Unstructured Documents + Events

With the laboratory report shared, workflow can be altered to be event based. When a laboratory report is shared, a notification to the order placer and others who have subscribed to the event.
This allows HL7 v2 ORU_R01 messages to be phased out. 

Pattern: FHIR RESTful + IHE [Document Subscription for Mobile (DSUBm)](https://profiles.ihe.net/ITI/DSUBm/index.html)

For national, access to local repositories would be required would again use IHE BALP. The authentication is likely to be [SSP Retrieval](https://developer.nhs.uk/apis/nrl/retrieval_ssp.html), this means the consumer does not talk directly to the repository.

The sequence is described below, this is quite similar to the NW Genomic Pattern [Unstructured Documents + Events](#unstructured-documents--events) with the Document Registry and Repository split into two components - the registry is NRL and the repository is NW Genomic Data Repository as before.

```mermaid
sequenceDiagram
    participant Producer As Document Producer<br/>via NW Regional Integration Engine
    participant Consumer As Document Consumer
    participant Registry As Document Registry<br/>National Record Locator Service
    participant SSP As Spine Secure Proxy
    participant Repository As Document Repository<br/>NW Genomic Data Repository

    Note over Producer,Repository: Adding document to the Repository
    Producer ->> Repository: FHIR Message or HL7 v2 ORU_R01 
    Note over Registry,Repository: Adding document Metadata to the Registry
    Repository ->> Registry: FHIR RESTful POST /DocumentReference
    Note over Consumer,Repository: Retrieving documents from the Registry and Repository
    Consumer ->> Registry: Query Document Metadata
    Registry -->> Consumer: List of DocumentReference
    Consumer ->> Consumer: Select Document entry
    Consumer ->> SSP: Retrieve Document (PDF/FHIR Document)
    SSP ->> Repository: Retrieve Document (PDF/FHIR Document)
    Repository -->> SSP: PDF/FHIR Document
    SSP -->> Consumer: PDF/FHIR Document
```

## Security Considerations

For local this would be using an OAuth2 Authorisation flow - see [Authorisation (OAuth2)](authorisation.html)
In addition all queries would be audited e.g. follow IHE [Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html)