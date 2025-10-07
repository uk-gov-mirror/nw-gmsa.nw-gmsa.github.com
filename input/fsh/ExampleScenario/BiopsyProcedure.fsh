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
  * step[+]
    * process[+]
      * title = "Select Admission Form"
      * description = "Select the Admission Forms"
      * insert ProcessSearch(1, "Select Admission Forms", nurse, forms, ,  , [[ This may be paper based.]])
  * step[+]
    * process[+]
      * title = "Prepopulate Admission Forms"
      * description = "Prepopulate Admission Form"
      * insert ProcessCreateEvent(1, "Pre-populate Admission Forms",  forms, epr, ,  , [[ If using electronic forms and their is a connection to an EPR or Health Information Exchange - the forms may be pre-populated. ]])
  * step[+]
    * process[+]
      * title = "Complete Admission Forms"
      * description = "Complete Admission Form and Admit patient"
      * insert ProcessCreateEvent(1, "Complete Admission Forms. ", nurse, forms, ,  , [[This includes enquiring about the patients medical history, such as conditions and medications. This also includes taking the patient vital signs. The end of this process is likely to be siganlled via a HL7 v2 ADT Admission event. ]])

* process[+]
  * title = "Perform and Document Procedure"
  * description = "Document Procedure - Perform Procedure"
  * insert ProcessCreateEvent(1, "Document Procedure - Record procedure details", consultant, epr, ,  , [[  ]])

* process[+]
  * title = "Update Order"
  * description = "Document Procedure - Update specimen details"
  * insert ProcessUpdate(1, "Document Procedure - Update specimen details", nurse, epr, ,  , [[ Ideally the updated specimen record should result in an update to the original order.  ]])

* process[+]
  * title = "Send Specimen - physically not electronic"
  * description = "Send Specimen"
  * insert ProcessCreateEvent(1, "Send specimen", nurse, laboratory, ,  , [[ If the specimen is being sent via a courier, then the specimen record should be updated with a tracking id ]])

* process[+]
  * title = "Monitor Patient on the day case ward"
  * description = "Take observations such as vital signs, patient is monitored to ensure they are ok to discharge."
  * insert ProcessUpdate(1, "Monitor Patient - Update specimen details", nurse, epr, ,  , [[ This probably includes taking of vital signs to ensure the patient is stable ]])

* process[+]
  * title = "Discharge Patient"
  * description = "Discharge Patient"
  * insert ProcessUpdate(1, "Discharge Patient", nurse, epr, ,  , [[This includes a HL7 v2 ADT Discharge event and may include clinical notes]])
