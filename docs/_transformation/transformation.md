---
title: Data Transformation
layout: home
nav_order: 0
---

# Data transformation

We have a number of VSDS components available to facilitate the onboarding and transformation of raw data into LDES. They're collectively known as the [LDI bundle](https://github.com/Informatievlaanderen/VSDS-Linked-Data-Interactions).

::: info
Linked Data Interactions Repo (LDI) is a bundle of basic components used to receive, generate, transform and output Linked Data.
:::

The LDI project is an effort to make interactions with Linked Data more fluently by providing easy building blocks.

To allow a dataset to be published as LDES, we can use the LDI workbench to transform the original messages to linked data version objects with a specific ontology. These objects are then sent to a LDES Server to ingest, store make available to LDES Client consumers.

The LDI suite of components can achieve this goal:

- Input of data - receive or scrape a remote HTTP endpoint
- Transformation - map the data to a specific ontology, apply various transformations
- Publishing - submit to a preconfigured LDES Server

![High-level steps for transforming LDES include Input, Transformation and output](../assets/images/chart1.png)

While there are multiple ways to handle the mapping of the input data, in this guide, we will focus on using the RML tool.

::: info
The [RMLMapper](https://github.com/RMLio/rmlmapper-java) and the [RMLStreamer](https://github.com/RMLio/RMLStreamer) are applications for Linux, Windows, and macOS machines for generating knowledge graphs. They both rely on [declarative rules](https://rml.io/#rules) that define how the knowledge graphs are generated. Get started immediately by following the instructions on their GitHub repositories.
:::