<div class="alert alert-danger" role="alert">
This is a collection of notes and is not for implementation.
</div>

## References

1. [GS1 Pathology](https://gs1hospital.gs1.org/pathology/)
2. [IHE Laboratory Specimen Barcode Labeling (LBL) Profile](https://wiki.ihe.net/index.php/Laboratory_Barcode_Labeling)
3. Blood Transfusions [EU Optimal Blood Use](http://www.optimalblooduse.eu/content/62-blood-component-label) 

## Data Mappings

| Data Type               | GS1                                                                                                                            | HL7 FHIR                               |   | HL7 V2                              |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|:--|-------------------------------------|
| Patient Identifification | [GS1 Global Service Relation Number (GSRN)](StructureDefinition-GS1GSRN.html)                                                  | Patient.identifier (type = PI)         |   | PID-3 (type = PI)                   |
| Account Number          | [GS1 Service Relation Instance Number (SRIN)](StructureDefinition-GS1SRIN.html)                                                | Encounter.identifier (type = AN)       |   | PV1-19 Visit Number (type = AN)     |  
| Specimen Identifier     | [GS1 Global Individual Asset Identifier (GIAI)](https://www.gs1.org/standards/id-keys/global-individual-asset-identifier-giai) | Specimen.identifier (placer or filler) |   | SPM-2 Specimen ID (placer or filler) |
| Shipment Tracking Number | [GS1 Serial Shipping Container Code (SSCC)](StructureDefinition-GS1SSCC.html)                                                  | Specimen.identifier (type = STN)       |   | SPM-32	Shipment Tracking Number     |

Note [Organisation Code](StructureDefinition-OrganisationCode.html) is directly related to GS1 Company (see Find Company on [GS1 UK](https://www.gs1uk.org/our-services/data-services/verified-by-gs1/search-verified-by-gs1) which can be used to find NHS Trust GS1 identifiers)

## Examples

<img style="padding:3px;width:80%;" src="GS1Pathology.drawio.png" alt="GS1 Sample Label"/>
<br clear="all">
<p class="figureTitle">GS1 Sample Label</p> 
<br clear="all">


