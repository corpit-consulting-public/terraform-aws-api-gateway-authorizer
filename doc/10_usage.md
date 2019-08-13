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
