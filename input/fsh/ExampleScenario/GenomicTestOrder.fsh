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
* insert Instance_Empty(Request5,   Binary,   "HL7 v2 ORM_O01 - supplier",  [[ ]])

* insert Instance_Empty(Request6,   Bundle,   "HL7 FHIR Message O21 - regional",  [[ This is equivalent to HL7 v2.5 OML_O21, it may be advisable to use this message in the previous step to reduce transforms. ]])
* insert InstanceVersion(6, "HL7 FHIR Message O21", GenomicsOrderMessageCodedEntries , )

* insert Instance_Empty(Request7,   Binary,   "HL7 v2 OML_O21 - regional",  [[ [Regional HL7 v2 OML_O21](hl7v2.html#oml_o21-laboratory-order-1) ]])

* insert Instance_Empty(Request8,   Binary,   "Collect Sample",  [[ ]])

* insert Instance_Empty(Request9,   Bundle,   "HL7 FHIR Message O21 - regional",  [[ TODO ]])
* insert InstanceVersion(9, "HL7 FHIR Message O21", GenomicsOrderMessageCodedEntries , )

* process[+]
  * title = "Complete Genomic Test Order Form"
  * description = "Creates Test Order Form. For methods of automating this process such as using a forms based application see [HL7 Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/), in most cases this will be part of the EPR"
  * insert ProcessSearch(1, "Select Genomic Test Order Form", placer, forms, Request1 , Reply1 , [[This may be part of the EPR and not implemented in HL7 FHIR. If not using FHIR, the clinical coding and valuesets in the FHIR Questionnaire should be implemented in the EPR Order Form]])
  * insert ProcessCreateEvent(2, "Pre-populate Order Form", forms, epr, Request2 ,  , [[If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated ]])
  * insert ProcessCreateEvent(4, "Complete Genomic Test Order Form. ", placer, epr, Request4,   , [[Enter answers to questions in the forms. The end of this process is likely to be signalled via a **IHE Patient Administration** HL7 v2 ADT Admission event. ]])

* process[+]
  * title = "Submit Genomic Test Order Form"
  * description = "The order is sent from the EPR using HL7 ORM_O21 and this is sent to the Order Filler/Laboratory Information Management System (LIMS) via middleware"
  * insert ProcessCreateEvent(5, "Send Laboratory Order O01 v2", epr, tie, Request5 ,   , [[In NHS Trusts will this will often be HL7 v2 ORM_O01 from the EPR, the region is using HL7 v2/FHIR OML_O21 which may involve some message transformation especially around v2 SPM/FHIR Specimen. Note: the region is using a common (canonical) data model for both v2 and FHIR. Most coded questions and answer should be be supplied in v2 OBX segments which have a simple transform to FHIR Observations.]])
  * insert ProcessCreateEvent(6, "Send Laboratory Order O21 FHIR", tie, rie, Request6 ,   , [[Message routing is done using the FHIR Message, this is where future routing to other GMSA/GLH will be performed using the NHS England Genomic Order Management Service.]])
  * insert ProcessCreateEvent(7, "Send Laboratory Order O21 v2", rie, filler, Request7 ,   , [[The FHIR Message is transformed by the RIE into a v2 Message]])

* process[+]
  * title = "Send Order to Regional Genomic CDR"
  * description = "The order is sent to the regional Clinical Data Repository which shares the order using FHIR RESTful readonly APIs"
  * insert ProcessCreateEvent(9, "Send Laboratory Order O21 FHIR", rie, cdr, Request9,   , [[TODO]])

* process[+]
  * title = "Collect Sample"
  * description = "This process is not required if the sample has already been collected (and this is a reflex order). For an example process see [ExampleScenario: Biopsy Procedure](ExampleScenario-BiopsyProcedure.html)."
// code is correct but causes plantuml error
//  * insert ProcessWorkflow(BiopsyProcedure)
  * insert ProcessCreateEvent(8, "Collect sample", rie, filler, Request8 ,   , [[ See Biopsy and Blood scenarios for more details ]])

* process[+]
  * title = "Perform Genomic Tests"
  * description = "See [ExampleScenario: Genomic Report Process](ExampleScenario-GenomicTestReportProcess.html)"

//  * insert ProcessWorkflow(GenomicTestReportProcess)

Instance: SDCSearchResults
InstanceOf: Bundle
Title:       "Bundle - Form Search Results SDC"
Description: """
Example search results for a form with id of ``
"""
Usage: #example
* insert SearchBundle(1, [[https://example.nhs.uk/FHIR/R4/Questionnaire?id=GenomicTestOrder]])
* insert EntryMatch(Questionnaire, GenomicTestOrder)

