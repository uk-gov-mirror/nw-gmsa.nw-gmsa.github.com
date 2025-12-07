
## References 

1. [IHE Specimen Event Tracking](https://wiki.ihe.net/index.php/Specimen_Event_Tracking)

## Actors and Transactions

## Overview

See Ref 1 for details.

<img style="padding:3px;width:20%;" src="SET_main_profile_image.jpg" alt="IHE SET Main Events"/>
<br clear="all">
<p class="figureTitle">IHE SET Main Events</p> 
<br clear="all">

## Scenarios

```mermaid
graph TD
    Home --> |1. Patient Arrives| DayUnit
    DayUnit --> |2. Performs Patient Admission| EHR
    DayUnit --> |3. Patient Sent to| Biopsy
    Biopsy --> |A. Collects Specimen| Biopsy
    Biopsy --> |4. Patient sent back to| DayUnit
    DayUnit -->  |5. Patient Discharged| Home
    Biopsy --> |B. Sends Specimen| DiagnosticTesting
    DiagnosticTesting --> |C. Specimen Administration| LIMS
```

[Collect Specimen - Biopsy Procedure for obtaining a specimen, part of a diagnostic pathway. Day case admission.](ExampleScenario-BiopsyProcedure.html)
