### References

- https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation/keep-your-software-secure

### Overview

```mermaid
graph LR

consumer((Data Consumer))

subgraph APIGateway[API Gateway]
    enc[Encryption]
    rate[Rate Limiting]
    id[Identification and Authentication] 
end

subgraph DataPlatform[Data Platform]
    auth[Access Control and Authorisation]
    audit1[Audit Logging]
    consent[Patient Consent]
    data[Data Security]
    api[(Genomic Data Repository<br/>FHIR Repository)]
end

consumer --> |request| APIGateway
enc --> rate
rate --> id

APIGateway --> DataPlatform

audit1 --> auth
auth -->  data
data --> consent 
consent --> api
```

```mermaid
sequenceDiagram

participant consumer as Data Consumer
participant enc as Encryption
participant rate as Rate Limiting
participant id as Identification and Authentication 
participant auth as Access Control and Authorisation
participant audit1 as Audit Logging
participant api as FHIR Repository


consumer ->> enc: Request
enc ->> rate: Request
alt Ok
    rate ->> id: Request <br/> (authentication is a separate process)
    alt Ok 
       id ->> auth: Request 
       alt Ok
            auth ->> audit1: Request
            audit1 ->> api: Request
            api -->> audit1: Response
            audit1 -->> consumer: Response
       else Issue 
        auth -->> consumer : 403 Forbidden error
       end 
    else Issue
       id -->> consumer : 401 Unauthorized error
    end 
else Issue
    rate -->> consumer: 503 Service Unavailable error 
end  
```
## API Gateway 

### Encryption

| Transport level integration | Requirement | 
|-----------------------------|-------------|
| Protocols | TLS 1.2 is the minimum; TLS 1.3 is recommended. |
| Prohibitions | TLS 1.0, 1.1, and SSL are forbidden. |
| Authentication | Mutual authentication (TLS-MA) is frequently required for API interactions. Note NHS England APIM recommends using Signed JWT Authentication. |
| Ciphers | TLS_AES_256_GCM_SHA384 |
| Mutual Authentication | MUST only accept client certificates issued by the NHS England Digital Deployment Issue and Resolution (DIR) team <br/>MUST only accept client certificates with a valid Spine ‘chain of trust’ (that is, linked to the Spine SubCA and RootCA)<br/> MUST only accept client certificates which have not expired or been revoked |
| Content compression | MUST support GZIP compression |
| Transfer encoding | MUST support chunked transfer encoding |

### Rate Limiting

TODO 

### Identification and Authentication

Only system-to-system identification is currently supported.
NHS England identification: 

- Practitioner openID [NHS England CIS2 Authentication](https://digital.nhs.uk/services/care-identity-service/applications-and-services/cis2-authentication)
- Patient openID [NHS England NHS login](https://digital.nhs.uk/services/nhs-login)

## Data Platform

### Access Control and Authorisation

#### OAuth2

- [EURIDICE EU Health Data API - Authorization](https://hl7.eu/fhir/health-data-api/en/authorization.html)]

Is based on [IHE Internet User Authorization (IUA)](https://profiles.ihe.net/ITI/IUA/index.html) but using `client-credentials` grant only (at present).

The authorisation will be hosted on the Regional Orchestration Engine. This is responsible for maintaining all the clients for the region.

Any Trust Integration can act as the Authorisation Client or Resource Server in the diagram below.

<figure>
{%include authorisation-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">OAuth2 - Client Credentials Grant</p>
</figure>
<br clear="all">

- **Authorisation Server Metadata Request (ITI-103)** is an optional step to retrieve the metadata for the Authorisation Server
- **Get Access Token (ITI-71)** is used to obtain the `Access Token`, the request uses basic authentication using the client id as username and client secret as the password.
- The client then performs requests to the resource server using the `Access Token` (authorisation = Bearer {accessToken})
- The resource **MUST** check the token is valid using **Introspect Token (ITI-102)**, invalid tokens will be rejected using a 403 Forbidden http code.

#### Self Contained Tokens and JWT

See also [NHS England Security and authorisation](https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation)

FHIR Resource Scopes are used to define the permissions a client has to access a FHIR resource. See [SMART - App Launch: Scopes and Launch Context](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html)

### Audit Logging

See [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/volume-1.html)

```mermaid
graph TD;

creator[Audit Creator]
repository[(Audit repository)]
consumer[Audit Consumer]

creator --> |"Record Audit Event [ITI-20]"| repository
consumer --> |"Retrieve ATNA Audit Event [ITI-81]"| repository
```

### Patient Consent

TODO See [IHE Privacy Consent on FHIR (PCF)](https://profiles.ihe.net/ITI/PCF/volume-1.html)

### Data Security

All interactions must conform to this Implementation Guide, details on testing and validation are available in the [Testing](testing.html) section.

## NRL and Spine Security Proxy (SSP)

Based on [National Record Locator - FHIR API v3 - Producer](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer)

```mermaid
graph LR

consumer((Document Consumer))

registry["Document Registry<br/>National Record Locator (NRL)"]


SSP["Spine Security Proxy (SSP)"]


subgraph DataPlatform[Data Platform]
    auth[Access Control and Authorisation]
    audit1[Audit Logging]
    data[Data Security]
    api[(Genomic Data Repository)]
end

consumer --> |Find Patient Patient Documents| registry
consumer --> |Retrieve Document| SSP

SSP --> DataPlatform

auth --> audit1
audit1 --> data 
data --> api
```

### SSP Provider Security

See [SSP Retrieval](https://webarchive.nationalarchives.gov.uk/ukgwa/20250306000638/https://developer.nhs.uk/apis/nrl/retrieval_ssp.html)

<img style="padding:3px;width:80%;" src="retrieval_concept_diagram.png" alt="NW Genomics Technical Overview"/>
<br clear="all">

Combination of NW Genomics API Security and NHS Digital API Security

```mermaid
graph LR

consumer((Data Consumer))


subgraph Provider
   APIGateway[API Gateway]
   DP[Data Platform] 

end

subgraph Spine[NHS England Spine]
    SSP
end

consumer --> SSP
SSP --> APIGateway
APIGateway --> DP
DP ---> APIGateway
APIGateway ---> SSP
SSP ---> consumer
```

