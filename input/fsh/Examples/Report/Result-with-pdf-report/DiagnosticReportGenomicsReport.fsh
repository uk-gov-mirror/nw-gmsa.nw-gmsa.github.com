Instance: DiagnosticReportGenomicsReport
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example."
Description: "First draft is based on Royal College of Radiologists HL7 v2 ORU converted to HL7 FHIR. Will be converted to a Genomics example"

* meta.versionId = "1.0"

//* extension[supporting-info].valueReference.reference = "urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646"
//* extension[supporting-info].valueReference.type = #DocumentReference

//* extension[DiagnosticReportCompositionR5].valueReference.reference = "http://madeup.example.com/Composition/123"

* identifier[ReportIdentifier]
  * value = "25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderIdentifier]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "1001166717"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
//  * extension[ExtCodeableReference].valueCodeableConcept.coding = $GTD#R240.1

* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[GenomicTestDirectory] = $GTD#R240.1

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"


* encounter.identifier
  * value = "1001166717"
  * system = "http://www.acme.org/encounter/identifiers/R0A"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* effectiveDateTime = "2023-09-07T11:45:41+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"

* performer[operator]
  * type = "Practitioner"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"
  * extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF

* resultsInterpreter[primaryReporter]
  * type = "Practitioner"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"

* conclusion = "Normal - no action"

* presentedForm[+]
  * contentType = #application/pdf
  * language = #en-GB
  * url = "urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f"
  * size = 43272
  * title = "Genomic Report for Octavia CHISLETT"
  * creation = "2023-11-24"
