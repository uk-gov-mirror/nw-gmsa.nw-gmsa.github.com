<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

### Reference

- [ehealthsuisse Volume 3 - CH:ATC Audit Event Content Profiles](https://build.fhir.org/ig/ehealthsuisse/ch-epr-fhir/volume3.html)

### Summary 

| Data Element                | FHIR AuditEvent           | National Code           | Description                                                                           |
|-----------------------------|---------------------------|-------------------------|---------------------------------------------------------------------------------------|
| Event Type                  | type                      |                         |                                                                                       |
| Event Sub Type              | subtype[ihe]              |                         | Codes from urn:ihe:event-type-code                                                    |
| Event Data and Time         | recorded                  |                         |                                                                                       |
| RESTful Action              | action                    |                         |                                                                                       |
| Initiator OAuth2            | agent[oClient]            |                         | OAuth2 ClientID.                                                                      |
| Initiator                   | agent[client]             | ODS Code                | Client DNS or IP address                                                              |
| Initiator                   | agent[user]               | GMC,GMP, HCPC, etc code |                                                                                       |
|                             | agent[server]             | ODS Code                | Server DNS or IP address                                                              |
| Restful/Message Transaction | entity[transaction]       |                         | Middleware Message ID or (HL7 FHIR) RESTful HTTP Header: X-Request-ID                 |
| Message Type                | entity[event].lifecycle   |                         | HL7 V2 MSH-9 Message Type [HL7 Events](http://terminology.hl7.org/CodeSystem/v2-0003) |
| Message ID                  | entity[message] |                         | HL7 V2 MSH-10 Message Control ID (HL7 FHIR) RESTful HTTP Header: X-Request-ID         |
| RESTful Query               | entity[restful]             |                         | also known as `data` in IHE BALP                                                      |
| Patient                     | entity[patient]           | NHS Number              | Patient reference plus NHS Number                                                     |
{:.grid}
