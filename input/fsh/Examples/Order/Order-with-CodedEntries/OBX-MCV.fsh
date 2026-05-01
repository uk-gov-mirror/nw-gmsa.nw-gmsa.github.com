Instance: OBX-MCV
InstanceOf: Observation
Title: "MCV - Mean corpuscular volume"
Description: """
This is based on US Core [Example Observation: MCV Example](https://hl7.org/fhir/us/core/Observation-cbc-mcv.html) and incorporates extra coding from [NHS England Pathology - PATH-R4-10: Bundle Example - Full Blood Count Report](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/All-Profiles/Examples/Bundles/Full-Blood-Count-Report?version=0.1)

For coding descriptions see

- 1022491000000106 and 1491000237105 [SNOMED UK Edition](https://termbrowser.nhs.uk/?perspective=full&conceptId1=1022491000000106&edition=uk-edition&release=v20250312&server=https://termbrowser.nhs.uk/sct-browser-api/snomed&langRefset=999001261000000100,999000691000001104)
- 613061010000108 and 787-2 [SNOMED LOINC Edition](https://browser.loincsnomed.org/?perspective=full&conceptId1=613061010000108&edition=MAIN/LOINC/2025-03-21&release=&languages=en)
"""

* identifier[+].value = "4326e29b-0875-401c-8ed4-459ce1fa24f0"

* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #1022491000000106
    * display = "MCV - Mean corpuscular volume"
    * system = $sct
  * coding[+]
    * code = #1491000237105
    * display = "Erythrocytes MCV (mean corpuscular volume) in blood"
    * system = $sct
  * coding[+]
    * code = #613061010000108
    * display = "MCV [Entitic mean volume] in Red Blood Cells by Automated count"
    * system = $sct
  * coding[+]
    * code = #787-2
    * display = "MCV [Entitic mean volume] in Red Blood Cells by Automated count"
    * system = $loinc

* valueQuantity.value = 85
* valueQuantity.code = #fL
* valueQuantity.unit = "fL"
* valueQuantity.system = $ucum

* referenceRange[+]
  * low.value = 87.3
  * low.unit = #fL
  * low.system = $ucum
  * low.code = #fL
  * high.value = 82.4
  * high.unit = #fL
  * high.system = $ucum
  * high.code = #fL
  * type = http://terminology.hl7.org/CodeSystem/referencerange-meaning#normal "Normal Range"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


