Instance: SampleTypeSCTtoIGENE
InstanceOf: ConceptMap
Title: "Sample Type (SNOMED) to iGene Specimen Type"
Description: """
Sample Type (SNOMED) to iGene Specimen Type
"""
Usage:  #definition

* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/SampleTypeSCTtoIGENE"
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
  * code = #122556008 "Cord blood specimen"
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
    * code = #"SAMPLE: CSF"
    * equivalence = #equivalent


* group.element[+]
  * code = #119373006 "Amniotic fluid specimen"
  * target[+]
    * code = #"SAMPLE: AF"
    * equivalence = #equivalent

* group.element[+]
  * code = #309201001 "Ascitic fluid specimen"
  * target[+]
    * code = #"SAMPLE: Ascitic fluid"
    * equivalence = #equivalent

* group.element[+]
  * code = #258580003 "Whole blood specimen"
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent


* group.element[+]
  * code = #737357006 "Fetal blood specimen"
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent

* group.element[+]
  * code = #122555007 "Venous blood specimen"
  * target[+]
    * code = #"SAMPLE: BL"
    * equivalence = #equivalent

* group.element[+]
  * code = #440500007 "Dried blood spot specimen"
  * target[+]
    * code = #"SAMPLE: BSP"
    * equivalence = #equivalent

* group.element[+]
  * code = #119359002 "Bone marrow specimen"
  * target[+]
    * code = #"SAMPLE: BM"
    * equivalence = #equivalent

* group.element[+]
  * code = #733104004 "Swab from buccal mucosa"
  * target[+]
    * code = #"SAMPLE: BS"
    * equivalence = #equivalent

* group.element[+]
  * code = #258565009 "Chorionic villi specimen"
  * target[+]
    * code = #"SAMPLE: CVB"
    * equivalence = #equivalent

* group.element[+]
  * code = #702451000 "Cultured cells substance"
  * target[+]
    * code = #"SAMPLE: Cult Cells"
    * equivalence = #equivalent

* group.element[+]
  * code = #441652008 "Formalin-fixed paraffin-embedded tissue specimen"
  * target[+]
    * code = #"SAMPLE: FFPE-SL"
    * equivalence = #relatedto
  * target[+]
    * code = #"SAMPLE: FFPE-SH"
    * equivalence = #relatedto
  * target[+]
    * code = #"SAMPLE: FFPE-PCS"
    * equivalence = #relatedto

* group.element[+]
  * code = #3040001000004100 "Paraffin embedded tissue block specimen"
  * target[+]
    * code = #"SAMPLE: FFPE-WB"
    * equivalence = #equivalent

* group.element[+]
  * code = #122571007 "Pericardial fluid specimen"
  * target[+]
    * code = #"SAMPLE: PERICARDIAL FLUID"
    * equivalence = #equivalent

* group.element[+]
  * code = #418564007 "Pleural fluid specimen"
  * target[+]
    * code = #"SAMPLE: PLF"
    * equivalence = #equivalent




