
| Element              | Description                                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------------------|
| agent[oClient] | OAuth2 ClientID.                                                                |
| agent[client]        | Client DNS or IP address                                                                                        |
| agent[server]        | Server DNS or IP address                                                                                        |
| agent[user]          |                                                                                                                 |
| entity[transaction]  | (HL7 FHIR) RESTful HTTP Header: X-Request-ID                                                                    |
| entity[message]      | HTTP Header: X-Correlation-ID, HL7 v2 MSH.10 - Message Control ID and HL7 FHIR Message Bundle.identifier.value|
| entity[data]         | also known as `query` in IHE BALP                                                                               |
| entity[patient]      | Patient reference plus NHS Number                                                                               |
