Instance: 94bf65ba-cd6c-4601-b339-6d547f424646
InstanceOf: DocumentReference
Title: "Document Reference Laboratory Report"
Description: "TODO"

* identifier[+].value = "94bf65ba-cd6c-4601-b339-6d547f424646"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "699X0"

* status = #current

* date = "2025-01-29T10:37:26+00:00"

* type
  * coding[+]
    * code = #1054161000000101
    * display = "Genetic report"
    * system = $sct

// EPIC PV1
* context.encounter[+]
  * identifier
    * value = "1001166717"
    * system = "http://www.acme.org/encounter/identifiers/R0A"
    * assigner.identifier.system = $ods-code
    * assigner.identifier.value = "R0A"

* context.related[fillerOrderNumber].identifier.value = "1001166717"
* context.related[fillerOrderNumber].identifier.system = "http://www.example.org/servicerequest/identifier"
//* context.related[reportNumber].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* context.related[fillerOrderNumber].identifier.assigner.identifier.system = $ods-code
* context.related[fillerOrderNumber].identifier.assigner.identifier.value = "699X0"

* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f"

// * author[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* context.event[+] = $test-directory#R240.1

* context.sourcePatientInfo.identifier.type = $v2-0203#MR
* context.sourcePatientInfo.identifier.value = "633"
* context.sourcePatientInfo.identifier.system = "http://www.acme.org/patient/identifier"
* context.sourcePatientInfo.identifier.assigner.identifier.system = $ods-code
* context.sourcePatientInfo.identifier.assigner.identifier.value = "R0A"


