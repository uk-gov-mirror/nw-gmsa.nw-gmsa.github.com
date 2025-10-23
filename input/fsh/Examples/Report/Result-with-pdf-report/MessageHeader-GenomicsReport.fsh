Instance: MessageHeaderGenomicReport
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report"
Description: "TODO"
Usage: #example

* meta.lastUpdated = "2025-02-01T13:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RBS"
* destination.receiver.display = "ALDER HEY CHILDREN'S NHS FOUNDATION TRUST"
* destination.endpoint = "http://www.acme.org/endpoint/identifier/RBS"

* source.endpoint = "http://www.acme.org/endpoint/identifier/rie"
* source.software = "GMSA RIE"

* focus[+]
  * reference = "urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f"
  * type = #DiagnosticReport

* focus[+]
  * reference = "urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646"
  * type = #DocumentReference
