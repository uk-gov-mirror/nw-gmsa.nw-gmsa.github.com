ValueSet: SpecimenType
Id: specimen-type
Title: "Specimen Type"
Description: """
A subset of [HL7 Europe Laboratory Report ValueSet: Specimen Types](https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-specimenType-eu-lab.html)
"""

* ^experimental  = false
* $sct#119297000 "Blood specimen"
* $sct#119373006 "Amniotic fluid specimen"
* $sct#309201001 "Ascitic fluid specimen"
* $sct#258580003 "Whole blood specimen"
* $sct#122552005 "Arterial blood specimen"
* $sct#122556008 "Cord blood specimen"
* $sct#737357006 "Fetal blood specimen"
* $sct#122555007 "Venous blood specimen"
* $sct#440500007 "Dried blood spot specimen"
* $sct#119359002 "Bone marrow specimen"
* $sct#733104004 "Swab from buccal mucosa"

* $sct#258450006 "Cerebrospinal fluid specimen"
* $sct#258565009 "Chorionic villi specimen"
// 30Apr25 * $NOS#ctDNA "ctDNA"
* $sct#702451000 "Cultured cells substance"
* $sct#309147000 "Thyroid cyst fluid specimen"
* $sct#258566005 "Deoxyribonucleic acid specimen"
* $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"

* $sct#3040001000004100	 "Paraffin embedded tissue block specimen"

* $sct#1003517007 "Freeze dried specimen"
* $sct#122571007 "Pericardial fluid specimen"
* $sct#418564007 "Pleural fluid specimen"
* $sct#119342007 "Saliva specimen"
// 30Apr25 * $NOS#StoredDNA "Stored DNA"
* $sct#441479001 "Fresh tissue specimen"
* $sct#16214131000119100 "Frozen tissue section specimen"
* $sct#122575003 "Urine specimen"
* $sct#441673008 "Ribonucleic acid specimen (specimen)"

* $igene#"SAMPLE: Cell Pellet" "Cell Pellet"
* $igene#"SAMPLE: Liquid Biopsy" "Liquid Biopsy"
* $igene#"SAMPLE: FFPE-SH" "FFPE - Shavings"
* $igene#"SAMPLE: FFPE-SL" "FFPE - Slides"
* $igene#"SAMPLE: FFPE-PCS" "FFPE - Positively Charged Slides"
* $igene#"SAMPLE: FFPE-WB" "FFPE - Wax block"

