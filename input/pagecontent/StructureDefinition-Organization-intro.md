## Reference

- **NHS England HL7 v2** XON [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
- [HL7 v2 XON – Extended Composite Name and Identification Number for Organisations](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/XON)
- [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/volume-1.html)

## Organization (Resource) or Reference by Organization Identity

In message paradigms, especially HL7 v2 `laboratory order (OML_O21/ORM_O01)` and `unsolicitied observations (ORU_R01)` it is common to use the XON (Extended Composite Name and Identification Number for Organisations). The FHIR equivalent to this datatype is FHIR [Reference](https://hl7.org/fhir/R4/references.html)

For example:

**HL7 v2 XON**

```
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```

**HL7 FHIR Reference**

```json
{
    "reference" : "Organization/ABCDE",
    "type" : "Organization",
    "identifier" : {
      "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
      "value" : "R0A"
    },
    "display" : "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
}
```

FHIR Reference introduces a `reference` to a detailed version of Organisation which additional elements. 

This `reference` may be able to point to `Care Service Directory` services provided by [NHS England Organisation Data Terminology - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-terminology) (or alternatively downloaded from [NHS England Organisation Data Service - CSV Downloads](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads), therefore it is proposed 

**Reference by Organization Identity only**

and so continuing conventions used in HL7 v2, i.e. no Organization resources will be present in FHIR Messaging.

## Data Mappings

| NHS Data Dictionary                                                                                                                                                                                                                                                       | FHIR Organization              | HL7 v2 XON | NHS England Organisation Data Terminology - FHIR API     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------|------------|----------------------------------------------------------|
| Name of Organisation                                                                                                                                                                                                                                                      | Organization.name              | XON-1      | Organisation.name                                        |
| [Organsiation Code](https://www.datadictionary.nhs.uk/attributes/organisation_code.html) <br/> [Organisation Site Code](StructureDefinition-OrganisationSiteIdentifier.html) when a site code is used Organization.partOf must be populated with parent organisation code | Organization.identifier.value  | XON-3      | Organization.identifier.value                            | 
|                                                                                                                                                                                                                                                                           | Organization.identifier.system | XON-6      | Organization.identifier.system                           |
| ODS Organisation Role                                                                                                                                                                                                                                                     | Organization.type              | XON-7 [FHIR Organization Type](http://hl7.org/fhir/ValueSet/organization-type)      | Organisation.extension[ODSOrganisationRole]              | 
|                                                                                                                                                                                                                                                                           | Organization.partOf            | XON-8      | Inferred from OrganizationAffliation (codes RE5 and RE6) |

