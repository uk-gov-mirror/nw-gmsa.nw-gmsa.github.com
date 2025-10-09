Instance: GenomicTestReportProcess
InstanceOf: ExampleScenario
Title:       "Genomic Test Report Process"
Description: """

This is for background information for genomic test reporting.
"""
Usage: #definition

* status = #draft
* name = "GenomicTestReport"

* insert ActorEntity(filler, "Order Filler",         [[ [Order Filler](ActorDefinition-OrderFiller.html) ]])
* insert ActorEntity(rie, "Regional Integration Engine",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
* insert ActorEntity(tie, "Trust Integration Engine",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(hie, "Health Information Exchange",   [[  [Intermediary](ActorDefinition-Intermediary.html) found in LHCRE/ICS ]])
* insert ActorEntity(cdr, "Clinical Data Repository",   [[ Clinical Data Repository ]])

* insert Instance_Empty(Request1,   Binary,   "HL7 v2 ORU_R01 - supplier",  [[ [iGene HL7 v2 ORU_R01](hl7v2.html#original-igene-message) ]])
* insert Instance_Empty(Request2,   Binary,   "HL7 v2 ORU_R01 - regional",  [[ [Regional HL7 v2 ORU_R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message-1) ]])
* insert Instance_Empty(Request3,   Binary,   "HL7 v2 ORU_R01 - supplier",  [[ ]])

* insert Instance_Empty(Request4,   Binary,   "Search for master Patient demographics record", [[Query for Patient: `GET https://example.nhs.uk/FHIR/R4/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552`]])

* insert Instance_Empty(Reply4,   Bundle,  "Search results", [[ ]])
* insert InstanceVersion(4, "Search Results", PDQSearchResults , )

* insert Instance_Empty(Request6,   Binary,   "HL7 v2 MDM_T02 - regional",  [[ [Regional Hl7 v2 MDM_T02](hl7v2.html#mdm_t02-original-document-notification-and-content-1) The format of the report is PDF, in future for England/EU document sharing the format may change to [HL7 EU Laboratory Report](https://hl7.eu/fhir/laboratory/) ]])

* insert Instance_Empty(Request6,   Bundle,   "HL7 FHIR Message R01 - regional",  [[ ]])
* insert InstanceVersion(6, "HL7 FHIR Message R01", GenomicsReportMessage , )

* process[+]
  * title = "Send Report to Order Placer"
  * preConditions = "Test Order has been received ([Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html)), specimen has been collected (e.g. [Biopsy Procedure](ExampleScenario-BiopsyProcedure.html)), has physically arrived and the test(s) have been performed"
  * description = "The report is sent from the LIMS using HL7 ORU_R01 and this is sent to the Order Placer/EPR via middleware"
  * insert ProcessCreateEvent(1, "Laboratory Report R01", filler, rie, Request1 ,   , [[TODO]])
  * insert ProcessCreateEvent(2, "Laboratory Report R01", rie, tie, Request2 ,   , [[TODO]])
  * insert ProcessCreateEvent(3, "Laboratory Report R01", tie, epr, Request3 ,   , [[TODO]])

* process[+]
  * title = "Send Report to ICS"
  * preConditions = "Patient has a NHS Number"
  * description = "The report to ICS HL7 MDM_T02. The ICS chosen is based on which general practice the patient is registered with"
  * insert ProcessSearch(4, "Patient Demographics Query", rie, cdr, Request4 , Reply4   , [[TODO]])
  * insert ProcessCreateEvent(5, "Laboratory Report T02", rie, hie, Request5,   , [[TODO]])

* process[+]
  * title = "Send Report to Regional Genomic CDR"
  * description = "The report is sent from the LIMS using HL7 ORU_R01 and this is sent to the Order Placer/EPR via middleware"
  * insert ProcessCreateEvent(6, "Laboratory Report R01", rie, cdr, Request6,   , [[TODO]])


Instance: PDQSearchResults
InstanceOf: Bundle
Title:       "Bundle - Patient Search Results PDQ"
Description: """
Example search results for a NHS Number of `9449305552`
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552]])
* insert EntryMatch(Patient, Patient-OctaviaCHISLETT-9449305552)
