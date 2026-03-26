Instance: GenomicTestReportProcess
InstanceOf: ExampleScenario
Title:       "Genomic Test Report Process"
Description: """

This is for background information for genomic test reporting.
"""
Usage: #definition

* status = #draft
* name = "Genomic Test Report"

* insert ActorEntity(filler, "Order Filler",         [[ [Order Filler](ActorDefinition-OrderFiller.html) ]])
* insert ActorEntity(rie, "Regional Orchestration Engine",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
* insert ActorEntity(tie, "Trust Integration Engine",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
//* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(epr, "Order Placer/Electronic Patient Record",   [[ NHS Trust [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(hie, "ICS - Health Information Exchange",   [[  [Intermediary](ActorDefinition-Intermediary.html) found in LHCRE/ICS ]])
* insert ActorEntity(cdr, "Regional - Genomic Data Repository",   [[ Clinical Data Repository ]])

* insert Instance_Empty(Request1,   Binary,   "HL7 v2 ORU_R01 - supplier",  [[ [iGene HL7 v2 ORU_R01](hl7v2.html#original-igene-message) ]])
* insert Instance_Empty(Request2,   Binary,   "HL7 v2 ORU_R01 - regional",  [[ [Regional HL7 v2 ORU_R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message-1) ]])
//* insert Instance_Empty(Request3,   Binary,   "HL7 v2 ORU_R01 - supplier",  [[ ]])
* insert Instance_Empty(Request7,   Binary,   "HL7 v2 ORU_R01 - supplier",  [[ ]])

* insert Instance_Empty(Request4,   Binary,   "Search for master Patient demographics record", [[Query for Patient: `GET https://example.nhs.uk/FHIR/R4/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552`]])

* insert Instance_Empty(Reply4,   Bundle,  "Search results", [[ ]])
* insert InstanceVersion(4, "Search Results", PDQSearchResults , )

* insert Instance_Empty(Request5,   Binary,   "HL7 v2 MDM_T02 - regional",  [[ [Regional Hl7 v2 MDM_T02](hl7v2.html#mdm_t02-original-document-notification-and-content-1) The format of the report is PDF, in future for England/EU document sharing the format may change to [HL7 EU Laboratory Report](https://hl7.eu/fhir/laboratory/) ]])


* insert Instance_Empty(Request6,   Bundle,   "HL7 FHIR Message R01 - regional",  [[ ]])
* insert InstanceVersion(6, "HL7 FHIR Message R01", GenomicsReportMessage , )

* process[+]
  * title = "Send Report to Order Placer"
  * preConditions = "Test Order has been received ([Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html)), specimen has been collected (e.g. [Biopsy Procedure](ExampleScenario-BiopsyProcedure.html)), has physically arrived and the test(s) have been performed"
  * description = "The report is sent from the LIMS using HL7 ORU_R01 and this is sent to the Order Placer/EPR via middleware"
  * insert ProcessCreateEvent(1, "Send Laboratory Report ORU_R01 v2", filler, rie, Request1 ,   , [[TODO]])
  * insert ProcessCreateEvent(2, "Send Laboratory Report ORU_R01 v2", rie, tie, Request2 ,   , [[Routes the report to NHS Trust which placed the order. At present the report will only be sent to regional NHS Trusts, in future this will include the NHS England Genomic Order Management Service to deliver reports to other NHS Trusts]])
 // * insert ProcessCreateEvent(3, "Send Laboratory Report ORU_R01 v2", tie, placer, Request3 ,   , [[TODO]])
  * insert ProcessCreateEvent(7, "Send Laboratory Report ORU_R01 v2", tie, epr, Request7 ,   , [[Routes the report to the Order Placer and/or EPR]])

* process[+]
  * title = "Send Report to ICS"
  * preConditions = "Patient has a NHS Number"
  * description = "The report to ICS HL7 MDM_T02. The report is routed to the ICS based on which general practice the patient is registered with"
  * insert ProcessSearch(4, "Patient Demographics Query", rie, cdr, Request4 , Reply4   , [[This is an internal API which includes use of NHS England Personal Demographics Service]])
  * insert ProcessCreateEvent(5, "Send Laboratory Report MDM_T02 v2", rie, hie, Request5,   , [[The report is routed to the ICS system which covers the Patients GP Surgery. For IHE XDS destinations this may include conversion to IHE ITI-41 ]])

* process[+]
  * title = "Send Report to Regional Genomic CDR"
  * description = "The report is sent to the regional Clinical Data Repository which shares the report using FHIR RESTful readonly APIs"
  * insert ProcessCreateEvent(6, "Send Laboratory Report R01 FHIR", rie, cdr, Request6,   , [[The v2 message is transformed to a FHIR Message]])



