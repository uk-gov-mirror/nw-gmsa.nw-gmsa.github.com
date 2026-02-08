Profile:        ShipmentTrackingNumber
Parent:         CorrelationIdentifier
Id:             ShipmentTrackingNumber
Title:          "Shipment Tracking Number"
Description:     """
`Diagnostic Workflow` HL7 IdentifierType: **STN** Shipment Tracking Number
"""

* ^purpose = """
## Mapping

`NHS Data Model and Dictionary` nil
- **HL7 FHIR** Specimen.identifier (type = STN)
- **HL7 v2** Accession ID (SPM-32)
- **IHE XDS** nil
"""

* type = $v2-0203#STN "Shipment Tracking Number"
* system ^short = "uri should be defined and unique supplying organisation."
* value 1..1
