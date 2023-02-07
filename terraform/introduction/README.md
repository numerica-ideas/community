# Introduction to Terraform
[Terraform](https://developer.hashicorp.com/terraform) is widely defined as a cloud-agnostic tool used to deploy resources no matter the provider involved, but it's more than that, since it works on-premises as well, and a provider can be anything else than cloud environments, like Kubernetes clusters and Docker instances can be automated as well. Terraform is about being intermediate to create and manage resources for anything that has an accessible API defined as a provider.

The sample code covers the creation of an **ec2 instance on AWS** associated with a **security group** with **Nginx** installed and serving on port **80**.

YouTube Video: https://youtu.be/tJ6L1332WU4

[![TerraformWorkflow](10C193E5-FDF4-48A9-8E4F-845B816D74E3.png)](https://youtu.be/tJ6L1332WU4)

## Setup: Terraform CLI and VSCode
- **Download**: https://developer.hashicorp.com/terraform/downloads
- **VSCode extension**: https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform

## General concepts
- **HCL**: Hashicorp configuration language.
- **Backend**: while automating your infrastructure, Terraform keeps a state of your resources in a location called the backend.
- **Provider**: The provider is one of the most important parts of your Terraform configurations since it specifies the place you would like your resources to be created. A few well-known providers are AWS, MS Azure, GCP, and Docker.
- **Resources**: resources are anything that we create on the provider side, eg: a server instance or a network component.
- **Input variables**: to simply put it, variables are a way to make your configurations more dynamic and flexible, with a simple change you can easily switch the region to deploy your resources to, or even easily change the type of instance you would like to create (from t2.micro to t3.medium). Generally defined in a file called variables with a tf extension.
- **Outputs**: since Terraform used the providers’ APIs, at the end of the automation, each resource sent back a response that generally gives more information about the resources we just updated, this information is called Outputs. Generally defined in a file called outputs.tf printed in the screen once you ran the apply command unless you defined them as sensitive. 

## Commands
- `terraform init`: initializes the project by downloading local data, modules, providers, and the state file.
- `terraform fmt`: code formatting.
- `terraform version`: gets the installed Terraform version.
- `terraform validate`: syntax validation for error checking.
- `terraform plan`: generates an execution plan corresponding to your configurations (.tf files) changes.
- `terraform apply`: generates an execution plan and applies it once approved, the -auto-approve flag could be used.
- `terraform destroy`: destroys previously-created infrastructure, it’s an alias for “terraform apply -destroy”.
- `terraform help`: displays the documentation of Terraform CLI commands.

## Advantages
- **Automation**: infrastructure as code (IaC).
- **Cloud-agnostic**: it enables multi-cloud deployment strategies using the same language (Hashicorp Configuration Language) to specify your Cloud infrastructure.
- The **declarative** approach of defining your cloud resources, vs imperative. Over here you declare your intentions, but not the steps to follow to reach them, Terraform is responsible to handle the orchestration to give you what you want.
- Terraform is **stateful**: roll-back is easily manageable since you can version your infrastructure state via a generated file.
- **Integrates** well with existing Software Development workflows.
- Terraform is modular and favors the **DRY principle (Do Not Repeat Yourself)** in order to write high-quality and reusable codes.
