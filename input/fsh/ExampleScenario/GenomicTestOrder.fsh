Instance: GenomicTestOrderProcess
InstanceOf: ExampleScenario
Title:       "Genomic Test Order Process including order entry and transmission of the order"
Description: """

This is for background information for genomic test ordering.
"""
Usage: #definition

* status = #draft
* name = "GenomicTestOrder"

* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(forms, "Form Manager",   [[This may be part of the EPR or be paper based]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(tie, "Trust Integration Engine",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(rie, "Regional Integration Engine",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(filler, "Order Filler",         [[ [Order Filler](ActorDefinition-OrderFiller.html) ]])

* insert Instance_Empty(Request1,   Binary,   "Search for Order Genomic Test Order Form", [[Query for Froms: `GET https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder`]])

* insert Instance_Empty(Reply1,   Bundle,   "Search results", [[ ]])
* insert InstanceVersion(1, "Search Results", SDCSearchResults , )

* insert Instance_Empty(Request2,   Binary,   "Pre-Populate form request",  [[ ]])
* insert Instance_Empty(Request4,   QuestionnaireResponse,   "Completed Form", [[ ]])
* insert Instance_Empty(Request5,   Binary,   "HL7 v2 ORM_O01",  [[ ]])

* insert Instance_Empty(Request6,   Bundle,   "HL7 FHIR Message O21",  [[ This is equivalent to HL7 v2.5 OML_O21, it may be advisable to use this message in the previous step to reduce transforms. ]])
* insert InstanceVersion(6, "HL7 FHIR Message O21", GenomicsOrderMessageCodedEntries , )

* insert Instance_Empty(Request7,   Binary,   "HL7 v2 ORM_O01",  [[ ]])

* insert Instance_Empty(Request8,   Binary,   "Collect Sample",  [[ ]])

* process[+]
  * title = "Complete Test Order Form"
  * description = "Creates Test Order Form"
  * insert ProcessSearch(1, "Select Order Form", placer, forms, Request1 , Reply1 , [[This may be part of the EPR and not implemented in HL7 FHIR. If not using FHIR, the clinical coding and valuesets in the FHIR Questionnaire should be implemented in the EPR Order Form]])
  * insert ProcessCreateEvent(2, "Pre-populate Order Form", forms, epr, Request2 ,  , [[If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated ]])
  * insert ProcessCreateEvent(4, "Complete Order Form. ", placer, epr, Request4,   , [[Enter answers to questions in the forms. The end of this process is likely to be signalled via a **IHE Patient Administration** HL7 v2 ADT Admission event. ]])

* process[+]
  * title = "Send Order"
  * description = "The order is sent from the EPR using HL7 ORM_O21 and this is sent to the Order Filler/Laboratory Information Management System (LIMS) via middleware"
  * insert ProcessCreateEvent(5, "Order Send", epr, tie, Request5 ,   , [[TODO]])
  * insert ProcessCreateEvent(6, "Order Send", tie, rie, Request6 ,   , [[TODO]])
  * insert ProcessCreateEvent(7, "Order Send", rie, filler, Request7 ,   , [[TODO]])

* process[+]
  * title = "Optional - Collect Specimen"
  * description = "For an example process see [ExampleScenario: Biopsy Procedure](ExampleScenario-GenomicTestOrderProcess.html)"
  * insert ProcessWorkflow(BiopsyProcedure)

* process[+]
  * title = "Perform Tests"
  * description = "For an example process see [ExampleScenario: Biopsy Procedure](ExampleScenario-GenomicTestOrderProcess.html)"
  * insert ProcessCreateEvent(8, "Collect sample", rie, filler, Request8 ,   , [[ See Biopsy and Blood scenarios for more details ]])
// code is correct but causes plantuml error
//  * insert ProcessWorkflow(BiopsyProcedure)

Instance: SDCSearchResults
InstanceOf: Bundle
Title:       "Bundle - Form Search Results SDC"
Description: """
Example search results for a form with id of ``
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder]])
* insert EntryMatch(Questionnaire, GenomicTestOrder)

