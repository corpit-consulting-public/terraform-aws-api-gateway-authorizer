variable "authorizer_uri" {
  type        = "string"
  description = " (Optional, required for type TOKEN/REQUEST) The authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api}, e.g. arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations"
  default     = ""
}

variable "name" {
  type        = "string"
  description = "The name of the authorizer"
}

variable "rest_api_id" {
  type        = "string"
  description = "The ID of the associated REST API"
}

variable "identity_source" {
  type        = "string"
  description = "he source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g. method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName"
  default     = "method.request.header.Authorization"
}

variable "type" {
  type        = "string"
  description = "The type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN."
  default     = ""
}

variable "authorizer_credentials" {
  type        = "string"
  description = "The credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN."
  default     = ""
}

variable "authorizer_result_ttl_in_seconds" {
  type        = "string"
  description = "The TTL of cached authorizer results in seconds. Defaults to 300."
  default     = "300"
}

variable "identity_validation_expression" {
  type        = "string"
  description = "A validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response"
  default     = ""
}

variable "provider_arns" {
  type        = "list"
  description = "(Optional, required for type COGNITO_USER_POOLS) A list of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}."
  default     = []
}  

variable "authorizer_type" {
  type = "string"
  default = "cognito_user_pools"
}
