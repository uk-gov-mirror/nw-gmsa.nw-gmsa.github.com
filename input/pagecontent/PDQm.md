<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

This API for the NW GMSA Clinical Data Repository is based on the following API contracts:

- [IHE Mobile Patient Demographics Query [ITI-78]](https://profiles.ihe.net/ITI/PDQm/ITI-78.html)
- [INTEROPen/NHS England Care Connect API](https://nhsconnect.github.io/CareConnectAPI) updated to FHIR R4.

The search parameters are based on [FHIR Search](https://hl7.org/fhir/R4/search.html) which provides detailed description of the parameters and value types.

## Patient

<table style="">
    <tr>
        <td>
            <div class="alert alert-info" role="alert">
            <b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#pid" _target="_blank">PID</a> 
            </div>
        </td>
	</tr>
</table>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Patient/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Patient?[parameter]=[value]]
</div>


| Parameter          | Type   | Search                                             | Note                                                                                                                                                    |
|--------------------|--------|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| _id                |        | GET [base]/Patient?_id=[id]                        |                                                                                                                                                         |      
| active             | token  | GET [base]/Patient?active=[true or false]          | Whether the patient record is active                                                                                                                    |                                                                                                                
| family             | string | GET [base]/Patient?family=[string]                 | A portion of the family name of the patient                                                                                                             |                                                                                                           
| given              | string | GET [base]/Patient?given=[string]                  | A portion of the given name of the patient                                                                                                              |                                                                                                            
| identifier         | token  | GET [base]/Patient?identifier=[system&#124;][code] | A patient identifier                                                                                                                                    |                                                                                                                                
| telecom            | token  | GET [base]/Patient?telecom=[system&#124;][code]    | The value in any kind of telecom details of the patient                                                                                                 |                                                                                              
| birthdate          | date   | GET [base]/Patient?birthdate=[system&#124;][code]  | The patient's date of birth                                                                                                                             |                                                                                                                        
| address            | string | GET [base]/Patient?address=[string]                | A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text |
| address-city       | string | GET [base]/Patient?address-city =[string]          | A city specified in an address                                                                                                                          |                                                                                                                     
| address-country    | string | GET [base]/Patient?address-country=[string]        | A country specified in an address                                                                                                                       |                                                                                                                    
| address-postalcode | string | GET [base]/Patient?address-postalcode=[string]     | A postalCode specified in an address                                                                                                                    |                                                                                                                 
| address-state      | string | GET [base]/Patient?address-state=[string]          | A state specified in an address                                                                                                                         |                                                                                                                
| gender             | token  | GET [base]/Patient?gender=[code]                   | Gender of the patient                                                                                                                                   | `                                                                                                                                                       
| mothersMaidenName  | string | GET [base]/Patient?mothersMaidenName=[string]      |                                                                                                                                                         |      

#### Examples

Searching for Conditions for Patient Liverpool.
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552
Accept: application/fhir+json
```
[Response](Bundle-PDQSearchResults.json.html)
