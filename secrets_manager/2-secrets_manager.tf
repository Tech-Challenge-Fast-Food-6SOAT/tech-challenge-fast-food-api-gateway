# data "aws_api_gateway_rest_api" "lanchonete_gateway" {
#   name = "lanchonete_gateway"
# }

resource "aws_secretsmanager_secret" "api_gateway_base_url" {
  name = "LANCHONETE_API"
}

resource "aws_secretsmanager_secret_version" "api_gateway_base_url" {
  secret_id     = aws_secretsmanager_secret.api_gateway_base_url.id
  secret_string = "http://localhost:4000"
  # secret_string = "https://${data.aws_api_gateway_rest_api.lanchonete_gateway.id}.execute-api.${local.region}.amazonaws.com/prod"
}
