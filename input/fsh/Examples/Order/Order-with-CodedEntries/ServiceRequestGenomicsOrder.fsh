Instance: ServiceRequestGenomicsOrderCodedEntries
InstanceOf: ServiceRequest
Title: "ServiceRequest Coded Entries Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[PlacerOrderNumber].type = $v2-0203#PLAC
* identifier[PlacerOrderNumber].value = "1601737"
* identifier[PlacerOrderNumber].system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
* identifier[PlacerOrderNumber].assigner.identifier.system = $ods-code
* identifier[PlacerOrderNumber].assigner.identifier.value = "R0A"

* identifier[FillerOrderNumber].type = $v2-0203#FILL
* identifier[FillerOrderNumber].value = "1001166717"
* identifier[FillerOrderNumber].system = "http://www.acme.org/servicerequest"
* identifier[FillerOrderNumber].assigner.identifier.system = $ods-code
* identifier[FillerOrderNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* category[GenomicsWholeCaseSequencing] = https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory#cancer-wgs

* authoredOn = "2025-01-29"

* code = $test-directory#R240.1

* requester.reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* supportingInfo[+].reference = "urn:uuid:27ca6057-e481-426a-ba8a-2acfffc0c1c4"

* specimen[+].reference = "urn:uuid:89e66518-9197-4553-9253-5ab5133b62c0"

* reasonCode[+]
  * coding[+]
    * code = #R240
    * display = "Diagnostic testing for known mutation(s)"
    * system = $GCC
* reasonReference[+]
  * reference = "urn:uuid:47f34393-cc83-428f-b8dd-54bcd372c847"

* note[+]
  * text = """
 Referral lab PLEASE do following tests:

 Test(s) required: WGS
 Sample type: Blood
 Transport used: Merlin Courier
 Tracking Number: ABC123
 Sample sent to: LWH Genetics
 By: PDAY       on: 02/04/25

 Speciality Requesting Clinician: PAEDS
 Test Group: Neurology
 Ethnic Group: White British
 Patient is from consanguineous union? : Unknown
 Specimen Collection Status: Collect & send with order
 Infection Risk: No Specific Risk
 Clinical details:

 TESTING
 Contact/Bleep No: 123
  """
