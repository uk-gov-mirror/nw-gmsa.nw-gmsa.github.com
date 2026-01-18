
### Summary 

| Element             | National Code           | Description                                                                                                    |
|---------------------|-------------------------|----------------------------------------------------------------------------------------------------------------|
| agent[oClient]      |                         | OAuth2 ClientID.                                                                                               |
| agent[client]       | ODS Code                | Client DNS or IP address                                                                                       |
| agent[server]       | ODS Code                | Server DNS or IP address                                                                                       |
| agent[user]         | GMC,GMP, HCPC, etc code |                                                                                                                |
| entity[transaction] |                         | (HL7 FHIR) RESTful HTTP Header: X-Request-ID                                                                   |
| entity[message]     |                         | HTTP Header: X-Correlation-ID, HL7 v2 MSH.10 - Message Control ID and HL7 FHIR Message Bundle.identifier.value |
| entity[query]       |                         | also known as `data` in IHE BALP                                                                               |
| entity[patient]     | NHS Number              | Patient reference plus NHS Number                                                                              |
