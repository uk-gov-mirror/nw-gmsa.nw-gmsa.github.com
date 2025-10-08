Instance: GenomicTestOrderProcess
InstanceOf: ExampleScenario
Title:       "Biopsy Procedure for obtaining a specimen, part of a diagnostic pathway. Day case admission."
Description: """

This is for background information for genomic test ordering.
"""
Usage: #definition

* status = #draft
* name = "GenomicTestOrder"

* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(forms, "Form Manager",   [[This may be part of the EPR or be paper based]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(filler, "Order Filler",         [[ [Order Filler](ActorDefinition-OrderFiller.html) ]])

* insert Instance_Empty(Request1,   Binary,   "Search for Order Genomic Test Order Form", [[Query for Froms: `GET https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder`]])
* insert Instance_Empty(Reply1,   Bundle,   "Search results", [[ ]])
* insert InstanceVersion(1, "Search Results", SDCSearchResults , )
* insert Instance_Empty(Request2,   Binary,   "Pre-Populate form request",  [[ ]])
* insert Instance_Empty(Request4,   QuestionnaireResponse,   "Completed Form", [[ ]])

* process[+]
  * title = "Complete Test Order Form"
  * description = "Creates Test Order Form"
  * insert ProcessSearch(1, "Select Order Form", placer, forms, Request1 , Reply1 , [[This may be paper based]])
  * insert ProcessCreateEvent(2, "Pre-populate Admission Forms", forms, epr, Request2 ,  , [[If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated ]])
  * insert ProcessCreateEvent(4, "Complete Admission Forms. ", nurse, forms, Request4,   , [[Enter answers to questions in the forms. The end of this process is likely to be signalled via a **IHE Patient Administration** HL7 v2 ADT Admission event. ]])

Instance: SDCSearchResults
InstanceOf: Bundle
Title:       "Bundle - Form Search Results SDC"
Description: """
Example search results for a form with id of ``
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder]])
* insert EntryMatch(Questionnaire, GenomicTestOrder)

