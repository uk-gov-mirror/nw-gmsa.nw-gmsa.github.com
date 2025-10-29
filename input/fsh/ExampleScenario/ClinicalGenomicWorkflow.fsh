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
* insert ActorEntity(counsellor, "Genomic counsellor",   [[TODO]])
* insert ActorEntity(cdr, "Regional - Genomic Data Repository",   [[ Clinical Data Repository ]])

* insert ActorEntity(consultant, "Consultant",   [[TODO]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])

* insert Instance_Empty(Request1,   Observation,   "Variant",  [[ TODO ]])
* insert InstanceVersion(1, "Variant NTHL1", 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99 , )

* insert Instance_Empty(Request2,   Observation,   "Diagnostic Implication",  [[ TODO ]])
* insert InstanceVersion(2, "Diagnostic Implication Lynch syndrome", 6beb613f-d303-42af-b025-86e8e0872061 , )

* insert Instance_Empty(Request3,   Condition,   "Condition",  [[ TODO ]])
* insert InstanceVersion(3, "Condition Lynch syndrome", c8f82825-e4cb-4e1f-b728-3fd2808e93db , )

* insert Instance_Empty(Request4,   FamilyMemberHistory,   "FamilyMemberHistory Son",  [[ TODO ]])
* insert InstanceVersion(4, "FamilyMemberHistory Ricky LEEDS", 074ea905-8d91-452c-af3c-15b5b860fdb2 , )

* insert Instance_Empty(Request5,  FamilyMemberHistory,   "FamilyMemberHistory Mother",  [[ TODO ]])
* insert InstanceVersion(5, "FamilyMemberHistory Sarah-Jane NOTTINGHAM", c76b8bc2-ec36-4ce1-a2ea-8c57215115e2 , )

* process[+]
  * title = "Create Diagnostic Testing Report"
  * description = "This step creates the [Genomics Test Report](Questionnaire-GenomicTestReport.html)"
  * preConditions = "Genomic Testing has Completed"
  * insert ProcessCreateEvent(1, "Variant NTHL1 is added to Genomic CDR", diagnostics, cdr, Request1 ,  , [[This step is performed by middleware - RIE]])
  * insert ProcessCreateEvent(2, "Diagnostic Implication Lynch Syndrome is added to Genomic CDR", diagnostics, cdr, Request2 ,  , [[This step is performed by middleware - RIE]])

* process[+]
  * title = "Review Diagnostic Testing Report"
  * description = "This step reviews the [Genomics Test Report](Questionnaire-GenomicTestReport.html)"
  * preConditions = "Genomic Testing Received has been received"
  * insert ProcessCreateEvent(3, "Condition Lynch Syndrome is added to Acute or Primary Care EPR", consultant, epr, Request3 ,  , [[This step is assumed to be a manual entry]])

* process[+]
  * title = "Perform Genomic Counselling"
  * description = "This step acts on the [Genomics Test Report](Questionnaire-GenomicTestReport.html)"
  * preConditions = "A Task has been received to perform Genomic Counselling"
  * insert ProcessCreateEvent(4, "Family History for Son Leeds is added to Genomic CDR ", counsellor, cdr, Request4 ,  , [[Probably Gen-O]])
  * insert ProcessCreateEvent(5, "Family History for Mother Nottingham is added to Genomic CDR", counsellor, cdr, Request5 ,  , [[Probably Gen-O]])
