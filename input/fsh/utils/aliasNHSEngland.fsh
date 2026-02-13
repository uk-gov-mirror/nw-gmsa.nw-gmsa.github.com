Alias: $nhs-number = https://fhir.nhs.uk/Id/nhs-number
Alias: $ods-code = https://fhir.nhs.uk/Id/ods-organization-code
Alias: $ucum = http://unitsofmeasure.org
Alias: $Obligation = http://hl7.org/fhir/StructureDefinition/obligation
Alias: $test-directory = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $bcp13 = urn:ietf:bcp:13
Alias: $nwgmsa = https://fhir.nwgenomics.nhs.uk/CodeSystem/NWGMSA
Alias: $MFTEPIC = https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds
Alias: $EthnicEngland = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryEngland
Alias: $EthnicWales = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryWales
Alias: $GTD = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $GSC = https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory
Alias: $GCC = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicClinicalIndication
Alias: $GTOC = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode
Alias: $genenames = http://www.genenames.org
Alias: $ghgvs = http://varnomen.hgvs.org
Alias: $refseq = http://www.ncbi.nlm.nih.gov/refseq
Alias: $OBSCAT = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $DIAGNOSTICSERVICE = http://terminology.hl7.org/CodeSystem/v2-0074


RuleSet: Obligation(code, actor)
* ^extension[$Obligation][+].extension[code].valueCode = {code}
* ^extension[$Obligation][=].extension[actor].valueCanonical = "{actor}"


RuleSet: ObligationServer(expectation, actor)
* rest.resource[=]
  * extension[+]
    * url = Canonical(http://hl7.org/fhir/StructureDefinition/obligation)
    * extension[+]
      * url = "code"
      * valueCode = {expectation}
    * extension[+]
      * url = "actor"
      * valueCode = {actor}
