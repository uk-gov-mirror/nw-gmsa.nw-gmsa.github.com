Instance:  ClinicalDocument
InstanceOf: ActorDefinition
Title:   "Clinical Document"
Usage:  #definition

* name = "ClinicalDocument"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
From [ISO-13606](http://www.en13606.org/information.html) The set of information committed to one EHR as a result of a clinical encounter or a record documentation session. Examples of COMPOSITION are Progress note, Laboratory test result form, Radiology report, Referral letter, Clinic visit, Clinic letter, Discharge summary, Functional health assessment, Diabetes review.
"""
* documentation = """
Standards specific definitions:

- [HL7 FHIR Document](https://hl7.org/fhir/R4/documents.html)
- [HL7 v3 Clinical Document Architecture](https://en.wikipedia.org/wiki/Clinical_Document_Architecture)
- [openEHR](https://specifications.openehr.org/releases/RM/latest/ehr.html)

HL7 FHIR Document Standards for use with [Health Document Sharing](GACS.html):

- [HL7 International Patient Summary Implementation Guide](https://build.fhir.org/ig/HL7/fhir-ips/)
- [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/)
- [HL7 Europe Imaging Study Report](https://build.fhir.org/ig/hl7-eu/imaging/)
- [HL7 Europe Hospital Discharge Report](https://build.fhir.org/ig/hl7-eu/hdr/index.html)

"""
