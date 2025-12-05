For reference only, this is an extract of work done by North West Childresn Cancer and NHS England.

```mermaid
graph TD
    PTC["Primary Treatment Centre (PTC)"] --> |1. Sends Blood Tests Request| POSCU["Paediatric Oncology Shared Care Unit (PSOCU)"]
    POSCU --> |2. Blood Collection Task| Collection["Blood Sample Taken<br/><br/>Community Nurse"] 
    Collection --> |3. Send Laboratory Order and Blood Specimen| SpecimenReception[Specimen Reception]
    SpecimenReception --> |4. Send Laboratory Order and Blood Specimen| LIMS[Performs Blood Test<br/><br/>Laboratory]
    LIMS --> |5. Write Laboratory Report| LIMS
    LIMS --> |6. Send Laboratory Report| POSCU
    LIMS --> |7. Send Laboratory Report| PTC
    PTC --> Prescription{Prescription Change Required?}
    Prescription --> |8. Yes| Medication[Amend Prescription]
    Medication --> |9. Inform of prescription change| POSCU      
```

## As Is Process:

- (1) Blood test requested by Primary Treatment Centre (PTC)
- (2) Blood sample taken by Community Nurse or Paediatric Oncology Shared Care Unit (POSCU) and the specimen details are documented
- (3) Blood Laboratory Order is created and an laboratory order request is sent to the laboratory
- Blood test performed by laboratory
- (5) Laboratory writes up blood results report (laboratory report)
- (6) Laboratory report sent to Community Nurse or POSCU
- (7) Laboratory report then sent to PTC
- Community Nurse or POSCU calls PTC by phone to notify that the results have been sent and to confirm that they have been received
- If results cannot be understood, PTC will call Community Nurse or POSCU to inform them. This is usually due to a defective message
- Community Nurse or POSCU sends results in a different format (via telephone or re writes the results out)
- (8) PTC may edit child's prescription on regimen in light of blood results and may need to recall patient  into hospital for additional tests
- (9) If prescription is amended then PTC must notify POSCU
