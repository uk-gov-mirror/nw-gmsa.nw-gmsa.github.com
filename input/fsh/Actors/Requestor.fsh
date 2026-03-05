Instance:  Requestor
InstanceOf: ActorDefinition
Title:   "Requestor (ILW)"
Usage:  #definition

* name = "Requestor"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
The Actor ran by a private or hospital laboratory that subcontracts a part of an Order or of an Order Group to another laboratory. This actor may also be referred to as [Order Placer](ActorDefinition-OrderPlacer.html)
"""
* documentation = """
This Actor SHALL send the Sub-order to the Subcontractor and receive the results produced for this Sub-order
"""
