
## References 

1. [IHE Specimen Event Tracking](https://wiki.ihe.net/index.php/Specimen_Event_Tracking)
2. [NHS MFT Transport of Samples](https://mft.nhs.uk/the-trust/other-departments/laboratory-medicine/cytology/diagnostic-cytopathology/requesting-of-investigations/transport-of-samples/)

## Actors and Transactions

## Overview

See Ref 1 for details.

<img style="padding:3px;width:80%;" src="SET_main_profile_image.jpg" alt="IHE SET Main Events"/>
<br clear="all">
<p class="figureTitle">IHE SET Main Events</p> 
<br clear="all">

## Scenarios

### Blood Sample Collection

For information only, this is an extract of work done by North West Childresn Cancer and NHS England.

```mermaid
graph TD
    PTC["Primary Treatment Centre (PTC)"] --> |1. Sends Blood Tests Request| POSCU["Paediatric Oncology Shared Care Unit (POSCU)"]
    POSCU --> |2. Blood Collection Task| Collection["Blood Sample Taken<br/><br/>Community Nurse"] 
    Collection --> |3. Send Laboratory Order and Blood Specimen| SpecimenReception[Specimen Reception]
    SpecimenReception --> |4. Send Laboratory Order and Blood Specimen| LIMS[Diagnostic Testing - LIMS]
    LIMS --> |5. Performs Blood Test| LIMS
    LIMS --> |6. Write Laboratory Report| LIMS
    LIMS --> |7. Send Laboratory Report| POSCU
    LIMS --> |8. Send Laboratory Report| PTC
    PTC --> Prescription{Prescription Change Required?}
    Prescription --> |9. Yes| Medication[Amend Prescription]
    Medication --> |10. Inform of prescription change| POSCU      
```

#### As Is Process:

- (1) Blood test requested by Primary Treatment Centre (PTC)
- (2) Blood sample taken by Community Nurse or Paediatric Oncology Shared Care Unit (POSCU) and the specimen details are documented
- (3) Blood Laboratory Order is created and a laboratory order request is sent to the laboratory (4)
- (5) Blood test performed by laboratory 
- (6) Laboratory writes up blood results report (laboratory report)
- (7) Laboratory report sent to Community Nurse or POSCU
- (8) Laboratory report then sent to PTC
- Community Nurse or POSCU calls PTC by phone to notify that the results have been sent and to confirm that they have been received
- If results cannot be understood, PTC will call Community Nurse or POSCU to inform them. This is usually due to a defective message
- Community Nurse or POSCU sends results in a different format (via telephone or re writes the results out)
- (9) PTC may edit child's prescription on regimen in light of blood results and may need to recall patient  into hospital for additional tests
- (10) If prescription is amended then PTC must notify POSCU

### Biopsy Procedure

For information purposes only, this documention of a biopsy procedure in Nottingham University Hospital.

```mermaid
graph TD
    Home --> |1. Patient Arrives| DayUnit
    DayUnit --> |2. Performs Patient Admission| EHR
    DayUnit --> |3. Patient Sent to| Biopsy
    Biopsy --> |A. Collects Specimen| Biopsy
    Biopsy --> |4. Patient sent back to| DayUnit
    DayUnit -->  |5. Patient Discharged| Home
    Biopsy --> |B. Sends Specimen| SpecimenReception[Specimen Reception]
    SpecimenReception --> |C. Specimen Administration| LIMS[Diagnostic Testing - LIMS]
```

[Collect Specimen - Biopsy Procedure for obtaining a specimen, part of a diagnostic pathway. Day case admission.](ExampleScenario-BiopsyProcedure.html)
