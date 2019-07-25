resource "aws_api_gateway_authorizer" "authorizer_1" {
  name                   = "${var.name}"
  rest_api_id            = "${var.rest_api_id}"
  authorizer_uri         = "${var.authorizer_uri}"
  provider_arns          = "${var.provider_arns}"
  type                   = "${var.type}"
}
