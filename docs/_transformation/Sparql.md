---
title: Sparql
layout: home
nav_order: 2
---

# Sparql

SPARQL, an acronym for SPARQL Protocol and RDF Query Language, is a powerful language designed primarily for querying and manipulating RDF (Resource Description Framework) data. Its versatility and expressiveness make it an ideal tool for converting various data formats into Linked Data, aligning with Flanders OSLO ontologies.

Using SPARQL, existing data sources can be mapped to OSLO (Open Standards for Linking Organizations) ontologies. These ontologies define a set of concepts and relationships important for public administration, local government, and related entities.

SPARQL queries can extract relevant data from existing databases or data sources. Afterwards, the extracted data is then transformed into RDF triples, aligned with OSLO models.

## Some examples

Following Sparql snippit transforms a dataset with longitude and latitude into a wkt string:

``` bind(strdt(concat("POINT(",str(?longitude)," ",str(?latitude),")"),geo:wktLiteral) as ?wkt) . ```

Following Sparql snippit transforms the timeslot value in the a 

```
  ?data :timeSlot ?timeSlot .
  bind(strdt(concat(replace(?date,"/","-"),"T",?timeSlot,"Z"),xsd:dateTime) as ?timestamp) .
  ```

Following Sparql snippit creates a unique URI by combining guid and the exact timestamp:

``` bind(uri(concat("https://www.signco.be/id/measuring-point/",?guid, "#", str(?timestamp))) as ?graph) . ```

