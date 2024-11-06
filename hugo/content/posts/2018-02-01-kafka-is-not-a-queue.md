---
author:
  display_name: afiestas
  email: alex@afiestas.org
  first_name: Àlex
  last_name: Fiestas
  login: afiestas
categories:
  - Data
date: '2018-02-01T22:31:59Z'
published: '2018-02-01T22:31:59Z'
tags:
  - Kafka
  - Devops
  - Data
  - DataPipeline
  - AMQP
  - RabbitMQ
slug: kafka-not-your-message-bus-heres-why
title: Kafka is Not Your Message Bus—Here’s Why
---

Kafka is awesome. Its unique approach to log aggregation and messaging allows it to scale to **Gbs/s** while persisting every message (hence the "log aggregation" part).

But, like everything in engineering, building Kafka required a series of deliberate trade-offs. The choices made by the LinkedIn team were pivotal in creating something fundamentally different from traditional messaging systems like RabbitMQ. Had they chosen differently, Kafka might look much closer to RabbitMQ than it does today.

### Who keeps track of what (pull vs push)
After reading the [original Kafka paper](https://www.microsoft.com/en-us/research/wp-content/uploads/2017/09/Kafka.pdf), I believe that Kafka’s way of tracking consumer state is by far the biggest trade-off—the one that makes Kafka an incredible log aggregator and a less ideal  choice for many messaging scenarios.

In a typical messaging system like ActiveMQ or RabbitMQ, the consumer subscribes to a resource (topic, queue, etc.) and waits for the server to *push* messages. The server is responsible for receiving, tracking, and routing messages as they arrive, usually offering low latency.

Kafka takes a different approach: it’s the consumer that decides what to pull and how to pull it, making Kafka essentially stateless on the server side when it comes to message processing. Or, put another way, Kafka’s main focus is on log aggregation and appending messages to a log, and that's about it.

This pull-based model allows Kafka to absorb an enormous volume of messages but makes it challenging to implement many patterns typical in traditional queueing systems.

### Pros and Cons of Kafka as a Queue

#### Pros:
- **Throughput efficiency**: For both, *ingestion* and *consumption* kafka's architecture is unbeatable compared to classical queues.
- **Persistence**: Kafka treats every message as a persistent log entry, ensuring durability and allowing consumers to seek trhough messages at any point.
- **Consumer Flexibility**: Because consumers manage their own state, Kafka offers flexibility in how each consumer reads messages.

#### Cons:
- **Limited Queue Semantics**: Kafka’s lack of push-based delivery makes it tough to implement queueing patterns like work distribution, message prioritization, or direct response queues that require more control over message delivery.
- **Consumer reaction time**: Consumer state is maintained on an eventually consistent basis, so there may be a delay before the system responds when a consumer shuts down or rejoins.
- **Latency**: Disk is slow, so Kafka’s latency can’t match in-memory messaging systems.

### Conclusions:
Think twice before adding any messaging system to your architecture, chacnes are that you do
not need any at all and if you do then analyze the tradeoffs made by each solution and pick
the one that adjust the more to your needs and not the trendiest one.


