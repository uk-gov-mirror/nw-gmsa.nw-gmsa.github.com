Instance: LaboratoryOrder
InstanceOf: ExampleScenario
Title:       "Laboratory Order Example"
Description: """

Structured Data Capture

"""
Usage: #definition

* status = #draft
* name = "Order Entry Template"


* insert ActorEntity(placer, "Order Placer",         [[The [Order Placer](ActorDefinition-OrderPlacer.html) Places, updates, cancels and nullifies orders. Receives acceptance or rejection from the Order Filler. Receives Order content and status changes from the Order Filler]])
* insert ActorEntity(filler, "Order Filler",         [[The [Order Filler](ActorDefinition-OrderFiller.html) Fulfils the Order. The Order Filler Actor is implemented by laboratory information management systems.]])


* process[+]
  * title = "Select Test Order Form"
  * description = "Select Test Order Form"
  * insert ProcessSearch(1, "Select Order Form", placer, filler,GenomicsOrderMessageCodedEntries, GenomicsOrderMessageReplyOk , [[  ]])

* process[+]
  * title = "Complete Test Order Form"
  * description = "Complete Test Order Form"
  * insert ProcessCreateEvent(1, "Create Form", placer, filler,GenomicsOrderMessageCodedEntries, GenomicsOrderMessageReplyOk , [[  ]])

* process[+]
  * title = "Collect Sample"
  * description = "Collect sample. Record Specimen details and procedure details if biopsy"
  * insert ProcessCreateEvent(1, "Create Form", placer, filler,GenomicsOrderMessageCodedEntries, GenomicsOrderMessageReplyOk , [[  ]])

* process[+]
  * title = "Send Order"
  * description = "Send the order"
  * insert ProcessCreateEvent(1, "Send Order", placer, filler,GenomicsOrderMessageCodedEntries, GenomicsOrderMessageReplyOk , [[  ]])
