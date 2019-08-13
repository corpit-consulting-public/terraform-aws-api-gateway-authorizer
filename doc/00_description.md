# terraform-aws-authorizer

Terraform module that creates Api Gateway Authorizer resources in AWS

* Required Modules :

  * If the type is COGNITO_USER_POOLS Requires the  Module [Cognito-User-Pool](https://registry.terraform.io/modules/corpit-consulting-public/cognito-user-pool/aws/0.1.3)
  * If the type is TOKEN Requires the  Module [Lambda-Function](https://registry.terraform.io/modules/corpit-consulting-public/lambda-function-mod/aws/0.1.3) for a Lambda function using a single authorization token submitted in a custom header
  * If the type is REQUEST Requires the Module [Lambda-Function](https://registry.terraform.io/modules/corpit-consulting-public/lambda-function-mod/aws/0.1.3) for a Lambda function using incoming request parameter
  * Requires Module Api Gateway [Rest Api](https://registry.terraform.io/modules/corpit-consulting-public/api-gateway-rest-api/aws/0.1.1)
