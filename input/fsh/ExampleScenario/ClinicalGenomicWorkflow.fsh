Instance: ClinicalAndGenomicWorkflow
InstanceOf: ExampleScenario
Title:       "Clinical and Genomic Workflow"
Description: """
Overview Clinical Workflow including Genomic Diagnostic Testing
"""
Usage: #definition

* status = #draft
* name = "ClinicalAndGenomicWorkflow"

* insert ActorEntity(diagnostics, "Genomic Diagnostic Testing",         [[TODO]])
* insert ActorEntity(cdr, "Regional - Genomic Data Repository",   [[ Clinical Data Repository ]])
* insert ActorEntity(consultant, "Consultant",   [[TODO]])
* insert ActorEntity(counsellor, "Genomic counsellor",   [[TODO]])

* insert Instance_Empty(Request1,   Observation,   "Variant",  [[ TODO ]])
* insert InstanceVersion(1, "Variant NTHL1", 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99 , )

* insert Instance_Empty(Request2,   Observation,   "Variant",  [[ TODO ]])
* insert InstanceVersion(2, "Diagnostic Implication Lynch syndrome", 6beb613f-d303-42af-b025-86e8e0872061 , )

* process[+]
  * title = "Create Diagnostic Testing Report"
  * description = "This step creates the [Genomics Test Report](Questionnaire-GenomicTestReport.html)"
  * preConditions = "Genomic Testing has Completed"
  * insert ProcessCreateEvent(1, "Variant is added to Genomic CDR", diagnostics, cdr, Request1 ,  , [[This step is performed by middleware - RIE]])
  * insert ProcessCreateEvent(2, "Diagnostic Implication is added to Genomic CDR", diagnostics, epr, Request2 ,  , [[This step is performed by middleware - RIE]])
