<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference Standards

- [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html)
- NHS England APIs
  - Organisation Data Service (ODS) [Organisation Data Terminology - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-terminology)
  - See also Spine Directory Service (SDS) and Directory of Services (DOS)

## Overview

The mCSD interface will initially be used to route Laboratory Reports to interfaces associated with NHS Acute Trusts and Patients Surgery (retrieved via NHS England Personal Demographics Service - FHIR API).

```mermaid
graph TD;

    U[Query Client] --> |ITI-90<br/>FHIR REST| RIE["Mobile Care Services Discovery (mCSD)"];
    RIE --> |"Organisation Data Terminology<br/>FHIR REST"| ODS["Organisation Data Service (ODS)"]
    RIE --> |"Future?"| SDS[Spine Directory Service]
    RIE --> |Future?| DOS[Directory of Service]
```
