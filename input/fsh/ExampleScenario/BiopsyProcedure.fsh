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
* insert ActorEntity(epr, "Electronic Patient Record",   [[TODO]])
* insert ActorEntity(patient, "Patient/relative/carer",   [[TODO]])
* insert ActorEntity(consultant, "Consultant",   [[TODO]])
* insert ActorEntity(laboratory, "Diagnostic Testing",   [[TODO]])


* process[+]
  * title = "Admission"
  * description = "Admit Patient"
  * insert ProcessSearch(1, "Select Admission Forms", nurse, forms, ,  , [[ This may be paper based.]])
  * insert ProcessCreateEvent(1, "Pre-populate Admission Forms",  forms, epr, ,  , [[ If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated. ]])
  * insert ProcessCreateEvent(1, "Complete Admission Forms. ", nurse, forms, ,  , [[This includes enquiring about the patients medical history, such as conditions and medications. This also includes taking the patient vital signs - device data may be automatically uploaded into the EPR. The end of this process is likely to be signalled via a HL7 v2 ADT Admission event. ]])

* process[+]
  * title = "Perform Biopsy"
  * description = "Perform Biopsy Procedure"
  * insert ProcessCreateEvent(1, "Document Procedure - Record procedure details", consultant, epr, ,  , [[  ]])
  * insert ProcessUpdate(1, "Document Procedure - Update specimen details", nurse, epr, ,  , [[ Ideally the updated specimen record should result in an update to the original order.  ]])
  * insert ProcessCreateEvent(1, "Send specimen", nurse, laboratory, ,  , [[ If the specimen is being sent via a courier, then the specimen record should be updated with a tracking id ]])


* process[+]
  * title = "Monitor and Discharge Patient"
  * description = "Monitor patient post procedure and Discharge Patient"
  * insert ProcessUpdate(1, "Monitor Patient - Update specimen details", nurse, epr, ,  , [[ This probably includes taking of vital signs to ensure the patient is stable ]])
  * insert ProcessUpdate(2, "Discharge Patient", nurse, epr, ,  , [[This includes a HL7 v2 ADT Discharge event and may include clinical notes]])
