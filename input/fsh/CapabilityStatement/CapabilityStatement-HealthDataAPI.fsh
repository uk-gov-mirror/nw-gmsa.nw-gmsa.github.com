Instance: HealthDataAPI
InstanceOf: CapabilityStatement
Title: "CapabilityStatement for NW GMSA Clinical Data Repository"
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


// ServiceRequest

* insert ResourceWithExpectation(#ServiceRequest, ServiceRequest, #SHALL)
* rest.resource[=]
  * documentation = """
  """

* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)

* insert SearchParamWithExpectation(_lastUpdated, #date, #SHALL)
* insert WithSearchParamDocumentation(The resource was last updated)

* insert SearchParamWithExpectation(identifier, #token, #SHALL)
* insert WithSearchParamDocumentation(Identifiers assigned to this order)

* insert SearchParamWithExpectation(patient, #reference, #SHALL)
* insert WithSearchParamDocumentation(Search by subject - a patient)
