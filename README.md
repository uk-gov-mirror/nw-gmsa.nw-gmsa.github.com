See [North West Genomics HL7/IHE Implementation Guide](https://fhir.nwgenomics.nhs.uk/R4)

Guidance on updating this Implementation Guide can be found on [Guidance for FHIR IG Creation](https://build.fhir.org/ig/FHIR/ig-guidance/index.html)

Related links:
 - [HL7 FHIR Implementation Guide Build Notications](https://chat.fhir.org/#narrow/stream/179297-committers.2Fnotification)

## Sending HL7 v2 Message

Note files must use CR or CRLF (not unix/mac LF)

### Mac

curl --request POST --data-binary "@OML_O21_PDF.txt" http://192.168.1.50:9980
curl --request POST --data-binary "@ORU_R01_PDF.txt" http://192.168.1.50:9980 

### Windows 

`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/ManchesterFoundationTrust/OML_O21_PDF.txt"`
`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/ManchesterFoundationTrust/ORU_R01_PDF.txt"`
`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/iGene/ORU_R01_PDF.txt"`
