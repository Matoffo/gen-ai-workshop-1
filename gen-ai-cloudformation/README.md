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

### Deploying `knowledge-base.yaml` from SageMaker Notebook Instance

1. Open the AWS Management Console and navigate to the SageMaker AI service.
2. Select "Notebook instances" from the left-hand menu and click on the name of your notebook instance (e.g., `genai-workshop-notebook`).
3. Ensure that the IAM role associated with the notebook instance has the necessary permissions to create CloudFormation stacks and access other required AWS services.
4. Once the notebook instance is in the "InService" state, click on the "Open Jupyter" link next to the instance name.
5. In Jupyter Lab, open the existing notebook for the workshop.
6. Run all cells in the notebook to deploy the `knowledge-base.yaml` stack.

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
