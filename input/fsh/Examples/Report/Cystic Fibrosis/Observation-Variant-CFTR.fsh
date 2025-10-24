Instance: bca547c1-78a5-41be-8cfc-03c05805ac85
InstanceOf: ObservationVariant
Title: "Variant - CFTR"
Description: "Based on HL7 LRI Example 2 (Ref 5.9.1.2)"

* identifier[+].value = "bca547c1-78a5-41be-8cfc-03c05805ac85"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #69548-6
    * display = "Genetic variant assessment"
    * system = $loinc


* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Manchester)
* subject.display = "Liam MANCHESTER"

//* method = $loinc#LA26398 "Sequencing"

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:1884 "CFTR"

* component[0].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_000492.3

* component[+].code = $loinc#81290-9 "Genomic DNA change (gHGVS)"
* component[=].valueCodeableConcept = $ghgvs#NC_000007.13

//* component[+].code = $loinc#48013-7 "Genomic reference sequence [ID]"
//* component[=].valueCodeableConcept = $refseq#NG_007109.2:g.40514dupC

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = $loinc#LA6692-3 "deletion"

* component[+].code = $loinc#48002-0 "Genomic source class"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"

* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6706-1 "Heterozygous"
