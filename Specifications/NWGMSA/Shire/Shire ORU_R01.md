Please see the attached sample ORU message from Shire to Rhapsody.
It follows the standard HL7 protocol for version 2.3.1. It sends the message in the text format inside the OBX segments.

# MSH Segment

- MSH-3: Always set to SHIRE. 
  - The NHS number should appear in PID-3-1 when the corresponding PID-3-5 repeat is set to "PATNUMBER". In the example message I shared this morning, 1234567890 represents the NHS number. 
  - We typically include the hospital number in the second repeat of PID-3-1, with PID-3-5 set to "ALTNUMBER". However, you may want to confirm the specifics with Mike Green for further detail. 
- MSH-4: Always set to CPP
- MSH-5 & MSH-6: Always set to HODS
- MSH-7-1: Date/time of message
- MSH-9: Message type
- MSH-10: Message identifier
- MSH-12-1-1: Version ID field

# PID Segment

- PID-3-1: Patient number
- PID-3-5: Patient number type
- PID-5-1: Surname ^ Firstname
- PID-5-5: Title
- PID-7-1: Date of Birth
- PID-8: Sex
- PID-11-1: Address
- PID-11-3: City
- PID-11-4: State
- PID-11-5: Postcode

# OBR Segment

- OBR-7-1: Report date
- OBR-20: Shire identifier
- OBR-32-1: Microscopy done by identifier
- OBR-34-1: Report signed by

# OBX Segment

Represents a text report, one line of text per OBX segment.
