# How to Import Resources via Import tag
This guide provides instructions for importing AWS resources which have a unique tag associated with them to signify they should be imported.
This process is used for both console provisioned resources and CloudFormation provisioned resources.

## Steps for Importing Resources via Unique Tag
### 1. Identify and Tag the Resources to Import

1. Determine which AWS resources need to be imported. Gather details such as:
	- **Resource type** (e.g., VPC, EC2 instance, S3 bucket)
	- **AWS Region** where the resource resides
	- **Resource identifiers** (e.g., instance IDs, bucket names)

**NOTE:** While it is possible for a terraform workspace to manage resources in separate accounts and regions, our process does not currently support that so all resources must all be in the same AWS **and** within the same region.  

Future enhancements may be developed to allow for multi account/region management.

### 2. Tagging Resources for Import

There are 2 tags that will be need for this process:

1. A tag to identify a resources as part of the import.
To selectively import resources using Terraformer, we’ll use the `--filter="Name=tags.<TAG_NAME>"` option. This approach allows you to import only the resources tagged with a specific, unique tag name, ensuring that Terraformer only includes the intended resources in its plan.

2. A tag called **Name**.  The value of this tag will be used to name the imported resource in the generated terraform configuration.

#### Steps to Tag Resources for Import

1. **Choose a Unique Tag Name**:  
   Select a unique tag key that will be used to identify the resources you want to import. For example, use `IMPORT1`, `IMPORT_DEV`, or `TF_IMPORT_DATE` as the tag key. This key should be distinctive to avoid accidentally including resources not meant for import.

2. **Apply Tags to Resources**:  

   In the AWS Console, find each resource you want to import then:
   
   1. Add a tag with the chosen key. For instance, if you chose `IMPORTS_10302024 ` as your tag name, apply this tag to every resource you intend to import.

	   - **Tag Key**: Use the unique tag key you chose (e.g., `IMPORTS_10302024`).
	   - **Tag Value**: You may leave the value blank or set a descriptive value if preferred.
	
	   Example tag:
	   - **Key**: `IMPORTS_10302024 `
	   - **Value**: `OptionalDescription`
  
   2. Add a **Name** tag with an appropriate value.
  
### 3. Open a PR against *main* and Update the Import Log

1. **Create a new branch**
	
	```sh
	git branch -b %branch_name%
	```
2. **Update the Import Log**:  
   In the PR, update an [Import Log](./IMPORT_LOG.md) file to document the resources you plan to import. Follow the import log [instructions](./IMPORT_LOG_INSTRUCTIONS.md)
3. **Commit the changes and push to central repository**
	
	```sh
	git add .
	git commit -m "updated import log with import specifics"
	git push origin %branch_name%
	```
1. **Open a Pull Request (PR)**:  
   Log into github and open a new pull request for your new branch against *main* in your repository. 


### 4. Trigger the Import Workflow from the pull request

In the GitHub repository, navigate to **Actions** and manually trigger the [1 - Import Tagged Resources](../../.github/workflows/import_tagged_resources.yml) workflow designed for importing resources. When prompted, provide the necessary inputs:


- **Workspace Path**: Select the Terraform workspace path that matches the resource’s environment.  This is a select list, so choose the appropriate value for the account your are importing from.
- **Resources**: A comma delimited list of the resource types you wish to import.  You can see a list of the available values [here](https://github.com/GoogleCloudPlatform/terraformer/tree/master/providers/aws).
	- **NOTE**: There seems to be a terraformer bug when using '*'. Please do not use.
	- The comma delimited list cannot have spaces in it eg. "vpc,s3" not "vpc, s3"
	 
- **AWS Region**: Specify the region where the resource is located.

**Note**: Ensure this workflow is triggered within an open PR. If there is no active PR, the workflow will not execute.

The workflow will perform the follow tasks:

- **Plan the Import with Terraformer**

	The GitHub Action will execute Terraformer to generate a plan for the specified resources. Terraformer scans AWS for the specified resource type and outputs a `plan.json` file, detailing the resource configuration.

- **Run `scripts/cook_plan.py` to Prepare the Plan**

	The `cook_plan.py` script modifies the `plan.json` file to improve resource naming:
	- **Name Tag Check**: It ensures each resource has a `Name` tag. If a resource lacks a `Name` tag, the script will exit, and you’ll need to add a `Name` tag in AWS.
	- **Rename Resources**: For resources with a `Name` tag, the script updates the `ResourceName` to use this tag, providing more meaningful names in Terraform.

-  **Combine original state and imported state local state file**
	- The local state file is located at `<Workspace_Path>/terraform_<TAG_NAME>.tfstate`

-  **Create .tf files for the imported resources**
	- The .tf files are located at `<Workspace_Path>/<Resource_Type>_<TAG_NAME>.tf`

-  **Commit new files to the PR/branch**
	- The created files are pushed into your branch.
	
-  **Run Terraform Plan**
	- The plan is run.  The hope is there are no issues, however, terraform  is built on the idea of separating state and configuration. Because of this, only the state is stored, configuration is not and must be generated programatically.  There is a high probobility that you will need to correct issues in the generated configuration.  

### 5. Fix configuration

If the plan run in the action above results in issues, you must fix them.

```bash

git pull --rebase origin <branch_name>
cd <Workspace_Path>
terraform init

### REPEAT BELOW UNTIL SUCCESSFUL PLAN

	### ----> update .tf files
	
	## NOTE: The plan command below is run against the remote state in 
	## terraform cloud, not the new combined state that is local on the 
	## filesystem, so all the imported resources will show up as being added.  
	## Our goal here is to get a successful plan.  We will plan against the 
	## combined state later.
	
	terraform plan -var-file="env/prod.tfvars"
```

### 6. Push fixed configuration to repository

```bash
cd <Project_home>
git add .
git commit -m "fixed terraform configuration for <TAG_NAME>"
git push origin <BRANCH_NAME>
```

### 6. Request a Review from a peer

### 7. Sync and Plan

We are now ready to sync the new state to terraform cloud.

In the GitHub repository, navigate to **Actions** and manually trigger the [2 - Sync state and plan](../../.github/workflows/sync_and_plan.yml) workflow designed for importing resources. When prompted, provide the necessary input:


- **Workspace Path**: Select the Terraform workspace path that matches the resource’s environment.  This is a select list, so choose the appropriate value for the account your are importing from.

The workflow will perform the follow tasks:

- **Push the new state to terraform**
- **Run a terraform plan**



### 8. Merge
