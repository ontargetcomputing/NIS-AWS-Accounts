# Importing Existing Resources

When integrating existing resources into a new or consolidated Terraform workspace, it's essential to follow tailored steps for each type of management source. This document provides background on the import process and guides users to specific instructions based on how each resource was originally managed.

## Background

NIS AWS currently supports cloud resources deployed through various tools and processes, such as:
- **Terraform-managed resources**: Resources that are currently tracked by other Terraform workspaces.
- **CloudFormation-managed resources**: Resources managed through AWS CloudFormation stacks.
- **Console-provisioned resources**: Resources created manually via the AWS Console, not managed by IaC.

To ensure consistent infrastructure management, importing these resources into Terraform standardizes their configurations, enabling unified and automated control. The import process involves identifying the original management tool, handling dependencies, and carefully mapping each resource’s state to Terraform.

### Import Guidelines

Each type of managed resource has unique considerations and steps for successful import. Refer to the appropriate guide below for step-by-step instructions:

- **Terraform-Managed Resources**  
  Resources managed by other Terraform workspaces or configurations need a controlled migration to avoid state conflicts. [See the Terraform-Managed Import Guide](./Terraform_Managed_Import.md)

- **CloudFormation-Managed Resources**  
  Resources managed within CloudFormation stacks should be imported with care to avoid interrupting stack dependencies. [See the CloudFormation-Managed Import Guide](./CloudFormation_Managed_Import.md)

- **Console-Provisioned Resources**  
  Resources manually created in the AWS Console can be imported directly into Terraform, but require accurate configuration mapping. [See the Console-Provisioned Import Guide](./Console_Provisioned_Import.md)

### General Tips for Importing

- **Backup State Files**: Always back up existing state files before starting the import process.
- **Mapping Configuration**: Ensure that your Terraform configurations accurately reflect resource attributes to prevent import errors.
- **Testing**: Use a test environment to confirm the import process before applying to production resources.

By following these guidelines, you can reliably consolidate existing resources under Terraform management, enhancing control, compliance, and automation across your infrastructure.