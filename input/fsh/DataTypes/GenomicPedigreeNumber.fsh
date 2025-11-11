Profile:        GenomicsPedigreeNumber
Parent:         CorrelationIdentifier
Id:             GenomicsPedigreeNumber
Title:          "Genomics Pedigree Number"
Description:     """
`Patient Administration`
"""

* ^purpose = """
## Mapping

- **NHS Data Model and Dictionary** nil, see also [Medical Record Number](StructureDefinition-MedicalRecordNumber.html)
- **HL7 FHIR** Patient.identifier
- **HL7 v2** Patient Identifier List (PID-3)

| Standard | Data Type | Value |
|----------|-------|-------|
| NHS Data Dictionary | | - |

"""

* type = $v2-0203#MR (exactly)
* system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code



