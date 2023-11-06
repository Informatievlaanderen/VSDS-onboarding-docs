---
title: Data Discovery and Inventory
layout: home
nav_order: 0
---

# Data Discovery and Inventory

## Identify Data to be published

As a first step, one needs to clearly identify the datasets to be published as LDES.

- Establish the origin of the data
- Establish the parameters for storing and using the data

## Discovery

This process usually depends on the type of data being exposed. In order to publish a dataset in the form of LDES, the data must be semantically described using one or more data models.

The value of publishing data sets through LDES lies in the easy interlinking of data between companies and organizations over the Web. Selecting the correct model to describe the data, as well as reusing the same model to describe the same kind of data is one of the means to facilitate client consumers.

An example of a domain-specific model describing sensors, measurements, and observations is [OSLO](https://www.vlaanderen.be/digitaal-vlaanderen/onze-oplossingen/oslo).

- Data is openly available in a predefined format

- The format is structured and non-proprietary

- The format follows [W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium) standards using [RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework) and [URIs](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)

- The format links to other related objects to provide context (e.g. an Observation links to a Sensor or a Location).