Profile:        DocumentReference
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference
Id:             DocumentReference
Title:          "DocumentReference"
Description:    """
`Diagnostic` `IHE Europe` Reference: [IHE Europe Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf)
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* type from DocumentEntryType
* category from DocumentEntryClass

* content.attachment only NWAttachment

* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.event ^short = "The procedure or test code associated with the Accession Number (e.g. NICIP, Genomic Test Directory, etc.)"

* context.encounter 0..1 MS
* context.encounter only Reference(Encounter)
* context.encounter.identifier only HospitalProviderSpellIdentifier

* context.related 0..*

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "identifier.type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  OrderIdentifier 0..1 MS and OrderGroupNumber 0..1 MS and ReportIdentifier 0..1 MS

* context.related[OrderIdentifier] only Reference(ServiceRequest)
* context.related[OrderIdentifier].type 1..1 MS
* context.related[OrderIdentifier].type = "ServiceRequest"
* context.related[OrderIdentifier].identifier 1..1
* context.related[OrderIdentifier].identifier only OrderIdentifier

* context.related[OrderGroupNumber] only Reference(ServiceRequest)
* context.related[OrderGroupNumber].type 1..1 MS
* context.related[OrderGroupNumber].type = "ServiceRequest"
* context.related[OrderGroupNumber].identifier 1..1
* context.related[OrderGroupNumber].identifier only OrderGroupNumber

* context.related[ReportIdentifier] only Reference(DiagnosticReport)
* context.related[ReportIdentifier].type 1..1 MS
* context.related[ReportIdentifier].type = "DiagnosticReport"
* context.related[ReportIdentifier].identifier 1..1
* context.related[ReportIdentifier].identifier only ReportIdentifier

* context.sourcePatientInfo only Reference(Patient)
* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.period 0..1 MS

* subject 1..1
* subject only Reference(Patient)
* subject.identifier only NHSIdentifier

* author only Reference(Organization or Practitioner or PractitionerRole)
* author.identifier only PractitionerIdentifier or OrganisationCode

* custodian only Reference(Organization)
* custodian.identifier only OrganisationCode

* date 1..1 MS

