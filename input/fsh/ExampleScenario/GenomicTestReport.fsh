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
* insert ActorEntity(rie, "Regional Integration Engine",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(tie, "Trust Integration Engine",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Intermediary](ActorDefinition-Intermediary.html) ]])
* insert ActorEntity(placer, "Order Placer",         [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(hie, "Health Information Exchange",   [[  [Intermediary](ActorDefinition-Intermediary.html) found in LHCRE/ICS ]])

* insert Instance_Empty(Request1,   Binary,   "HL7 v2 ORU_R01",  [[ ]])
* insert Instance_Empty(Request2,   Binary,   "HL7 v2 ORU_R01",  [[ ]])
* insert Instance_Empty(Request3,   Binary,   "HL7 v2 ORU_R01",  [[ ]])

* process[+]
  * title = "Send Report"
  * description = "The report is sent from the LIMS using HL7 ORU_R01 and this is sent to the Order Placer/EPR via middleware"
  * insert ProcessCreateEvent(1, "Order Send", filler, rie, Request1 ,   , [[TODO]])
  * insert ProcessCreateEvent(2, "Order Send", rie, tie, Request2 ,   , [[TODO]])
  * insert ProcessCreateEvent(3, "Order Send", tie, epr, Request3 ,   , [[TODO]])
