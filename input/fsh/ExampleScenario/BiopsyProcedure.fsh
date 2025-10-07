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
  * title = "Select Admission Form"
  * description = "Select the Admission Forms"
  * insert ProcessSearch(1, "Select Admission Forms", nurse, forms, ,  , [[ This may be paper based. If using EPR, this could be prepopulated from the EPR and/or Primary Care record ]])

* process[+]
  * title = "Prepopulate Admission Forms"
  * description = "Prepopulate Admission Form and take vital signs"
  * insert ProcessCreateEvent(1, "Prepopulate Admission Forms",  forms, epr, ,  , [[  ]])

* process[+]
  * title = "Complete Admission Forms"
  * description = "Complete Admission Form"
  * insert ProcessCreateEvent(1, "Complete Admission Forms. This includes a HL7 v2 ADT Admission event", nurse, forms, ,  , [[  ]])

* process[+]
  * title = "Perform Procedure"
  * description = "Perform Procedure"
  * insert ProcessCreateEvent(1, "Record procedure", consultant, epr, ,  , [[  ]])

* process[+]
  * title = "Update Order"
  * description = "Update specimen details"
  * insert ProcessUpdate(1, "Update specimen details", nurse, epr, ,  , [[  ]])

* process[+]
  * title = "Send Specimen"
  * description = "Send Specimen, physically not electronic"
  * insert ProcessCreateEvent(1, "Send specimen", nurse, epr, ,  , [[  ]])

* process[+]
  * title = "Monitor Patient on the day case ward"
  * description = "Take observations such as vital signs, patient is monitored to ensure they are ok to discharge."
  * insert ProcessUpdate(1, "Update specimen details", nurse, epr, ,  , [[  ]])

* process[+]
  * title = "Discharge Patient"
  * description = "Discharge Patient"
  * insert ProcessUpdate(1, "This includes a HL7 v2 ADT Discharge event", nurse, epr, ,  , [[  ]])
