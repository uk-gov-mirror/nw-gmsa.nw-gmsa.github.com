
Reference:
- [NHS England - Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)

### MessageHeader and MNS Schema Mapping

This mapping is based on this example from MNS for `pds-change-of-gp2`

```json
{
"specversion": "1.0",
"id": "56e9d7db-d70a-48bf-95f8-e779a741382a",
"source": "https://fhir.nhs.uk/Id/nhsSpineASID/477121000324",
"type": "pds-change-of-gp-2",
"time": "2020-06-01T13:00:00Z",
"dataref": "https://api.service.nhs.uk/personal-demographics/FHIR/R4/Patient/9912003888",
"subject": "9912003888"
}
```

| MNS Element | FHIR Event (MessageHeader)                              | FHIR Bundle (message) |
|-------------|---------------------------------------------------------|-----------------------|
| id |                                                         | Bundle.identifier     | 
| source | MessageHeader.source.endpoint                           |                       | 
| type | MessageHeader.eventCoding.code                          |                       | 
| time |                            | Bundle.timestamp                      | 
| subject | MessageHeader.focus[patient].reference.identifier.value |                       | 
| dataref | MessageHeader.focus[resource].reference                 |                       | 
{:.grid}

The MNS example above is for a `pds-change-of-gp-2` event and is mapped to FHIR as 

```json
{
  "resourceType": "Bundle",
  "identifier": {
    "value": "56e9d7db-d70a-48bf-95f8-e779a741382a"
  },
  "type": "message",
  "timestamp": "2020-06-01T13:00:00Z",
  "entry": [
    {
      "fullUrl": "urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63",
      "resource": {
        "resourceType": "MessageHeader",
        "eventCoding": {
          "code": "pds-change-of-gp-2"
        },
        "source": {
          "endpoint": "https://fhir.nhs.uk/Id/nhsSpineASID/477121000324"
        },
        "focus": {
          "reference": "https://api.service.nhs.uk/personal-demographics/FHIR/R4/Patient/9912003888",
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/nhs-number",
            "value": "9912003888"
          }
        }
      }
    }
  ]
}
```

### Events Types

#### Patient

(For illustrative purposes only)

| MNS Event Type           | Description | HL7/IHE Event Type | Description                             |
|--------------------------|-------------|--------------------|-----------------------------------------|
|                          |             | A28                | Add person information                  | 
| pds-change-of-gp-2       |             | A31                | Update person information               |
| pds-death-notification-2 |             | A31                |                                         |
| gpreg-change-gp-req-1    |             | A31                |                                         |
| nhs-number-change-2      |             | A40?               | Merge patient - patient identifier list |
{:.grid}

#### DiagnosticReport

#### DocumentRefernce

#### ServiceRequest

#### Specimen

| MNS Event Type | Description | HL7/IHE Event Type                                            | Description |
|----------------|-------------|---------------------------------------------------------------|-------------|
|                |             | Events are defined in [IHE Specimen Event Tracking](SET.html) |             |
{:.grid }

#### Task 


