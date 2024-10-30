# NIS-AWS-Accounts

## Overview

This repository contains Terraform configurations for deploying and managing infrastructure across multiple AWS accounts. By leveraging Terraform’s modular design this setup enables consistent deployment of cloud resources while maintaining separation of environments (e.g., development, staging, production) in different AWS accounts.

## Prerequisites

## Repository Structure
```
├── modules/            # Custom Terraform modules
├── accounts/           # Separate folders for each AWS account
│   │                   # name of each folder is some description followed by the last 4 of the account id
│   ├── SBOX-9434/        
│   ├── XXX-1234/
│   └── YYY-4567/
└── README.md           # Start here
```
## Usage
This section provides detailed instructions on setting up and executing Terraform for multi-account, multi-environment deployments. Follow these steps to configure AWS credentials, manage Terraform state, and apply the infrastructure changes.

### Configuration

TODO

### Terraform Backend

TODO

### Execution

TODO 

## Managing Multiple AWS Accounts

TODO 

## Importing Existing Resources

In cases where AWS resources already exist within your accounts, this section provides guidance on importing them into Terraform. Some resources may already be managed by Terraform in different workspaces, by CloudFormation stacks, or were provisioned directly through the AWS Console.

To standardize infrastructure management, follow the import instructions to consolidate these resources into the current Terraform configuration.  

You can find instructions in the [Importing Existing Resources Guide](./documents/import/README.md).


## Troubleshooting 

