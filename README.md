# Deprecated

# terraform-aws-authorizer

Terraform module that creates Api Gateway Authorizer resources in AWS

* Required Modules :

  * If the type is COGNITO_USER_POOLS Requires the  Module [Cognito-User-Pool](https://registry.terraform.io/modules/corpit-consulting-public/cognito-user-pool/aws/0.1.3)
  * If the type is TOKEN Requires the  Module [Lambda-Function](https://registry.terraform.io/modules/corpit-consulting-public/lambda-function-mod/aws/0.1.3) for a Lambda function using a single authorization token submitted in a custom header
  * If the type is REQUEST Requires the Module [Lambda-Function](https://registry.terraform.io/modules/corpit-consulting-public/lambda-function-mod/aws/0.1.3) for a Lambda function using incoming request parameter
  * Requires Module Api Gateway [Rest Api](https://registry.terraform.io/modules/corpit-consulting-public/api-gateway-rest-api/aws/0.1.1)
## Usage

```hcl

module "api_gateway_authorizer" {
  source                 = "./modules/terraform-aws-api-gateway-authorizer"
  name                   = "${var.name}"
  rest_api_id            = "${module.gw_rest_api.id}"
  provider_arns          = ["${module.CognitoUserPool.arn}"]
  type                   = "${var.type}"
}

```

* _provider arns if a type "COGNITO USER POOL" is used_

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorizer\_credentials | The credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN. | string | `""` | no |
| authorizer\_result\_ttl\_in\_seconds | The TTL of cached authorizer results in seconds. Defaults to 300. | string | `"300"` | no |
| authorizer\_uri | (Optional, required for type TOKEN/REQUEST) The authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api}, e.g. arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations | string | `""` | no |
| identity\_source | he source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g. method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName | string | `"method.request.header.Authorization"` | no |
| identity\_validation\_expression | A validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response | string | `""` | no |
| name | The name of the authorizer | string | n/a | yes |
| provider\_arns | (Optional, required for type COGNITO_USER_POOLS) A list of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}. | list | `<list>` | no |
| rest\_api\_id | The ID of the associated REST API | string | n/a | yes |
| type | The type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN. | string | `""` | no |

