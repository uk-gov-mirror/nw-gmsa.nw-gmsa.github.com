See [North West Genomics HL7/IHE Implementation Guide](https://nw-gmsa.github.io/)

Guidance on updating this Implementation Guide can be found on [Guidance for FHIR IG Creation](https://build.fhir.org/ig/FHIR/ig-guidance/index.html)

Related links:
 - [HL7 FHIR Implementation Guide Build Notications](https://chat.fhir.org/#narrow/stream/179297-committers.2Fnotification)

# Sending HL7 v2 Message

Note files must use CR or CRLF (not unix/mac LF)

## Mac

### Transform to FHIR

curl --request POST --data-binary "@Specifications/iGene/ORU_R01_PDF.txt" http://192.168.1.67:9981/transformToFHIR
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1.txt" http://192.168.1.67:9981/transformToFHIR
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_DLIMS.txt" http://192.168.1.67:9981/transformToFHIR

MFT Multiple Tests example

curl --request POST --data-binary "@Specifications/ManchesterFoundationTrust/ORM_O01-MultipleTests.txt" http://192.168.1.67:9981/transformToFHIR

### Send to HL7v2 Receiver

Note file must use \r mac line endings.

curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1_R0A.txt" http://192.168.1.67:9980
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1_RBS.txt" http://192.168.1.67:9980
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1_REP.txt" http://192.168.1.67:9980

curl --request POST --data-binary "@Specifications/iGene/ORU_R01_PDF.txt" http://192.168.1.67:9980
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_DLIMS.txt" http://192.168.1.67:9980
curl --request POST --data-binary "@Specifications/iGene/ORU_R01_REP.txt" http://192.168.1.67:9980


CHI Number example

curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1_SG9.txt" http://192.168.1.67:9980

Health and Care Number Example

curl --request POST --data-binary "@Specifications/iGene/ORU_R01_R125.1_ZT001.txt" http://192.168.1.67:9980

## Windows 

`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/ManchesterFoundationTrust/OML_O21_PDF.txt"`
`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/ManchesterFoundationTrust/ORU_R01_PDF.txt"`
`Invoke-RestMethod -Method POST -Uri http://localhost:9980 -InFile "Specifications/iGene/ORU_R01_PDF.txt"`
`Invoke-RestMethod -Method POST -Uri http://localhost:9981/transformToFHIR -InFile "Specifications/iGene/ORU_R01_PDF.txt"`
