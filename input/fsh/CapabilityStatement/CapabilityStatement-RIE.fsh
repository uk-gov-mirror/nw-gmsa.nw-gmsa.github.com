Instance: RegionalIntegrationEngine
InstanceOf: CapabilityStatement
Title: "CapabilityStatement for NW GMSA Regional Integration Engine for Genomics"
Usage: #definition

* description = """
Is based on [FHIR Messaging](https://hl7.org/fhir/R4/messaging.html) to handle transformation of HL7 FHIR and v2 Messages to FHIR Workflow.

The `OpenAPISwagger Definition file` below, can be viewed using [Swagger Editor](https://editor.swagger.io/)
"""
* name = "CapabilityStatement-RIE"
* status = #draft
* experimental = false
* date = "2025-01-30"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * security
    * service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
    * description = "Recommend [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html)"

* insert ResourceWithExpectation(#Bundle, Bundle, #SHALL)
* rest.resource[=]
  * documentation = """
  ## Process Message

  See [Submit Test Order Form (Send HL7 FHIR Message Laboratory Order)](LAB-1.html#submit-test-order-form-send-hl7-fhir-message-laboratory-order)

  ```
  POST [base]/$process-message
  ```

  ## Search (Poll for Messages)

  See [Asynchronous Message Delivery](LAB-1.html#asynchronous-message-response)

  ```
  GET [base]/Bundle?message.receiver:identifier=[odsCode]&_lastUpdated=[date]
  ```

  ### Example

  ```
  GET [base]/Bundle?message.receiver:identifier=R0A&_lastUpdated=gt2025-02-01
  ```

  Example returned search results [Bundle 'SearchSet' - Genomics Order](Bundle-GenomicsOrderSearchSet.html)

  ## Update (Acknowledge Message)

  This is used to acknowledge the message and is the original message sent back to the server with the source and destination reversed.

  ```
  PUT [base]/Bundle?identifier=[identifier]
  ```

  or

  Using a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction)

  ```
    POST [base]/
  ```

  ### Example

  ```
  PUT [base]/Bundle?identifier=9612365d-52a4-4fab-87e7-8a09d753f095
  ```

  """
  * conditionalUpdate = true

* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert InteractionWithExpectation(#create, #SHALL)
* insert SearchParamWithExpectation(message.receiver:identifier, #token, #SHALL)
* insert WithSearchParamDocumentation(The ODS code of the message recipient)
* insert SearchParamWithExpectation(_lastUpdated, #date, #SHALL)
* insert WithSearchParamDocumentation(The data the message was last updated)

* rest[=].interaction[+]
  * code = #transaction

* rest.operation[+]
  * name = "$process-message"
  * definition = Canonical(ProcessMessage)



* messaging[0]
  * supportedMessage[+]
    * mode = #receiver
    * definition = Canonical(laboratory-order)
  * supportedMessage[+]
    * mode = #sender
    * definition = Canonical(unsolicited-observation)
