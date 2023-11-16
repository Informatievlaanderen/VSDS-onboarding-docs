---
title: Versioning data
layout: home
nav_order: 0
---

# Versioning data

Data versioning offers two key benefits for both data users and providers. Firstly, it enables users to focus on relevant data within a specific timeframe. For instance, a train schedule app doesn't need last month's delay data. Versioning allows providers to create 'snapshot' versions, marking dataset milestones. Users can then update their datasets by downloading only new changes (deltas) since these snapshots. This approach reduces the need for users to repeatedly download the entire dataset with each update, as they only need the latest changes. Providers also benefit as storing deltas reduces the redundancy of data storage.

