Instance: SampleSCTtoIGENE
InstanceOf: ConceptMap
Title: "Sample Type (SNOMED) to iGene Specimen Type"
Description: """
Sample Type (SNOMED) to iGene Specimen Type
"""
Usage:  #definition

* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/SampleSCTtoIGENE"
* version = "0.0.1"
* status = #draft

* sourceCanonical = "https://fhir.nwgenomics.nhs.uk/ValueSet/specimen-type"

* group.source = "http://snomed.info/sct"
* group.sourceVersion = "http://snomed.info/sct/83821000000107"
* group.target = "https://fhir.nwgenomics.nhs.uk/CodeSystem/IGENE"

* group.element[+]
  * code = #119297000
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent

//* #"SAMPLE: Urine" "Urine"
//* #"SAMPLE: TC" "Tissue"
//* #"SAMPLE: SALIVA" "Saliva"
//* #"SAMPLE: PERICARDIAL FLUID" "Pericardial fluid"
//* #"SAMPLE: No sample received" "No Sample Received"
//* #"SAMPLE: Lyophilised cell pellet" "Lyophilised cell pellet"
//* #"SAMPLE: Cystic fluid" "Cystic fluid"
//* #"SAMPLE: CVB	Chorionic" "Villus Biopsy"
//* #"SAMPLE: Cult Cells" "Cultured Cells"
//* #"SAMPLE: CSF" "Cerebrospinal fluid"
//* #"SAMPLE: BSP" "Blood Spot"
//* #"SAMPLE: BS" "Buccal Swab"
//* #"SAMPLE: BM" "Bone Marrow"

//* #"SAMPLE: Ascitic fluid" "Ascitic Fluid"
//* #"SAMPLE: AF" "Amniotic Fluid"
//* #"Pl F" "Pleural fluid"


