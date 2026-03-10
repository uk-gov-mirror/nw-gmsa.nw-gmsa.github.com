
```mermaid
graph LR;

consumer([Data Consumer])

subgraph APIGateway
    enc[Encryption]
    rate{Rate Limiting}
    id[Identification and Authentication] 
end

subgraph DataPlatform
    auth{Access Control and Authorisation}
    audit1[Audit Logging]
    api[(FHIR Repository)]
    consent[Consent]
end

consumer --> |request| enc
enc --> rate
rate --> |ok| id
rate --> |busy| consumer
id --> audit1
audit1 --> auth
auth --> |accept| api
auth --> |reject| audit1
api --> audit1
audit1 --> |response| consumer
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

## Encryption

- Protocols: TLS 1.2 is the minimum; TLS 1.3 is recommended.
- Prohibitions: TLS 1.0, 1.1, and SSL are forbidden.
- Authentication: Mutual authentication (TLS-MA) is frequently required for API interactions. Note NHS England APIM recommends using Signed JWT Authentication.

## Rate Limiting

TODO 

## Identification and Authentication

Only system-to-system identification is currently supported.
NHS England identification: 

- Pracitioner openID [NHS England CIS2 Authentication](https://digital.nhs.uk/services/care-identity-service/applications-and-services/cis2-authentication)
- Patient openID [NHS England NHS login](https://digital.nhs.uk/services/nhs-login)

## Access Control and Authorisation

### OAuth2

Is based on [IHE Internet User Authorization (IUA)](https://profiles.ihe.net/ITI/IUA/index.html) but using `client-credentials` grant only (at present).

The authorisation will be hosted on the Regional Integration Engine. This is responsible for maintaining all the clients for the region.

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

### Self Contained Tokens and JWT

See also [NHS England Security and authorisation](https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation)

FHIR Resource Scopes are used to define the permissions a client has to access a FHIR resource. See [SMART - App Launch: Scopes and Launch Context](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html)

## Audit Logging

See [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/volume-1.html)

```mermaid
graph TD;

creator[Audit Creator]
repository[(Audit repository)]
consumer[Audit Consumer]

creator --> |"Record Audit Event [ITI-20]"| repository
consumer --> |"Retrieve ATNA Audit Event [ITI-81]"| repository
```


