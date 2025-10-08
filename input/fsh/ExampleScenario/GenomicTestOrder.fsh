Instance: BiopsyProcedure
InstanceOf: ExampleScenario
Title:       "Biopsy Procedure for obtaining a specimen, part of a diagnostic pathway. Day case admission."
Description: """

This is for background information around the specimen collection process, it is not considered part of this genomic specification.
"""
Usage: #definition

* status = #draft
* name = "Biopsy Procedure"

* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(forms, "Form Manager",   [[This may be part of the EPR or be paper based]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(filler, "Order Filler",         [[ [Order Filler](ActorDefinition-OrderFiller.html) ]])

* insert Instance_Empty(Request1,   Binary,   "Dummy", [[Query for Froms: `GET https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder`]])
* insert Instance_Empty(Reply1,   Bundle,   "Search results", [[ ]])
* insert InstanceVersion(1, "Search Results", SDCSearchResults , )
* insert Instance_Empty(Request2,   Binary,   "Dummy",  [[ ]])

* process[+]
  * title = "Complete Test Order Form"
  * description = "Creates Test Order Form"
  * insert ProcessSearch(1, "Select Order Form", placer, forms, Request1 , Reply1 , [[This may be paper based]])
  * insert ProcessCreateEvent(2, "Pre-populate Admission Forms", forms, epr, Request2 ,  , [[If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated ]])

Instance: SDCSearchResults
InstanceOf: Bundle
Title:       "Bundle - Form Search Results SDC"
Description: """
Example search results for a form with id of ``
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder]])
* insert EntryMatch(Questionnaire, NWQuestionnaire)

