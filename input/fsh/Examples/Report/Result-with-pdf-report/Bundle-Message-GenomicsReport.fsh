Instance: GenomicsReportMessage
InstanceOf: Bundle
Title:       "Bundle 'Message' - Genomics Report"
Description:  "Influenced by HL7 v2 ORU_R01"
Usage: #example
* insert MessageBundle("urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63", MessageHeaderGenomicReport)
* insert EntryDocument("urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f", DiagnosticReportGenomicsReport)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-OctaviaCHISLETT-9449305552)
// DocumentReference
* insert EntryDocument("urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646", 94bf65ba-cd6c-4601-b339-6d547f424646)
// Binary
* insert EntryDocument("urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f", d6eeedd1-92d3-45b9-bf33-6401e804425f)
// Practitioner Role - order creator
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
