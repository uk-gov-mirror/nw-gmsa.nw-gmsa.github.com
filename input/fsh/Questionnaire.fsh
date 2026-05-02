Profile:        NWQuestionnaire
Parent:         http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Id:             NWQuestionnaire
Title:          "Questionnaire"
Description:    "`Data Capture` Initial elaboration extending SDC Questionnaire"

* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl named itemControl 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption named unitOption 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-unit named unit 0..*
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile named referenceProfile 0..1
* item.extension contains http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource named referenceResource 0..1
* item.extension contains http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-preferredTerminologyServer named preferredTerminologyServer 0..1
