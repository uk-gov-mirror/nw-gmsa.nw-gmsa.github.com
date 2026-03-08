Instance: HealthDataAPI
InstanceOf: CapabilityStatement
Title: "CapabilityStatement for NW Genomics Genomic Data Repository (EURIDICE Health Data API)"
Usage: #definition

* description = """
Is based on [EURIDICE Health Data API](https://euridice.org/eu-health-data-api/), which we are using as FHIR R4 version of [Care Connect API](https://nhsconnect.github.io/CareConnectAPI/)

The `OpenAPISwagger Definition file` below, can be viewed using [Swagger Editor](https://editor.swagger.io/)
"""
* name = "EURIDICE Health Data API"
* status = #draft
* experimental = false
* date = "2026-03-08"
* kind = #capability
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * security
    * service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
    * description = "Recommend [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html)"


// Binary

* insert ResourceWithExpectation(#Binary, Binary, #SHALL)
* rest.resource[=]
  * documentation = """
  EURIDICE Document Exchange - IHE Mobile access to Health Documents (MHD) [Retrieve Document [ITI-68]](https://profiles.ihe.net/ITI/MHD/ITI-68.html)
  """

* insert InteractionWithExpectation(#read, #SHALL)

// Document Reference

* insert ResourceWithExpectation(#DocumentReference, DocumentReference, #SHALL)
* rest.resource[=]
  * documentation = """
  EURIDICE Document Exchange - IHE Mobile access to Health Documents (MHD) [Find Document References [ITI-67]](https://profiles.ihe.net/ITI/MHD/ITI-67.html)
  """

* insert InteractionWithExpectation(#search-type, #SHALL)

// ServiceRequest

* insert ResourceWithExpectation(#DiagnosticReport, DiagnosticReport, #SHALL)
* rest.resource[=]
  * documentation = """
  EURIDICE Resource access - Query for Existing Data for Mobile (QEDm) [Mobile Query Existing Data [PCC-44]](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html)
  """

* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)

* insert SearchParamWithExpectation(category, #token, #SHALL)
* insert WithSearchParamDocumentation(The classification of the type of observation)

* insert SearchParamWithExpectation(code, #token, #SHALL)
* insert WithSearchParamDocumentation(The code of the observation type)

* insert SearchParamWithExpectation(date, #date, #SHALL)
* insert WithSearchParamDocumentation([[Obtained date/time. If the obtained element is a period, a date that falls in the period. The date modifiers ge,le,gt,lt SHALL be supported.]])

* insert SearchParamWithExpectation(patient, #reference, #SHALL)
* insert WithSearchParamDocumentation(Search by subject - a patient)

* insert SearchParamCombinationWithExpectation(#SHALL)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(category)
