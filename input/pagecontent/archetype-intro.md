<figure>
{%include BoundedContext.drawio.png%}
<p id="fX.X.X.X-X" class="figureTitle">Bounded Contexts</p>
</figure>
<br clear="all">

The data model is divided into four main contexts (bounded areas):

- Laboratory and Pathology Reporting
- **Genomic Reporting** (focus of this guide)
- Imaging Reporting
- Diagnostic Testing Core (central integration context)

## Diagnostic Testing Core (Center)

This is the core shared context that links the other three domains; the data modeling is based on **Domain Entities** or resources. It includes common HL7 v2 and FHIR elements used across diagnostic workflows:

- [Patient](StructureDefinition-Patient.html) – (HL7 v2 PID): Represents patient demographic and identification data.
- Case / Spell – (HL7 FHIR [Encounter](StructureDefinition-Encounter.html) and v2 PV1): Represents the clinical encounter or episode of care.
- [Diagnostic Report](StructureDefinition-DiagnosticReport.html) – (HL7 v2 OBR): The core diagnostic report entity summarizing results.
- [Specimen](StructureDefinition-Specimen.html) – (HL7 v2 SPM): Represents the collected specimen or sample.
- Diagnostic Order – (HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html) and v2 ORC): Represents orders or requests for diagnostic services.

These core components enable interoperability and data exchange among different reporting domains.

Note: Patient and Case/Spell are logically part of a Patient Administration domain.

## Genomic Ordering and Reporting (Right Side)

<figure>
{%include LTW-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Archtypes High Level Model</p>
</figure>
<br clear="all">

This domain focuses on genomic and molecular diagnostics, the data modeling here is **Archetypes** or templates.

- [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
- [Genomic Test Report](Questionnaire-GenomicTestReport.html) – Summarizes genomic testing results.
  - Variant – Represents a specific genetic variant or mutation.
  - Diagnostic Implication – Links variants to clinical significance (e.g., pathogenicity, treatment implications).
  - The relationships show that a Genomic Report contains Variants, which in turn have Diagnostic Implications. 
  - This domain also connects to the Diagnostic Report in the core

