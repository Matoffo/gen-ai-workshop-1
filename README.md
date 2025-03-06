# Welcome to the GenAI / LLM Workshop Series on AWS Under 90 minutes

Welcome to this multi-part workshop series dedicated to Generative AI (GenAI) and Large Language Models (LLMs) on AWS. These sessions are designed to familiarize you with AWS’s offerings in GenAI and LLMs, providing practical insights into how you can leverage these technologies to empower your business.

## Session 1: Getting Started with GenAI / LLM Infrastructure

Today's session marks the beginning of your GenAI and LLM journey. We will focus on:

- Preparing the right infrastructure on AWS for your GenAI/LLM applications.
- Quickly setting up environments to experiment with GenAI/LLM solutions.

While initial experimentation with GenAI and LLMs may seem straightforward, moving from proof-of-concept to production involves significant effort. Ensuring accurate, consistent, and reliable responses in real-world applications requires careful infrastructure preparation, data handling, and model tuning beyond mere experimentation.

### Infrastructure Components for Today's Session

In this session, we will utilize several powerful AWS infrastructure components specifically designed to streamline your GenAI and LLM application development:

So let us focus on current session topic and lets explore our infrastructure. 
![image.png](/image.png)

- **Document Storage:** Amazon S3 will serve as our robust, scalable storage solution for managing large volumes of documents and data assets required for GenAI applications.

- **Metadata Ingestion Pipeline:** AWS Bedrock offers comprehensive capabilities for metadata ingestion. Although Bedrock provides a default document parsing method that splits documents into fixed-size chunks, this typically yields suboptimal results. Instead, we will leverage semantic parsing during our workshop, offering superior outcomes by retaining meaningful context within documents. For production-grade implementations, significant customization based on your data context and use-case requirements is recommended. This topic will be explored in greater detail in the subsequent session.

- **Knowledge Base:** AWS Bedrock will also be used as the knowledge base, allowing efficient indexing and retrieval of structured and unstructured data, supporting your application's accuracy and relevancy.

- **Vector Database:** We will use AWS Bedrock Serverless Vector Store, a scalable, fully managed vector database solution ideal for managing and querying embeddings, essential for semantic search and contextually relevant information retrieval.

- **User Interface (UI):** AWS SageMaker Notebook will provide a powerful and interactive environment to quickly prototype, analyze, and visualize model outputs, offering ease of experimentation.

- **Retrieval-Augmented Generation (RAG):** We will integrate Flowise, a widely adopted visual framework that accelerates the development of RAG-based applications. Flowise offers seamless integration with a broad range of LLM models, cloud providers, and solutions addressing various cross-cutting concerns such as security, compliance, and monitoring.

- **LLM Model:** For today's exercises, we'll work with advanced models like Deepseek or Claude, both well-suited for a range of GenAI use cases, offering exceptional accuracy and responsiveness.

---

## Upcoming Sessions (Production experience)

### Session 2: Metadata Index Preparation

This session will delve deeper into:

- Properly preparing and structuring your data.
- Extracting and indexing key information to improve the accuracy of GenAI/LLM responses.

You will learn how initial proofs-of-concept (PoCs) might yield impressive early results but often struggle when integrated with your organization's actual data. This session will equip you with strategies to mitigate inaccuracies and irrelevant responses, helping your solutions remain reliable and contextually relevant.

### Session 3: Data Quality and Model Validation

In our third session, the focus will be on:

- Ensuring the accuracy and consistency of your GenAI/LLM solutions.
- Setting up frameworks for validating and monitoring model responses.
- Implementing guardrails to ensure that the solutions remain context-specific.
- Incorporating user feedback loops to continuously enhance the quality and relevance of model outputs in real-time scenarios.

These practices will significantly increase trust and confidence in your GenAI and LLM-driven applications.

---

We're excited to have you join us on this journey to unlock the full potential of GenAI and LLMs with AWS!
