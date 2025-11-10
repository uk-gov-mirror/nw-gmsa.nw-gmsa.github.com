## Overview 

<figure>
{%include Diagnostic-Workflow-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Diagnostic Workflow - MindMap</p>
</figure>
<br clear="all">

This implementation guide is primarily focused on **Diagnostic Workflow** and how it fits in with the wider health data model is shown in the diagram above. 
- **Patient Care** and **Patient Administration** are generally found in NHS providers **Electronic Patient Record** systems
- **Care Directory Services** is centrally defined by NHS England and has supporting API's provided by NHS England (e.g. ODS).

In software design these are often called [domains](https://en.wikipedia.org/wiki/Domain-driven_design), **Genomic Diagnostic Workflow** sits in between several domains and in software architecture this is called a [bounded context](https://martinfowler.com/bliki/BoundedContext.html). 

### Domain Archtype

This section of the guide focuses on `health informatics` / `data architecture` / `information science covers` [Archetype](https://en.wikipedia.org/wiki/Archetype_(information_science))


## Diagnostic Report

<img style="padding:3px;width:60%;" src="BoundedContext.drawio.png" alt="Diagnostic Testing Bounded Contexts"/>
<br clear="all">
<p class="figureTitle">Diagnostic Testing Bounded Contexts</p> 
<br clear="all">


### Genomic Ordering and Reporting (Right Side)

<figure>
{%include LTW-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Archetypes High Level Model</p>
</figure>
<br clear="all">

This domain focuses on genomic and molecular diagnostics, the data modeling here is **Archetypes** or templates.

- [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
- [Genomic Test Report](Questionnaire-GenomicTestReport.html) – Summarizes genomic testing results.
  - Variant – Represents a specific genetic variant or mutation.
  - Diagnostic Implication – Links variants to clinical significance (e.g., pathogenicity, treatment implications).
  - The relationships show that a Genomic Report contains Variants, which in turn have Diagnostic Implications. 
  - This domain also connects to the Diagnostic Report in the core

