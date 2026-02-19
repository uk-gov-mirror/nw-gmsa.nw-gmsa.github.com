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
  * code = #119297000 "Blood specimen"
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent

* group.element[+]
  * code = #122575003 "Urine specimen"
  * target[+]
    * code = #"SAMPLE: Urine"
    * equivalence = #equivalent

* group.element[+]
  * code = #441479001 "Fresh tissue specimen"
  * target[+]
    * code = #"SAMPLE: TC"
    * equivalence = #equivalent

* group.element[+]
  * code = #16214131000119100 "Frozen tissue section specimen"
  * target[+]
    * code = #"SAMPLE: TC"
    * equivalence = #equivalent

* group.element[+]
  * code = #119342007 "Saliva specimen"
  * target[+]
    * code = #"SAMPLE: SALIVA"
    * equivalence = #equivalent

* group.element[+]
  * code = #309147000 "Thyroid cyst fluid specimen"
  * target[+]
    * code = #"SAMPLE: Cystic fluid"
    * equivalence = #equivalent

* group.element[+]
  * code = #258450006 "Cerebrospinal fluid specimen"
  * target[+]
    * code = #"SAMPLE: Cystic fluid"
    * equivalence = #equivalent



//* #"SAMPLE: PERICARDIAL FLUID" "Pericardial fluid"
//* #"SAMPLE: No sample received" "No Sample Received"
//* #"SAMPLE: Lyophilised cell pellet" "Lyophilised cell pellet"
//* #"Cystic fluid"
//* #"SAMPLE: CVB	Chorionic" "Villus Biopsy"
//* #"SAMPLE: Cult Cells" "Cultured Cells"
//* #"SAMPLE: CSF" "Cerebrospinal fluid"
//* #"SAMPLE: BSP" "Blood Spot"
//* #"SAMPLE: BS" "Buccal Swab"
//* #"SAMPLE: BM" "Bone Marrow"

//* #"SAMPLE: Ascitic fluid" "Ascitic Fluid"
//* #"SAMPLE: AF" "Amniotic Fluid"
//* #"Pl F" "Pleural fluid"


