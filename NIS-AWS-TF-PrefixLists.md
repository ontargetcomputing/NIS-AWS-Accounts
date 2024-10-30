# NIS-AWS-TF-PrefixLists

This repository contains Terraform configuration for prefix lists for the NIS AWS Team.
This workspace(s) in this project will eventually be migrated to the NIS-AWS-Accounts repository.

### Prerequisites

Before you begin working with this Terraform project, ensure you have the following tools installed and configured:

#### 1. GitHub Account and Git for Windows
- You will need a GitHub account to clone the repository.
- Install [Git for Windows](https://gitforwindows.org/) to manage version control for this project.
  - After installation, you can use Git Bash, which provides a command-line interface.
  - Verify the installation by opening Git Bash and running:
    ```bash
    git --version
    ```

#### 2. Terraform
- Install [Terraform](https://www.terraform.io/downloads.html) to manage infrastructure as code.
- Ensure you're using the correct version of Terraform, as specified in the project.
  - Minimum version required: `1.9.8`
- To install Terraform on Windows:
  1. Download the Windows binary from the [Terraform download page](https://www.terraform.io/downloads.html).
  2. Extract the `.zip` file and add the folder to your system's PATH environment variable for global access.
- Verify installation by opening PowerShell or Command Prompt and running:
  ```bash
  terraform -version
  ```
  
#### 3. Terraform Cloud Account
- You will need an account on [Terraform Cloud](https://app.terraform.io/signup) for remote state management and collaboration.
- Ensure you have access to the appropriate Terraform Cloud workspace.

#### 4. Terraform Cloud API Token
- Generate a Terraform Cloud API token to authenticate with Terraform Cloud.
  - Log into Terraform Cloud and navigate to **User Settings** > **Tokens** > **Create API token**.
  - Store the token securely and export it in your terminal:
    ```powershell
    $Env:TF_VAR_tfc_token = "<your_token>"
    ```
  - Or use the Terraform CLI to authenticate:
    ```bash
    terraform login
    ```

#### 5. Cloud Provider CLI
Since this project uses AWS, you will need to install the AWS CLI and configure it with your credentials:

- **AWS CLI**
  - [Download AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows.
  - After installation, configure AWS credentials by running the following command:
    ```bash
    aws configure
    ```
  - You will be prompted to enter your AWS Access Key ID, Secret Access Key, default region, and output format.

#### 6. Access to the Repository
- Ensure you have SSH access to the GitHub repository to clone it locally and push any changes.
- Make sure your SSH key is added to your GitHub account. You can follow GitHub's guide on [adding a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
- To clone the repository using SSH, run the following command in Git Bash or your terminal:
  
  ```bash
  git clone git@github.com:your-organization/your-repository.git
  ```
  
## Installation

## Usage

## Input Variables

## Outputs

## Modules

## State Management

## Environment Variables

## Troubleshooting