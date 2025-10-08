Instance: BiopsyProcedure
InstanceOf: ExampleScenario
Title:       "Biopsy Procedure for obtaining a specimen, part of a diagnostic pathway. Day case admission."
Description: """

This is for background information around the specimen collection process, it is not considered part of this genomic specification.
"""
Usage: #definition

* status = #draft
* name = "Biopsy Procedure"

* insert ActorEntity(nurse, "Nurse",         [[TODO]])
* insert ActorEntity(forms, "Form Manager",   [[This may be part of the EPR or be paper based]])
* insert ActorEntity(epr, "Electronic Patient Record",   [[ [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(patient, "Patient/relative/carer",   [[TODO]])
* insert ActorEntity(consultant, "Consultant",   [[TODO]])
* insert ActorEntity(laboratory, "Diagnostic Testing",   [[TODO]])

* insert Instance_Empty(Request1,   Binary,   "Dummy", [[Query for Froms: `GET https://example.nhs.uk/FHIR/R4/Questionnaire`]])
* insert Instance_Empty(Request2,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Request3,   Binary,   "Dummy", [[ ]])
* insert Instance_Empty(Request4,   Binary,   "Dummy", [[ ]])

* insert Instance_Empty(Reply1,   Binary,   "Dummy", [[ ]])
//* insert Instance_Empty(Reply2a,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Reply3,   Binary,   "Dummy", [[ ]])
//* insert Instance_Empty(Reply4,   Binary,   "Dummy", [[ ]])

* insert Instance_Empty(Request5,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Request6,   Binary,   "Dummy", [[ ]])
* insert Instance_Empty(Request7,   Binary,   "Dummy", [[ ]])
* insert Instance_Empty(Reply5,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Reply6,   Binary,   "Dummy", [[ ]])
* insert Instance_Empty(Reply7,   Binary,   "Dummy", [[ ]])

* insert Instance_Empty(Request8,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Request9,   Binary,   "Dummy", [[ ]])

* insert Instance_Empty(Reply8,   Binary,   "Dummy",  [[ ]])
* insert Instance_Empty(Reply9,   Binary,   "Dummy", [[ ]])

* process[+]
  * title = "Admission"
  * description = "Admit Patient. The process roughly follows [FHIR Structured Data Capture](https://build.fhir.org/ig/HL7/sdc)"
  * preConditions = "Test Order has been created ([Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html))"
  * insert ProcessSearch(1, "Select Admission Forms", nurse, forms,Request1 , Reply1 , [[This may be paper based]])
  * insert ProcessCreateEvent(2, "Pre-populate Admission Form", forms, epr, Request2 ,  , [[If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated ]])
  * insert ProcessRead(3, "Complete Admission Form. ", nurse, patient, Request3 , Reply3 , [[This includes enquiring about the patients medical history, such as conditions and medications. This also includes taking the patient vital signs - device data may be automatically uploaded into the EPR. ]])
  * insert ProcessCreateEvent(4, "Complete Admission Form. ", nurse, forms, Request4,   , [[Enter answers to questions in the forms. The end of this process is likely to be signalled via a **IHE Patient Administration** HL7 v2 ADT Admission event. ]])

* process[+]
  * title = "Perform Biopsy"
  * description = "Perform Biopsy Procedure"
  * insert ProcessCreateEvent(5, "Document Procedure - Record procedure details", consultant, epr, Request5 ,   , [[TODO]])
  * insert ProcessUpdate(6, "Document Procedure - Update specimen details", nurse, epr,Request6 , , [[Ideally the updated specimen record should result in an update to the original order.  ]])
  * insert ProcessCreateEvent(7, "Send specimen", nurse, laboratory, Request7 ,  , [[If the specimen is being sent via a courier, then the specimen record should be updated with a tracking id ]])


* process[+]
  * title = "Monitor and Discharge Patient"
  * description = "Monitor patient post procedure and Discharge Patient"
  * insert ProcessUpdate(8, "Monitor Patient - Update specimen details", nurse, epr, Request8,  , [[This probably includes taking of vital signs to ensure the patient is stable ]])
  * insert ProcessUpdate(9, "Discharge Patient", nurse, epr,Request9 ,  , [[This includes a **IHE Patient Administration** - HL7 v2 ADT Discharge event and may include clinical notes]])

