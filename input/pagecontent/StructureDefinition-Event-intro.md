
Reference:
- [NHS England - Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)
- [US Core - Patient Feed](https://build.fhir.org/ig/HL7/US-Core/patient-data-feed.html)



### Events Types

#### Patient

(For illustrative purposes only)

| MNS Event Type           | Description | HL7/IHE Event Trigger | Description                             |
|--------------------------|-------------|-----------------------|-----------------------------------------|
|                          |             | A28                   | Add person information                  | 
| pds-change-of-gp-2       |             | A31                   | Update person information               |
| pds-death-notification-2 |             | A31                   |                                         |
| gpreg-change-gp-req-1    |             | A31                   |                                         |
| nhs-number-change-2      |             | A40?                  | Merge patient - patient identifier list |
{:.grid}

#### DiagnosticReport

| MNS Event Type | Description | HL7/IHE Event Trigger | Description                     |
|----------------|-------------|-----------------------|---------------------------------|
|                |             | R01                   | Unsolicited Observation Message |
{:.grid}

#### DocumentRefernce

| MNS Event Type | Description | HL7/IHE Event Trigger | Description                    |
|----------------|-------------|-----------------------|--------------------------------|
|                |             | T01                   | Original document notification |
{:.grid}

#### ServiceRequest

| MNS Event Type | Description | HL7/IHE Event Trigger | Description      |
|----------------|-------------|-----------------------|------------------|
|                |             | O01                   |                  |
|                |             | O21                   | Laboratory order |
{:.grid}

#### Specimen

| MNS Event Type | Description | HL7/IHE Event Trigger                                         | Description |
|----------------|-------------|---------------------------------------------------------------|-------------|
|                |             | Events are defined in [IHE Specimen Event Tracking](SET.html) |             |
{:.grid }

#### Task


### NHS England Multicase Notification Mapping

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
        "focus": [{
          "reference": "https://api.service.nhs.uk/personal-demographics/FHIR/R4/Patient/9912003888",
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/nhs-number",
            "value": "9912003888"
          }
        }]
      }
    }
  ]
}
```

### Event Notification Examples

#### MNS Example Converted for general use

An alternative approach would use existing event triggers in common use in the NHS. For the example above this would be `A31` (Update person information) in place of `pds-change-of-gp-2`. In the example below, the ASID endpoints could still be used; the inclusion of ODS codes is desirable. 

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
          "system": "http://terminology.hl7.org/CodeSystem/v2-0003",
          "code": "A31"
        },
        "sender": {
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/ods-organization-code",
            "value": "699X0"
          },
          "display": "NHS NW Genomics"
        },
        "source": {
          "endpoint": "https://fhir.nwgenomics.nhs.uk/Endpoint/IGENE",
          "software": "NW Genomics HIE"
        }
        "destination": [
          {
            "endpoint": "https//fhir.mft.nhs.uk/Endpoint/EPIC",
            "receiver": {
              "identifier": {
                "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                "value": "R0A"
              }
            }
          }
        ],
        "focus": [{
          "reference": "https://api.service.nhs.uk/personal-demographics/FHIR/R4/Patient/9912003888",
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/nhs-number",
            "value": "9912003888"
          }
        }]
      }
    }
  ]
}
```

#### Original Document Notification Example

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
          "system": "http://terminology.hl7.org/CodeSystem/v2-0003",
          "code": "T01"
        },
        "sender": {
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/ods-organization-code",
            "value": "699X0"
          },
          "display": "NHS NW Genomics"
        },
        "source": {
          "endpoint": "https://fhir.nwgenomics.nhs.uk/Endpoint/IGENE",
          "software": "NW Genomics HIE"
        },
        "destination": [
          {
            "endpoint": "https//fhir.mft.nhs.uk/Endpoint/EPIC",
            "receiver": {
              "identifier": {
                "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                "value": "R0A"
              }
            }
          }
        ],
        "focus": [{
          "reference": "urn:uuid:006fffb3-0810-4c18-b943-4cc0c815c16b"
        }]
      }
    },
    {
      "fullUrl": "urn:uuid:006fffb3-0810-4c18-b943-4cc0c815c16b",
      "resource": {
        "resourceType": "DocumentReference",
        "content": [
          {
            "attachment": {
              "contentType": "application/pdf",
              "url": "https://fhir.nwgenomics.nhs.uk/Binary/T25-0209"
            }
          }
        ],
        "context": {
          "period": {
            "end": "2025-10-14T15:59:16+00:00",
            "start": "2025-10-14T15:59:16+00:00"
          },
          "related": [
            {
              "identifier": {
                "assigner": {
                  "identifier": {
                    "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                    "value": "RR8"
                  }
                },
                "type": {
                  "coding": [
                    {
                      "code": "PLAC",
                      "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                    }
                  ]
                },
                "value": "1000152872"
              },
              "type": "ServiceRequest"
            },
            {
              "identifier": {
                "assigner": {
                  "identifier": {
                    "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                    "value": "699X0"
                  }
                },
                "system": "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier",
                "type": {
                  "coding": [
                    {
                      "code": "FILL",
                      "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                    }
                  ]
                },
                "value": "T25-0209"
              },
              "type": "DiagnosticReport"
            }
          ],
          "sourcePatientInfo": {
            "identifier": {
              "assigner": {
                "identifier": {
                  "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                  "value": "RR8"
                }
              },
              "type": {
                "coding": [
                  {
                    "code": "MR",
                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                  }
                ]
              },
              "value": "L765432"
            }
          }
        },
        "custodian": {
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/ods-organization-code",
            "value": "699X0"
          },
          "type": "Organization"
        },
        "date": "2025-10-14T15:59:16+00:00",
        "identifier": [
          {
            "assigner": {
              "identifier": {
                "system": "https://fhir.nhs.uk/Id/ods-organization-code",
                "value": "699X0"
              }
            },
            "system": "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier",
            "type": {
              "coding": [
                {
                  "code": "FILL",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "T25-0209"
          }
        ],
        "status": "current",
        "subject": {
          "identifier": {
            "system": "https://fhir.nhs.uk/Id/nhs-number",
            "type": {
              "coding": [
                {
                  "code": "NH",
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
                }
              ]
            },
            "value": "9737383222"
          }
        },
        "type": {
          "coding": [
            {
              "code": "1054161000000101",
              "display": "Genetic report",
              "system": "http://snomed.info/sct"
            }
          ]
        }
      }
    }
  ]
}
```



