# Gen AI CloudFormation Workshop

This repository contains the CloudFormation templates for deploying the base infrastructure and the knowledge base for the Gen AI Workshop.

## Prerequisites

Before deploying the CloudFormation templates, ensure you have the following:

- AWS CLI installed and configured
- Necessary IAM permissions to create resources in your AWS account

## Deploying via AWS Management Console

### Deploying `base-infra.yaml`

1. Open the AWS Management Console and navigate to the CloudFormation service.
2. Click on the "Create stack" button and select "With new resources (standard)".
3. In the "Specify template" section, choose "Upload a template file" and upload the `base-infra.yaml` file.
4. Click "Next" and provide a stack name (e.g., `wshop-infra`).
5. Follow the prompts to configure stack options and permissions, then click "Next".
6. Review the stack settings and click "Create stack" to deploy the base infrastructure.

### Deploying `knowledge-base.yaml`

### Creating OpenSearch Collection Index

After deploying the `knowledge-base.yaml` stack, you need to manually create an OpenSearch collection index with the following settings:

1. Open the OpenSearch Dashboards and navigate to the "collection" section, choose created "collection".
2. Go to the JSON field in INDEXES and run the following JSON in the json index field to create the index, also add name below to the index field:

Index Name: `genai-vectors-collection`

  ```json
  {
    "settings": {
      "index.knn": true
    },
    "mappings": {
      "properties": {
        "vector-field": {
          "type": "knn_vector",
          "dimension": 1536,
          "method": {
            "engine": "faiss",
            "name": "hnsw"
          }
        },
        "text": {
          "type": "text"
        },
        "metadata": {
          "type": "keyword"
        }
      }
    }
  }
  ```

> **Note:** Ensure that the OpenSearch collection index is created successfully before proceeding with the next steps.
1. Open the AWS Management Console and navigate to the CloudFormation service.
2. Click on the "Create stack" button and select "With new resources (standard)".
3. In the "Specify template" section, choose "Upload a template file" and upload the `knowledge-base.yaml` file.
4. Click "Next" and provide a stack name (e.g., `wshop-kb`).
5. Follow the prompts to configure stack options and permissions, then click "Next".
6. Review the stack settings and click "Create stack" to deploy the knowledge base.

## Deleting Stacks via AWS Management Console

### Deleting `wshop-infra` Stack

1. Open the AWS Management Console and navigate to the CloudFormation service.
2. In the list of stacks, find the `wshop-infra` stack.
3. Select the stack and click on the "Delete" button.
4. Confirm the deletion when prompted.

### Deleting `wshop-kb` Stack

1. Open the AWS Management Console and navigate to the CloudFormation service.
2. In the list of stacks, find the `wshop-kb` stack.
3. Select the stack and click on the "Delete" button.
4. Confirm the deletion when prompted.


## Deployment via AWS CLI

### Deploying `base-infra.yaml`

1. Navigate to the directory containing the `base-infra.yaml` file.
2. Run the following command to deploy the base infrastructure:

  ```sh
  aws cloudformation create-stack --stack-name wshop-infra --template-body file://base-infra.yaml --capabilities CAPABILITY_NAMED_IAM
  ```

3. Wait for the stack creation to complete. You can check the status using:

  ```sh
  aws cloudformation describe-stacks --stack-name wshop-infra
  ```

### Deploying `knowledge-base.yaml`
1. Open the OpenSearch Dashboards and navigate to the "collection" section, choose created "collection".
2. Go to the JSON field in INDEXES and run the following JSON in the json index field to create the index, also add name below to the index field:

Index Name: `genai-vectors-collection`

  ```json
  {
    "settings": {
      "index.knn": true
    },
    "mappings": {
      "properties": {
        "vector-field": {
          "type": "knn_vector",
          "dimension": 1536,
          "method": {
            "engine": "faiss",
            "name": "hnsw"
          }
        },
        "text": {
          "type": "text"
        },
        "metadata": {
          "type": "keyword"
        }
      }
    }
  }
  ```

> **Note:** Ensure that the OpenSearch collection index is created successfully before proceeding with the next steps.
1. Navigate to the directory containing the `knowledge-base.yaml` file.
2. Run the following command to deploy the knowledge base:

  ```sh
  aws cloudformation create-stack --stack-name wshop-kb --template-body file://knowledge-base.yaml --capabilities CAPABILITY_NAMED_IAM
  ```

3. Wait for the stack creation to complete. You can check the status using:

  ```sh
  aws cloudformation describe-stacks --stack-name wshop-kb
  ```

## Cleanup

To delete the stacks and clean up the resources, run the following commands:

```sh
aws cloudformation delete-stack --stack-name wshop-infra
aws cloudformation delete-stack --stack-name wshop-kb
```