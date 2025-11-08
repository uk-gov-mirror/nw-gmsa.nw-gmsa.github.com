## Reference
- 
- **NHS England HL7 v2** XCN [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
- [HL7 v2 XCN Extended Composite ID Number and Name for Persons](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/XCN)
- [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/volume-1.html)

## Practitioner (Resource) or Reference by Practitioner Identity

In message paradigms, especially HL7 v2 `laboratory order (OML_O21/ORM_O01)` and `unsolicitied observations (ORU_R01)` it is common to use the XCN (Extended Composite Id Number And Name For Persons). The FHIR equivalent to this datatype is FHIR [Reference](https://hl7.org/fhir/R4/references.html)

For example:

**HL7 v2 XCN**

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

**HL7 FHIR Reference**

```json
{
    "reference" : "Practitioner/1234",
    "type" : "Practitioner",
    "identifier" : {
      "system" : "https://fhir.hl7.org.uk/Id/gmc-number",
      "value" : "C3456789"
    },
    "display" : "Dr Darwin, Samuel"
}
```

FHIR Reference introduces a `reference` to a detailed version of Practitioner which includes fields such as telecom and gender. 

It is not clear in Enterprise/Regional use of FHIR which approach *Resource* or *Reference* should be taken, both HL7 v2 and FHIR support `Reference aggregate or entities by identity` from Dommain Driven Design (DDD) and this appears to also be followed by IHE XDS and DICOM.
In addition, [NHS England Data Dictionary](https://www.datadictionary.nhs.uk/) and *NHS England HL7 v2 ADT Message Specification* favour *Reference*
NHS England FHIR STU3/R4 specifications around Messaging, tend to favour *Resource*.

It is likely that the `reference` may be able to point to `Care Service Directory` services provided by [NHS England Healthcare Worker - FHIR API](https://digital.nhs.uk/developer/api-catalogue/healthcare-fhir-ap) in the near future,(or alternatively downloaded from [NHS England Organisation Data Service - CSV Downloads](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads). Therefore: it is proposed:

**Reference by Practitioner Identity only** 

and so continuing conventions used in HL7 v2, i.e. no Practitioner resources will be present in FHIR Messaging.
