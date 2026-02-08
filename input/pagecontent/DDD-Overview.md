
## Clean Architecture

<img style="padding:3px;width:50%;" src="Clean Architecture.drawio.png" alt="Clean Architecture"/>
<br clear="all">
<p class="figureTitle">Clean Architecture</p> 
<br clear="all">


## Domain Archetype

[Domain Archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) is the result of a collaboration process which aims to form a series of common archetypes within a domain (the domain in this case is Genomics). 
The initial format for this archetype is often a spreadsheet that is expressed in an electronic format. The format we are using in this guide is [HL7 FHIR Questionnaire](https://hl7.org/fhir/R4/questionnaire.html), other formats can be used such as openEHR Archetype (see [Genomic Variant Result](https://ckm.openehr.org/ckm/archetypes/1013.1.3759))

For communication between different systems, these archetypes are mapped to a [Common Information Model](#common-information-model). 


<img style="padding:3px;width:95%;" src="Domain Archetype.drawio.png" alt="Domain Archetype"/>
<br clear="all">
<p class="figureTitle">Domain Archetype</p> 
<br clear="all">

## Common Information Model

The domain archetypes are implemented via a [Canonical Data Model](https://en.wikipedia.org/wiki/Canonical_model), which is common across all technical formats (i.e. HL7 v2 and HL7 FHIR) and is described using HL7 FHIR.

Elements from [NHS England FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home) have been incorporated into this guide, in particular the use of [NHS Data Model and Dictionary Model](https://www.datadictionary.nhs.uk/) identifiers and other identifiers already present in HL7 v2 OML and ORU. 
See [Identities and Codes](#identities-and-codes) for more details. 

<img style="padding:3px;width:95%;" src="Canonical Model.drawio.png" alt="Enterprise Canonical Data Model"/>
<br clear="all">
<p class="figureTitle">Enterprise Canonical Data Model</p> 
<br clear="all">



## Identities (Identifiers)

Both domain archetypes have a very strong focus on the use of [Correlation Identifier (Enterprise Integration Patterns)](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html) or [Rule 3: Reference Other Aggregates by Identity (Implementing Domain Driven Design)](https://www.archi-lab.io/infopages/ddd/aggregate-design-rules-vernon.html#rule-3-reference-other-aggregates-by-identity), which is also consistent with IHE/HL7 concepts of [Bounded Context (martinfowler.com)](https://martinfowler.com/bliki/BoundedContext.html) 

In practice this means, the following FHIR resources will have the following identifiers within the `IHE Laboratory Testing Workflow` domain:

- ServiceRequest
  - [Placer Order Number](StructureDefinition-OrderIdentifier.html)
  - [Filler Order Number](StructureDefinition-OrderFillerNumber.html)
  - [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)
  - [Accession Number](StructureDefinition-AccessionNumber.html)
 
- Specimen
  - identifier
  - [Accession Number](StructureDefinition-AccessionNumber.html)
- DiagnosticReport
  - identifier
  - [Filler Order Number](StructureDefinition-OrderFillerNumber.html)
  - [Accession Number](StructureDefinition-AccessionNumber.html)
- Patient (not strictly within the domain but included for HL7/IHE/NHSE compatability reasons)
  - [NHS Number](StructureDefinition-NHSIdentifier.html)
  - [Medical Record Number](StructureDefinition-MedicalRecordNumber.html)
- Encounter
  - [Episode Number](StructureDefinition-HospitalProviderSpellIdentifier.html)

This includes making use of FHIR Identifier `assigner.identifier.value` (HL7 v2 `Assigning Facility` in a variety of ID types) to distinguish these identifiers between different organisations, the recommendation is to use [ODS Code](https://www.datadictionary.nhs.uk/attributes/organisation_code.html), e.g.

```aiignore
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "ACSN"
          }
        ]
      },
      "value" : "1001166717",
      "assigner" : {
        "identifier" : {
          "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
          "value" : "699X0"
        }
      }
    }
```

### References to other domains

Is present around Organisation, Practioner and PractitionerRole. NHS England has expressed a preference to use NHS England Identifiers, these are:

- Organization 
  - [ODS Code](StructureDefinition-OrganisationCode.html)
- Practitioner
  - [Practitioner Identifiers](StructureDefinition-PractitionerIdentifier.html) (GMP and GMC Numbers)
- PractitionerRole
  - [ODS Code](StructureDefinition-OrganisationCode.html)
  - [Practitioner Identifiers](StructureDefinition-PractitionerIdentifier.html)

## Domain Archetype and Panels

TODO Explains how questions and answers are converted into v2 OBX/FHIR Observations based on https://build.fhir.org/ig/HL7/sdc/extraction.html

### Prior Results (Complete Blood Count Panel) Example

> The following information is presented as a HOWTO guide, it is not recommending any clinical coding.

The following is an extract from **Digital Health and Care Wales HL7 2.5.1 ORU_R01**.

> NHS England has not defined HL7 v2 ORU standards, and the use of HL7 v2 ORU is common in England. DHCW example is being used for documentation reasons, the clinical coding shown here is an example and not a standard.

```aiignore
OBR|2||914694928301|B0001^Full blood count|||201803091500|||^ABM: Sian Jones||||201803091500|^^Dr Jones
Indiana|^Jones^Indiana^^^Dr||||||201803091500|||F
TQ1|||||||201803091400|201803091500|S^^^^^^^^Urgent
OBX|1|NM|B0300^White blood cell (WBC) count||3.5|x10\S\9/L|4.0-11.0|L|||F|||201803091500
OBX|2|SN|B0307^Haemoglobin (Hb)||<^149|g/L|130-180|H|||F|||201803091500
OBX|3|NM|B0314^Platelet (PLT) count||500|x10\S\9/L|150-400|H|||F|||201803091500
OBX|4|NM|B0306^Red blood cell (RBC) count||6.00|x10\S\12/L|4.50-6.00|N|||F|||201803091500
OBX|6|CE|B0309^Mean cell volume (MCV)||NA^Not assayed^ACME|fL|80-100|N|||F|||201803091500
```

The coding (B0001, B0300, B0307, etc) is using local laboratory coding, ideally we want all organisations to communicate via standard coding and in the UK this preferred clinical coding is [SNOMED CT UK Edition 83821000000107](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct) and the preferred coding standard for units is [UCUM](https://ucum.org/). To use local codes would mean 20+ organisation maintaining code mappings between all the different local codesystems, by using SNOMED (or LOINC) this means they only need to maintain mappings between local codes and SNOMED (or LOINC)

At the time of writing, there is no definition of Complete Blood Count in the NHS. So instead, we look elsewhere:

- Searching [LOINC](https://loinc.org/) gives:
  - [LOINC 58410-2](https://loinc.org/58410-2)
- US [minimal Common Oncology Data Elements (mCODE)](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html#laboratory-tests) points to an example in US Core [Example DiagnosticReport: CBC Example](https://hl7.org/fhir/us/core/DiagnosticReport-cbc.html) which is based on the LOINC panel found in the previous search.

LOINC CBC panel - Blood by Automated count:

| LOINC     | Name                                                                    | R/O/C | UCUM Units |
|-----------|-------------------------------------------------------------------------|-------|------------|
| 58410-2   | CBC panel - Blood by Automated count                                    |       |            |			
| - 6690-2  | Leukocytes [#/volume] in Blood by Automated count                       | R     | 		10*3/uL  
| - 789-8   | Erythrocytes [#/volume] in Blood by Automated count	                    | R	    | 	10*6/uL   
| - 718-7   | Hemoglobin [Mass/volume] in Blood	                                      | R     | 		g/dL     |
| - 4544-3  | Hematocrit [Volume Fraction] of Blood by Automated count                | R	    | 	%         |
| - 787-2   | MCV [Entitic mean volume] in Red Blood Cells by Automated count	        | R	    | 	fL        |
| - 785-6   | MCH [Entitic mass] by Automated count	                                  | R	    | 	pg        |
| - 786-4   | MCHC [Entitic Mass/volume] in Red Blood Cells by Automated count	       | R	    | 	g/dL      |
| - 788-0   | Erythrocyte [DistWidth] in Red Blood Cells by Automated count           | O	    | 	%         |
| - 777-3   | Platelets [#/volume] in Blood by Automated count                        | R	    | 	10*3/uL   |
| - 32207-3 | Platelet distribution width [Entitic volume] in Blood by Automated count	 | O     | 	fL        |
| - 32623-1 | Platelet [Entitic mean volume] in Blood by Automated count              | O     | 		fL       |

Armed with this information which provides more details on the names and units to use, we can search UK sources. Some suggested resources include:

- [NHS England Pathology FHIR Implementation Guide](https://simplifier.net/guide/pathology-fhir-implementation-guide) which reveals
  - [PATH-R4-10: Bundle Example - Full Blood Count Report](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/All-Profiles/Examples/Bundles/Full-Blood-Count-Report?version=0.1) and so we have UK SNOMED coding.
- [OpenSAFELY codelists](https://www.opencodelists.org/codelist/opensafely) which contain many valuesets used in primary care.
- Internet searches also reveal several NHS Trusts providing documentation around *Full Blood Count*, this often includes the local coding we saw with the HL7 v2 example. The example below is from [University Hospitals of Liverpool Group - Full Blood Count](https://pathlabs.rlbuht.nhs.uk/fullbloodcount__h.htm)

<img style="padding:3px;width:700px;" src="Liverpool-FBC.png" alt="University Hospitals of Liverpool Group Full Blood Count"/>
<br clear="all">
<p class="figureTitle">University Hospitals of Liverpool Group - Full Blood Count</p> 
<br clear="all">

Based on the results we have found so far, we could start to infer LOINC - Local Codes - SNOMED mappings, this is not recommended for a developer or business analyst.

> Code mappings should be created by a [clinical coder](https://en.wikipedia.org/wiki/Clinical_coder). In HL7 FHIR this code mapping is known as a [ConceptMap](https://hl7.org/fhir/R4/conceptmap.html). NHS England has produced instructions for creating a [ConceptMap](https://digital.nhs.uk/services/terminology-server/training-guides/new-to-the-terminology-server/authoring-fhir-terminology-resources/create-a-new-concept-map) using the [NHS England Ontology Server](https://digital.nhs.uk/services/terminology-server)

However, LOINC and SNOMED have collaborated to produce [The LOINC Ontology SNOMED CT Browser](https://browser.loincsnomed.org/?). Which allows us to alter our previous definition of the panel to:

| LOINC     | SNOMED              | Name                                                                      | R/O/C | UCUM Units |
|-----------|---------------------|---------------------------------------------------------------------------|-------|------------|
| 58410-2   |                     | CBC panel - Blood by Automated count                                      |       |            |			
| - 6690-2  | [147071010000102](http://snomed.info/id/147071010000102) | Leukocytes [#/volume] in Blood by Automated count                         | R     | 		10*3/uL  
| - 789-8   | [249121010000107](http://snomed.info/id/249121010000107)   | Erythrocytes [#/volume] in Blood by Automated count	                      | R	    | 	10*6/uL   
| - 718-7   | [168331010000106](http://snomed.info/id/168331010000106)   | Hemoglobin [Mass/volume] in Blood	                                        | R     | 		g/dL     |
| - 4544-3  | [558261010000109](http://snomed.info/id/558261010000109)   | Hematocrit [Volume Fraction] of Blood by Automated count                  | R	    | 	%         |
| - 787-2   | [613061010000108](http://snomed.info/id/613061010000108)   | MCV [Entitic mean volume] in Red Blood Cells by Automated count	          | R	    | 	fL        |
| - 785-6   | [612991010000106](http://snomed.info/id/612991010000106)   | MCH [Entitic mass] by Automated count	                                    | R	    | 	pg        |
| - 786-4   | [613001010000107](http://snomed.info/id/613001010000107)   | MCHC [Entitic Mass/volume] in Red Blood Cells by Automated count	         | R	    | 	g/dL      |
| - 788-0   | [613181010000104](http://snomed.info/id/613181010000104)   | Erythrocyte [DistWidth] in Red Blood Cells by Automated count             | O	    | 	%         |
| - 777-3   | [218801010000106](http://snomed.info/id/218801010000106)   | Platelets [#/volume] in Blood by Automated count                          | R	    | 	10*3/uL   |
| - 32207-3 |                     | Platelet distribution width [Entitic volume] in Blood by Automated count	 | O     | 	fL        |
| - 32623-1 | [528301010000103](http://snomed.info/id/528301010000103)   | Platelet [Entitic mean volume] in Blood by Automated count                | O     | 		fL       |

> Note these SNOMED codes do not appear to be supported in the UK Edition of SNOMED.

As a Domain Archetype or Panel, we can represent this as a [FHIR Questionnaire](https://hl7.org/fhir/R4/questionnaire.html)

This format is useful as it is supported by tooling, for example, [National Laboratory of Medicine - NLM Form Builder](https://formbuilder.nlm.nih.gov/) which was used to help produce the CBC example.  

<img style="padding:3px;width:700px;" src="NLMFormBuilder.png" alt="NLM Form Builder"/>
<br clear="all">
<p class="figureTitle">NLM Form Builder</p> 
<br clear="all">

An example for Full Blood Count: 

> Archetype/Panel [CBC panel - Blood by Automated count](Questionnaire-58410-2.html). 

FHIR Questionnaire can hold mappings between different structures and codes. In the example below we can see LOINC codes for questions in the `LinkId` column and where the questions should map to in FHIR Resources (for FHIR Observation resource this also implies HL7 v2 OBX segments, both are commonly used for exchanging questions and answers between systems).

<img style="padding:3px;width:700px;" src="Questionnaire-Definitions.png" alt="FHIR Questionnaire Example"/>
<br clear="all">
<p class="figureTitle">FHIR Questionnaire Example</p> 
<br clear="all">

The JSON/XML representation can also contain coding for different codesystems, e.g.

```json
 "code": [
        {
          "system": "http://loinc.org",
          "code": "6690-2",
          "display": "WBC # Bld Auto"
        },
        {
          "system": "http://snomed.info/sct",
          "code": "147071010000102",
          "display": "WBC Auto (Bld) [#/Vol]"
        }
      ]
```

Armed with this information, we can create a FHIR Observation [Example Observation: MCV - Mean corpuscular volume](Observation-OBX-MCV.html). This is similar to the earlier DHCW example for OBX-6.

```aiignore
OBX|6|CE|B0309^Mean cell volume (MCV)||NA^Not assayed^ACME|fL|80-100|N|||F|||201803091500
```

The main difference is the use of clinical coding instead of the `B0309` local code. Note also the ranges are different and will vary between labs.

Another way of handling the mapping between coding is FHIR [ConceptMap](https://hl7.org/fhir/R4/conceptmap.html). A simple example of this mapping between the UK and LOINC SNOMED coding can be found here:

- [ConceptMap: SNOMED LOINC edition to SNOMED UK edition](ConceptMap-SNOMEDLOINCtoSNOMEDUK.html) 
  
<img style="padding:3px;width:700px;" src="ConceptMap-Example.png" alt="FHIR ConceptMap Example"/>
<br clear="all">
<p class="figureTitle">FHIR ConceptMap SNOMED LOINC Edition to SNOMED UK Edition Example</p> 
<br clear="all">

- [ConceptMap: LOINC to SNOMED UK edition](ConceptMap-LOINCtoSNOMEDUK.html)

<img style="padding:3px;width:700px;" src="ConceptMap-ExampleLOINC.png" alt="FHIR ConceptMap Example"/>
<br clear="all">
<p class="figureTitle">FHIR ConceptMap LOINC to SNOMED UK Example</p> 
<br clear="all">


### Codes or Resources

This is for discussion, this applies to FHIR resources identified as not being entities (and the use of identifier is not mandatory). These include:

- Observation
- Condition

In FHIR the codes for these will be [CodeableConcept](https://hl7.org/fhir/R4/datatypes.html#CodeableConcept) (HL7 v2 CE Data Types). It is excepted NHS England will

- express a preference towards [SNOMED CT](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct)
- use FHIR Resources to represent these.

The use of FHIR resources for data which is currently HL7 v2 CE Data Type may need to be questioned. 
For example mapping of HL7 v2 `ORC-16` is to `ServiceRequest.requestCode` according to [ServiceRquest - HL7 v2 Mapping](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct), this is a v2 CE to FHIR CodeableConcept conversion. 
Curently this is stated as an implied `ServiceRequest.requestReference` mapping (ISSUE link: [NHS England Developer Community Genomics Order Management Service - FHIR ServiceRequest reason](https://developer.community.nhs.uk/t/genomics-order-management-service-fhir-servicerequest-reason/4396))

