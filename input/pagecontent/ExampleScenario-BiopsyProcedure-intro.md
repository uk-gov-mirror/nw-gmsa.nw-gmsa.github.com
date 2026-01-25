
Specimen collection is not performed by a Genomics service, and this shows how genomics fits into that process. The diagram here is around a biopsy procedure, but the same principles apply to other specimen collection procedures.

```mermaid
graph TD;

    Oncology[Specialty e.g. Oncology] --> |"Asks for a biopsy (procedure)"| SpecialistTeam[fas:fa-user-md Specialist Team]
    Oncology --> |"Asks for a diagnostic test (procedure)"| DiagnosticTesting[Diagnostic Testing]
    SpecialistTeam --> Admits[Admits Patient]
    Admits --> Performs[Performs Procedure]
    Admits --> |"Gets Patient Summary <br/>(Conditions, Allergies and Current Medications)"| Patient
    Admits --> |Update Patient Record| EPR
    Performs --> Discharge[Discharges Patient]
    Performs --> |Sends Specimen| DiagnosticTesting
    Discharge --> |Discharge Letter| Patient["fas:fa-user Patient"]
    Discharge --> |Send Discharge Letter| GP["fas:fa-user-md GP"]
    Discharge --> |"Record procedure (as completed)"| EPR["fas:fa-database <i>Electronic Patient Record</i>"]
    Discharge --> |Send Visit Notification| Consultant[fas:fa-user-md Consultant]
    GP --> |"Store Discharge Letter"| GPEPR["fas:fa-database <i>GP Electronic Patient Record</i>"]
```
