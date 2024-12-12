# NIS-AWS-Accounts

## Overview

This repository contains Terraform configurations for deploying and managing infrastructure across multiple AWS accounts. By leveraging Terraform’s modular design, this setup ensures consistent deployment of cloud resources while maintaining separation of environments (e.g., development, staging, production) across different AWS accounts.


## Prerequisites
Before using this repository, ensure the following prerequisites are met:

- **Terraform Installed**  
  Install the latest version of Terraform. Refer to the [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

- **Terraform Cloud Access**  
  Ensure you have access to the Terraform Cloud workspace(s) used for managing state. See the [Terraform Cloud documentation](https://developer.hashicorp.com/terraform/cloud).

- **Git Installed**  
  Ensure Git is installed for managing this repository. Download it from the [Git website](https://git-scm.com/).

## Repository Structure

The repository is organized as follows:

```
├── .github/            # GitHub-specific configurations
│   └── workflows/      # CI/CD pipelines for automated processes
├── accounts/           # Separate folders for each AWS account
│   ├── SBOX-9434/      # Development Sandbox (last 4 digits of the account ID)
│   │   ├── baseline/   # Terraform managed by the NIS-AWS team
│   │   │   └── baseline-workspace-1/  # First workspace for baseline configurations
│   │   │   └── baseline-workspace-2/  # Second workspace for baseline configurations
│   │   │   └── …                   	  # Additional baseline workspaces as needed
│   │   └── customer/   # GitHub submodule for app dev team Terraform code
│   ├── XXX-1234/       # Example Account 1
│   │   ├── baseline/   # Terraform managed by the NIS-AWS team
│   │   └── customer/   # GitHub submodule for app dev team Terraform code
│   └── YYY-4567/       # Example Account 2
│       ├── baseline/   # Terraform managed by the NIS-AWS team
│       └── customer/   # GitHub submodule for app dev team Terraform code
├── documents/ 
│   └── imports/        # Guides and information on importing resources into Terraform
├── modules/            # Custom Terraform modules
└── README.md           # Start here
```
### Folder Details
- **`.github/workflows/`**  
  Contains CI/CD pipeline configurations for automating workflows. Common use cases include:
  - Linting and validating Terraform code.
  - Running automated tests.
  - Applying Terraform changes via pull requests.
- **`accounts/`**  
  Each folder corresponds to a specific AWS account. The folder name includes a short description of the account, followed by the last four digits of the AWS account ID. Within each account folder:
  - **`baseline/`**: Contains Terraform configurations managed by the NIS-AWS team. These configurations define foundational resources and account-level infrastructure.
    	- **`baseline-workspace/`**: Allows the NIS-AWS team to organize baseline configurations into multiple Terraform workspaces if needed.
  - **`customer/`**: A GitHub submodule used by the application development team. This folder houses Terraform configurations for workloads specific to the applications deployed in that account.
- **`documents/`**  
  Contains documentation related to the repository, processes, and workflows.
  - **`imports/`**: Provides detailed guides and instructions for importing existing AWS resources into the Terraform workspaces. Use these resources to standardize infrastructure management.
- **`modules/`**  
  Contains reusable Terraform modules for common infrastructure patterns. Use these modules to define and deploy shared components across multiple environments.
- **`README.md`**  
  This file provides an overview of the repository, usage instructions, and best practices for managing infrastructure across multiple AWS accounts.
- **`modules/`**  
  Contains reusable Terraform modules for common infrastructure patterns. Use these modules to define and deploy shared components across multiple environments.

## Usage

This section provides instructions for setting up and using Terraform to deploy and manage infrastructure across multiple AWS accounts.

### Steps to Use the Repository

1. **Clone the Repository**

   Clone the repository to your local machine:

   ```bash
   git clone <repository-url>
   cd <repository-name>
	```


1. **Initialize Submodules**

   If your repository includes Git submodules for the customer/ directories, initialize and update them:

   ```bash
   git submodule update --init --recursive
	```

### Workflow Overview

1. **Navigate to the Desired Workspace Directory**

   Navigate to the workspace folder corresponding to the environment or AWS account where you want to deploy:

   ```bash
   cd accounts/SBOX-9434/baseline/baseline-workspace
	```

1. **Create a Branch**  

   Developers create a new branch for their changes:

   ```bash
   git checkout -b <branch-name>
   ```

1. **Make Changes**  

   Modify the Terraform configuration in the appropriate directory (e.g., accounts/<account-id>/baseline/).

1. **Local Validation and Planning**

   Developers can optionally run validation and planning locally to ensure their changes are syntactically correct and do not introduce unintended changes:

   ```bash
   terraform init
	terraform validate
	terraform plan -var-file="env/prod.tfvars"
	```

1. **Open a Pull Request (PR)**

   Once changes are ready, push the branch to the repository and open a pull request:
   
   ```bash
   git add .
	git commit -m "Description of the change"
	git push origin <branch-name>
	```

	Create the PR in GitHub for review.
	
1. **CI/CD Validation**  
   The repository is configured with GitHub Actions to validate the changes automatically:
   - **Terraform Plan**: Ensures the plan passes without errors.
   - **Terraform Apply (Dry Run)**: Simulates an apply to verify there are no runtime issues.

   If any validation steps fail, the developer must fix the errors locally, push the changes, and ensure the GitHub Actions pass.

1. **Request Code/Peer Review**  
   Once the required GitHub Actions pass, request a code/peer review from a team member. This ensures the changes are reviewed for correctness, standards, and best practices.

1. **Merge the PR**  
   After the code is approved, the PR can be merged into the main branch. This triggers the next stage of the CI/CD process.

1. **Terraform Apply via GitHub Action**  
   On merge, a GitHub Action runs `terraform apply` in Terraform Cloud to apply the changes to the infrastructure.  
   **Important**: The apply step is not auto-approved. A team member must log in to Terraform Cloud and manually approve the apply to complete the deployment.


## Importing Existing Resources

In cases where resources already exist in your AWS accounts, you can import them into Terraform for consistent management. Resources may be:

	•	Managed by Terraform in different workspaces.
	•	Created through CloudFormation stacks.
	•	Provisioned directly via the AWS Management Console or CLI.

Follow the steps outlined in the [Importing Existing Resources Guide](./documents/import/README.md) to consolidate these resources into this Terraform configuration.



## Troubleshooting

This section provides guidance on resolving common issues that may arise while using the repository.

### Common Issues and Solutions

#### 1. **Git Submodules Not Initialized**
   - **Issue**: The `customer/` directory appears empty or missing files.
   - **Solution**:
     Initialize and update the submodules:
     ```bash
     git submodule update --init --recursive
     ```

#### 2. **Terraform Backend Errors**
   - **Issue**: Errors related to the remote backend configuration, such as `Error acquiring the state lock!`.
   - **Solution**:
     - Ensure no other Terraform process is running and holding the lock.
     - If the lock persists, manually release it in Terraform Cloud.

#### 3. **GitHub Actions Validation Fails**
   - **Issue**: The Terraform plan or apply step fails during CI/CD validation.
   - **Solution**:
     - Review the error logs provided by the GitHub Action.
     - Correct the configuration locally and re-run `terraform validate` and `terraform plan` to ensure the issue is resolved.
     - Push the updated changes to your branch:
     
       ```bash
       git add .
       git commit -m "Fix for CI/CD failure"
       git push
       ```

#### 4. **Approval Step Missed**
   - **Issue**: Terraform apply does not complete after merging a PR.
   - **Solution**:
     - Ensure a team member logs in to Terraform Cloud and approves the apply step in the `Runs` tab for the corresponding workspace.

#### 5. **Conflicting Changes During Merge**
   - **Issue**: Merge conflicts occur when trying to merge a PR into the main branch.
   - **Solution**:
     - Pull the latest changes from the main branch:
       ```bash
       git pull origin main
       ```
     - Resolve conflicts locally, test the changes, and push the resolved code:
       ```bash
       git push origin <feature-branch-name>
       ```

#### 6. **State File Locking Issues**
   - **Issue**: Terraform state becomes locked, and further operations cannot proceed.
   - **Solution**:
     - Verify the lock in Terraform Cloud and manually release it if necessary.
     - Avoid running multiple `terraform apply` commands simultaneously for the same workspace.

### General Tips
- Check logs for detailed error messages in GitHub Actions or Terraform Cloud.
- Validate and test your changes locally before pushing to a branch.
- Use `terraform plan` regularly to preview changes and catch potential issues early.
- Regularly sync your branch with the main branch to reduce the likelihood of conflicts:

  ```bash
  git pull origin main
  ```