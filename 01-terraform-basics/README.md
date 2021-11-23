# Terraform basics

The terraform [init](https://www.terraform.io/docs/cli/commands/init.html) command is used to initialize a working directory containing Terraform configuration files.

```text
terraform init
```

The terraform [plan](https://www.terraform.io/docs/cli/commands/plan.html) command creates an execution plan. The plan command alone will not actually carry out the proposed changes, and so you can use this command to check whether the proposed changes match what you expected before you apply the changes or share your changes with your team for broader review.

```text
terraform plan
```

The terraform [apply](https://www.terraform.io/docs/cli/commands/plan.html) command executes the actions proposed in a Terraform plan.

```text
terraform apply
```
