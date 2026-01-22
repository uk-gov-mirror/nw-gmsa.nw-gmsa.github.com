## Development Testing 

### FHIR Validation

For details see [FHIR Validation](https://hl7.org/fhir/R4/validation.html)

### Command Line Validation

See [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)

The FHIR Validator works best with individual FHIR Resources and this may be an easier why to start checking your FHIR is correct.
Due to API security requirements of the NHS England Ontology Service, this can not be used as a Terminology Server (the `-tx` parameter). This ig is configured to use the UK edition of SNOMED (83821000000107).

To use this Implementation Guide with the HL7 Validator, you will need to download this as a package (download link [package.tgz](package.tgz)) and then specify this NPM package file via the `-ig package.tgz` parameter.

The FHIR Validator defaults to validating individual FHIR resources (not FHIR Bundles), to validate FHIR resources in a Bundle see **Validating a single resource in a bundle** on the *Using the FHIR Validator* link above.

#### Examples to Validate a Bundle

##### laboratory-order O21 Validation Example

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig package.tgz -bundle ServiceRequest:0 https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest -tx n/a
```

##### unsolicited-observation R01 Validation Example

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig package.tgz -bundle DiagnosticReport:0 https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport -tx n/a
```

### Asking a FHIR Server

[validator.fhir.org](https://validator.fhir.org/) provides a web-based interface to the Validator CLI jar. This defaults to international FHIR and the options tab can be used to specify specific packages and SNOMED editions (this is listed as `UK - 999000041000000102`). This IG is not currently published to the registry and so `ukcore` should be used instead using the latest release


## Integration Testing 

### Test Patients

All test patients (with a NHS Number) are on NHS England [Personal Demographics Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) (Int environment).

The ODS code for GP Surgery MUST be a real code, this is used for routing reports to relevant ICS.

#### NHS North West Genomcis Test Patients

| NHS Number                                                      | Surname                                       | Forename | Middle name | Gender | Date Of Birth <br/> (SMSP) | Deceased | GP Surgery <br/> ODS Code                                                           | Address line 1        | Address line 2                  | Address line 3          | Address line 4 <br/> city | Address line 5 <br/> district | Postcode |
|-----------------------------------------------------------------|-----------------------------------------------|----------|-------------|--------|----------------------------|----------|-------------------------------------------------------------------------------------|-----------------------|---------------------------------|-------------------------|---------------------------|-------------------------------|----------|
| [944 930 5552](Patient-Patient-OctaviaCHISLETT-9449305552.html) | CHISLETT                                      | Octavia  |             | F      | 2008-09-20                 |          |                                                                                     | 1 RAVENSFIELD GARDENS |                                 |                         | EPSOM                     | SURREY                        | KT19 0ST |
| 9737383192                                                      | [MANCHESTER](Patient-Patient-Manchester.html) | Sansa    |             | F      | 1972-09-21                 |          | [P84673](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=P84673) | Oxford Rd             |                                 |                         | MANCHESTER                |                               | M13 9PL  |
| 9737383206                                                      | [LIVERPOOL](Patient-Patient-Liverpool.html)   | Ned      |             | M      | 1942-06-18                 |          | [N82035](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=N82035) | 20 Forthlin Road      |                                 |                         | LIVERPOOL                 |                               | L18 9TN  |
| 9737383214                                                      | [LANCASTER](Patient-Patient-Lancaster.html)   | Jaime    |             | M      | 1970-07-27                 |          | [P81002](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=P81002) | Dalton Square         |                                 |                         | LANCASTER                 |                               | LA1 1PJ  | 
| 9737383222                                                      | [LEEDS](Patient-Patient-Leeds.html)           | Rob      |             | M      | 1978-01-17                 |          | [B86016](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=B86016) | Maison Lane           |                                 |                         | LEEDS                     |                               | LS8 2HH  | 
| 9737383230                                                      | [LONDON](Patient-Patient-London.html)         | Cersei   |             | F      | 1973-10-03                 |          | [F83004](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=F83004) | 110 The Queen's Walk  |                                 |                         | LONDON                    |                               | SE1 2AA  |
| 9737383249                                                      | [BIRMINGHAM](Patient-Patient-Birmingham.html) | Tommen   |             | M      | 1999-09-07                 |          | [M85124](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=M85124) | Victoria Square       |                                 |                         | BIRMINGHAM                |                               | B3 3DQ   |
| 9737383257                                                      | [WREXHAM](Patient-Patient-Wrexham.html)       | Myrcella |             | F      | 1999-10-13                 |          | [N81082](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=N81082) | Ffordd, Mold Rd       | Mold                            |                         | WREXHAM                   |                               | LL11 2AH |
| 9737383265                                                      | [NOTTINGHAM](Patient-Patient-Nottingham.html) | Lyarra   |             | F      | 1924-01-05                 | &#9989;  | [C81010](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=C81010) |                       |                                 |                         |                           |                               | NG10 1NP |
| 9737383273                                                      | [BOLTON](Patient-Patient-Bolton.html)         | Ramsay   |             | M      | 1985-05-13                 |          | [P84673](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=P84673) | Victoria Sq           |                                 |                         | BOLTON                    |                               | BL1 1RU  |
| 9737383281                                                      | [CONGLETON](Patient-Patient-Congleton.html)   | Margaery |             | F      | 1982-02-11                 |          | [N81027](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=N81027) | Town Hall             | 7 High Street                   |                         | CONGLETON                 |                               | CW12 1BN |
| 9737383303                                                      | [WARRINGTON](Patient-Patient-Warrington.html) | Olennas  |             | F      | 1938-07-20                 | &#9989;  |                                                                                     |                       |                                 |                         |                           |                               |          | 
| 9737383311                                                      | [NORTHWICH](Patient-Patient-Northwich.html)   | Mace     |             | M      | 1957-01-19                 |          | [N81087](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=N81087) | Apple Market St       |                                 |                         | Northwich                 |                               | CW9 5BB  |
| 9737383338                                                      | BUXTON                                        | Lysa     |             | F      | 1971-01-01                 |          | [C81065](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=C81065) | Market Place          |                                 |                         | Buxton                    |                               | SK17 6EL |
| 9737383346                                                      | HAWES                                         | Ygritte  |             | F      | 1987-02-09                 |          | [B82045](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=B82045) | Market Place          |                                 |                         | Hawes                     |                               | DL8 3QN  |
| 9737383354                                                      | KENDAL                                        | Tormund  |             | M      | 1978-12-07                 |          | [A82025](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=A82025) | 9a Lowther St         |                                 |                         | Kendal                    |                               | LA9 4DA  |
| 9737383362                                                      | BROUGH                                        | Gilly    |             | F      | 1989-07-01                 |          | [A82038](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=A82038) | Townhead House        | Brough                          | Sowerby                 | KIRKBY STEPHEN            |                               | CA17 4EG |
| 9737383370                                                      | BLACKBURN                                     | Robert   |             | M      | 1965-01-14                 |          | [Y02657](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=Y02657) | King William Street   |                                 |                         | Blackburn                 | Lancashire                    | BB1 7DY  |
| 9737383389                                                      | BURNLEY                                       | Selyse   |             | F      | 1967-09-18                 |          | [Y00206](https://www.odsdatasearchandexport.nhs.uk/?search=generalorg&query=Y00206) | Manchester Road       |                                 |                         | Burnley                   | Lancashire                    | BB11 9SA |
| 9737383397                                                      | TAMESIDE                                      | Hodor    |             | M      | 27/07/1960                 |          | Y00206                                                                              | Stockport Road        |                                 |                         | Tameside                  |                               | OL7 0NS  |   
| (CHI Number)                                                    | GLASGOW                                       | Karsi    |             | F      | 1982-01-16                 |          |                                                                                     | J B Russell House     | Gartnavel Royal Hospital Campus | 1055 Great Western Road | Glasgow                   |                               | G12 0XH  |          
{:.grid}

```mermaid
graph TD;
    subgraph LynchSyndrome[Lynch Syndrome Scenario]
        Nottingham((Nottingham<br/>Lyarra)) --> |Mother| Liverpool[Liverpool<br/>Ned]
        Liverpool --> |Father| Leeds[Leeds<br/>Rob]
        Liverpool --> |Father| Manchester((Manchester<br/>Sansa))
    end

    subgraph CysticFibrosis[Cystic Fibrosis Scenario]
        London((London<br/>Cersei)) --> |Mother| Birmmingham
        London --> |Mother| Wrexham((Wrexham<br/>Myrcella))
        Lancaster[Lancaster<br/>Jaime] --> |Father| Birmmingham[Birmmingham<br/>Tommen]
        Lancaster --> |Father| Wrexham
        London --> |Twin| Lancaster
    end
    
    subgraph TBD[To be determined Scenario]
        Warrington((Warrington<br/>Olenna)) --> |Mother| Northwich 
        Northwich[Northwich<br/>Mace] --> |Father| Congleton((Congleton<br/>Margaery))
    end
```


### Test Scenarios

In all test cases the report is sent to the regional Genomic Clinical Data Repository (CDR).

### Round Robin Tests (NHS Trust - EPR -> LIMS -> NHS Trust - EPR and ICS)

Diagnostic Testing are ordered and performed within the region, patient can be from within or outside the region.

| Given Patient | with ODS         | and Order Facility | then report is sent to NHS Trust              | and ICS Application       |
|---------------|------------------|--------------------|-----------------------------------------------|---------------------------|
| Manchester    | F81399 (QOP)     | RBS                | RBS (Alder Hey)                               | QOP GMCR                  |
| Manchester    | F81399 (QOP)     | R0A                | R0A (Manchester University)                   | QOP GMCR                  |
| Manchester    | F81399 (QOP)     | REP                | REP (Liverpool Womens)                        | QOP GMCR                  |
| Liverpool     | Y00175 (QYG)     | RBS                | RBS (Alder Hey)                               | QYG Share2Care            |
| Liverpool     | Y00175 (QYG)     | R0A                | R0A (Manchester University)                   | QYG Share2Care            |
| Liverpool     | Y00175 (QYG)     | REP                | REP (Liverpool Womens)                        | QYG Share2Care            |
| Leeds         | F81399 (QOP)     | RBS                | RBS (Alder Hey)                               | *not delivered (YHCR)*     |
| Leeds         | F81399 (QOP)     | R0A                | R0A (Manchester University)                   | *not delivered (YHCR)*      |
| Leeds         | F81399 (QOP)     | REP                | REP (Liverpool Womens)                        | *not delivered (YHCR)*      |
| Wrexham       | To be determined | RBS                | RBS (Alder Hey)                               | *not delivered (DWCW)*      |
| Wrexham       | To be determined | R0A                | R0A (Manchester University)                   | *not delivered (DHCW)*      |
| Wrexham       | To be determined | REP                | REP (Liverpool Womens)                        | *not delivered (DHCW)*      |

### Out of Area Tests (LIMS -> EPR)

Diagnostic Testing is performed in the North West and Ordering Facility is outside the region.

| Given Patient | with ODS         | and Order Facility | then report is sent to NHS Trust              | and ICS Application       |
|---------------|------------------|--------------------|-----------------------------------------------|---------------------------|
| Leeds         | F81399 (QOP)     | To be determined   | *not delivered*                               | *not delivered (YHCR)*      |
| London        | To be determined | To be determined                | *not delivered - future via NHS England GOMS* | *not supported (OneLondon)* |
| London        | To be determined | To be determined                | *not delivered - future via NHS England GOMS* | *not supported (OneLondon)* |

### NHS England Test Patients

These patients are created in the NHS England Test Data Repository (TDR) and were used for previous national programmes (from HSCIC and NHS Digital)

| NHS Number                                                      | Surname                                       | Forename | Middle name | Gender | Date Of Birth <br/> (SMSP) | Deceased | GP Surgery <br/> ODS Code                                                           | Address line 1        | Address line 2 | Address line 3 | Address line 4 <br/> city | Address line 5 <br/> district | Postcode |
|-----------------------------------------------------------------|-----------------------------------------------|----------|-------------|--------|----------------------------|----------|-------------------------------------------------------------------------------------|-----------------------|----------------|----------------|---------------------------|-------------------------------|----------|
| [999 999 9468](Patient-9999999468.html)                         | EDITESTPATIENT                                | ONE      | John        | M      | 1925-01-27                 |          | D82015                                                                              |                       |                |                |                           |                               | B6 5RQ   |
| [999 999 9476](Patient-9999999476.html)	                        | EDITESTPATIENT                                | TWO      |             | M (F)  | 1962-02-01 (1964-02-29)    |          | B85023                                                                              |                       |                |                |                           |                               | EX6 7JJ  |
| [999 999 9484](Patient-9999999484.html)	                        | EDITESTPATIENT                                | THREE    | ZOE         | M (F)  | 2007-05-05  (1978-07-19)   |          | -                                                                                   |                       |                |                |                           |                               | EX2 5SE  |
| [999 999 9492](Patient-9999999492.html)	                        | EDITESTPATIENT                                | FOUR     |             | M      | 1933-03-03 (1911-02-12)    |          | B85023                                                                              |                       |                |                |                           |                               | EX1 2SS  |
| [999 999 9506](Patient-9999999506.html)	                        | EDITESTPATIENT                                | FIVE     | LESLIE      | M      | 1990-10-19                 |          |                                                                                     |                       |                |                |                           |                               | LL1 1EQ  |
| [999 999 9514](Patient-9999999514.html)	                        | EDITESTPATIENT                                | SIX      |             | M      | 1988-01-14 (1960-06-24)    |          |                                                                                     |                       |                |                |                           |                               | CV35 8DU |
| [999 999 9522](Patient-9999999522.html)	                        | EDITESTPATIENT                                | SEVEN    |             | M      | 2007-05-05 (1945-01-01)    |          |                                                                                     |                       |                |                |                           |                               | EX2 5SE  |
| [999 999 9530](Patient-9999999530.html)	                        | EDITESTPATIENT                                | EIGHT    |             | M      | 1985-12-01 (1972-03-12)    |          |                                                                                     |                       |                |                |                           |                               | Retest T |
| [999 999 9549](Patient-9999999549.html)	                        | EDITESTPATIENT                                | NINE     |             | F      | 2002-02-02 (1950-11-13)    |          | B85023                                                                              |                       |                |                |                           |                               | EX1 2SS  |
| [999 999 9557](Patient-9999999557.html)	                        | EDITESTPATIENT                                | TEN      |             | F      | 1980-01-01 (1960-03-22)    |          |                                                                                     |                       |                |                |                           |                               | RG12 9AX |
| [999 999 9565](Patient-9999999565.html)	                        | EDITESTPATIENT                                | ELEVEN   |             | F      | 2008-05-05 (1930-04-14)    |          |                                                                                     |                       |                |                |                           |                               | BD16 1QB |
| [999 999 9573](Patient-9999999573.html)	                        | EDITESTPATIENT                                | TWELVE   |             | F (M)  | 1963-05-05 (1964-01-01)    |          |                                                                                     |                       |                |                |                           |                               | EX1 2SS  |
| [999 999 9581](Patient-9999999581.html)	                        | EDITESTPATIENT                                | THIRTEEN |             | F      | 1960-01-01 (1930-05-14)    |          | B85023                                                                              |                       |                |                |                           |                               | EX2 5SE  |
| [999 999 9603](Patient-9999999603.html)	                        | EDITESTPATIENT                                | FOURTEEN |             | M (F)  | 1984-11-06 (1939-07-05)    |          | B85023                                                                              |                       |                |                |                           |                               | ub4 0db  |


## Environments

The APIs are available on the [Health and Social Care Network (HSCN)](https://digital.nhs.uk/services/health-and-social-care-network)


| Environment         | Service                                                                                  | Base Url                                                                         | Capability Statement 'OAS'                                                                                                  |
|---------------------|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Development         |                                                                                          |                                                                                  |                                                                                                                             |
|                     | Genomics Regional Integration Engine (RIE)                                               | https://gen-tie-dev.nwgenomics.nhs.uk/gentiedev/ESB                              | See [Placer Order Management [LAB-1]](LAB-1.html) and [CapabilityStatement](https://10.165.194.216/gentiedev/ESB/metadata)  |
|                     | Genomics Regional Health Information Exchange (IHE) <br/> Genomics Clinical Data Repository (CDR) | https://gen-tie-dev.nwgenomics.nhs.uk/irishealth/csp/healthshare/clinicaldatarepository/fhir/r4 | See [Query Existing Data [PCC-44]](PCC-44.html)                                                                             |
| Integration Testing |                                                                                          |                                                                                  |                                                                                                                             |
|                     | Genomics Regional Integration Engine (RIE)                                                        | https://gen-tie-test.nwgenomics.nhs.uk/gentietest/ESB                            | See [Placer Order Management [LAB-1]](LAB-1.html) and [CapabilityStatement](https://10.165.194.217/gentietest/ESB/metadata) |
|                     | Genomics Regional OAuth2 Server                                                                   | https://gen-tie-test.nwgenomics.nhs.uk/gentietest/oauth2                                        |                                                                                                                             | 


### Security and authorisation

This API has two access modes:

- Development - unrestricted access 
- Integration Testing - OAuth2 [client-credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/)


