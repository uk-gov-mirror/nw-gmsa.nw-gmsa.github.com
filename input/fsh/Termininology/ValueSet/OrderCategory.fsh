ValueSet: OrderCategory
Id: order-category
Title: "Order Category"
Description: """
Top level classification of Genomic Test Directory
"""

* ^experimental  = false

* $nwgmsa#RareAndInheritedDiseasesGeneticTesting "Rare and inherited diseases Genetic Testing (procedure)"
* $sct#1186936003 "Storage of specimen (procedure)"
* $nwgmsa#PreNatalGeneticTesting "Pre Natal Genetic Testing (procedure)"
* $nwgmsa#HaemoglobinopathyGeneticTesting "Haemoglobinopathy Genetic Testing (procedure)"
* $nwgmsa#CancerGeneticTesting "Cancer Genetic Testing (procedure)"
