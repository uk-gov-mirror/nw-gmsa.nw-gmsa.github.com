Instance: Composition-GenomicsReport-OctaviaCHISLETT
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Octavia CHISLETT"
Description: "Composition - Genomics Report Octavia CHISLETT"
Usage: #example

* identifier.value = "30551ce1-5a28-4356-b684-1e639094ad4d"
* status = #final
* type = $sct#1054161000000101 "Genetic report"
//* meta.versionId = 3
* date = "2024-10-13T10:33:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "R0A"
* author.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* title = "Composition Genomics Report Octavia CHISLETT"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.identifier.system = $nhs-number
* subject.identifier.value = "9449305552"
* subject.display = "Octavia CHISLETT"

* section[+]
  * title = "Results"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>Genetics Report</li></ul></div>"
  * code = http://loinc.org#30954-2
  * entry[+].reference = "urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80"
  * entry[+].reference = "urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646"

Instance: FHIRDocumentGeneticReportBundle
InstanceOf: Bundle
Title:       "Bundle `Document` - Genetic Report"
Description:  "FHIR Document Genetic Report for Jack Dawkins"
Usage: #example
* insert DocumentBundle("1d7155e8-b5b8-4406-adda-01a474d5ff6c", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:30551ce1-5a28-4356-b684-1e639094ad4d", Composition-GenomicsReport-OctaviaCHISLETT)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-OctaviaCHISLETT-9449305552)
* insert EntryDocument("urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80", DiagnosticReportGenomicsReport)
// DocumentReference
* insert EntryDocument("urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646", 94bf65ba-cd6c-4601-b339-6d547f424646)
// Binary
* insert EntryDocument("urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f", d6eeedd1-92d3-45b9-bf33-6401e804425f)
// Practitioner Role - order creator
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
