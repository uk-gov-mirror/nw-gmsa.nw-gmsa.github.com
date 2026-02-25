Profile:        Specimen
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Specimen
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Specimen-eu-lab
Id:             Specimen
Title:          "Specimen"
Description:    """
`Diagnostic Workflow`
"""

* ^keyword[+] = #core "Core"
* ^keyword[+] = #diagnostics "Diagnostics"
* ^keyword[+] = #genomics "Genomics"

* identifier 1..* MS
* identifier only CorrelationIdentifier


* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  PlacerSpecimenNumber 0..1 MS and FillerSpecimenNumber 0..1 MS and ShipmentTrackingNumber 0..1 MS and GS1SSCC 0..1

* identifier[PlacerSpecimenNumber].type = $v2-0203#PLAC
* identifier[PlacerSpecimenNumber] ^short = "Identifier assigned by the Order Placer."
* identifier[PlacerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[PlacerSpecimenNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[PlacerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* identifier[FillerSpecimenNumber].type = $v2-0203#FILL
* identifier[FillerSpecimenNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[FillerSpecimenNumber] insert Obligation(#SHALL:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[FillerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[FillerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* identifier[ShipmentTrackingNumber] only ShipmentTrackingNumber
* identifier[ShipmentTrackingNumber] ^short = "Identifier assigned by the Order Placer"
* identifier[ShipmentTrackingNumber] insert Obligation(#SHOULD:populate, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* identifier[ShipmentTrackingNumber] insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[ShipmentTrackingNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* identifier[GS1SSCC] only GS1SSCC

* accessionIdentifier ^short = "Discourage - in future FHIR versions accessionIdentifier becomes an identifier, it is recommeded to follow that convention"
* accessionIdentifier 0..1
* accessionIdentifier only SpecimenAccessionNumber

* subject 1..1 MS
* subject only Reference(Patient)

* collection.collected[x] only dateTime
* collection.collectedDateTime 0..1 MS

* type MS
* type from SpecimenType (required)

* collection.collector 0..1 MS
* collection.collector only Reference(PractitionerRole)

* collection.bodySite MS

* collection.quantity MS
