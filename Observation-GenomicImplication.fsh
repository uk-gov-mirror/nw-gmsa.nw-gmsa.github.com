Profile:        ObservationGenomicImplication
Parent:         Observation
Id:             Observation-GenomicImplication
Title:          "Observation Genomic Implication"
Description:    """
`Genomic Observation` Placeholder for [Genomic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html)
"""

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"

* derivedFrom 1..*
* derivedFrom contains variant 0..* and
    genotype 0..* and
    haplotype 0..* and
    biomarker 0..*
* derivedFrom[variant] only Reference(Variant)
* derivedFrom[variant] ^short = "Variant the implication is derived from"
* derivedFrom[genotype] only Reference(Genotype)
* derivedFrom[genotype] ^short = "Genotype the implication is derived from"
* derivedFrom[haplotype] only Reference(Haplotype)
* derivedFrom[haplotype] ^short = "Haplotype the implication is derived from"
* derivedFrom[biomarker] only Reference(MolecularBiomarker)
* derivedFrom[biomarker] ^short = "MolecularBiomarker the implication is derived from"

* component contains
    evidence-level 0..* and
    clinical-significance 0..1 and
	knowledge-base 0..1 and
	annotation-pipeline 0..1
* component[evidence-level].code = $LNC#93044-6
* component[evidence-level].code ^short = "93044-6"
* component[evidence-level] ^short = "Level of Evidence"
* component[evidence-level] ^definition = "The amount of observed support for the association between an implication and a variant / haplotype / genotype / biomarker. There are dozens if not hundreds of evidence-level value sets, generally providing an ordinal range of codes from low evidence (e.g. 'predicted', 'case report', '1-star') to high evidence (e.g. 'professional society guideline', 'expert panel consensus', '1A')."
* component[evidence-level].value[x] only CodeableConcept
* component[evidence-level].value[x] 1..1
* component[evidence-level].value[x] from EvidenceLevelExampleVS (example)
* component[evidence-level].value[x] ^binding.description = "PharmGKB or ClinVar"
* component[evidence-level].value[x] ^short = "1A | 1B | 2A | 2B | 3 | 4 | 4-star | 3-star | 2-star | 1-star | no-star"

* component[clinical-significance] ^short = "Clinical significance"
* component[clinical-significance] ^definition = "The clinical impact of an implication on a person's health. There are dozens if not hundreds of clinical-significance value sets, generally providing an ordinal range of codes from low significance (e.g. 'benign') to high significance (e.g. 'pathogenic', 'oncogenic','predictive of drug response')."
* component[clinical-significance].code = $LNC#53037-8
* component[clinical-significance].code ^short = "53037-8"
* component[clinical-significance].value[x] only CodeableConcept
* component[clinical-significance].value[x] 1..1
* component[clinical-significance].value[x] from http://loinc.org/vs/LL4034-6 (example)
* component[clinical-significance].value[x] ^short = "Pathogenic | Likely pathogenic | Uncertain significance | Likely benign | Benign"

* component[knowledge-base] ^short = "Knowledge Base"
* component[knowledge-base] ^definition = "The database from which the annotation is derived"
* component[knowledge-base].code = TbdCodesCS#knowledge-base
* component[knowledge-base].code ^short = "knowledge-base"
* component[knowledge-base].value[x] only CodeableConcept
* component[knowledge-base].value[x] 1..1
* component[knowledge-base].value[x] from KnowledgeBaseVersionVS (example)

* component[annotation-pipeline] ^short = "Annotation Pipeline"
* component[annotation-pipeline] ^definition = "The name of the data pipeline that processed the genomic data file"
* component[annotation-pipeline].code = TbdCodesCS#annotation-pipeline
* component[annotation-pipeline].code ^short = "annotation-pipeline"
* component[annotation-pipeline].value[x] only CodeableConcept
* component[annotation-pipeline].value[x] 1..1

