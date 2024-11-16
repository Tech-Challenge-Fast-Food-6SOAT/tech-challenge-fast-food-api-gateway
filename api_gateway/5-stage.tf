resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.main.id
  stage_name    = local.env
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.pedido.id,
      aws_api_gateway_method.pedido.id,
      aws_api_gateway_integration.pedido.id,
      aws_api_gateway_resource.produto.id,
      aws_api_gateway_method.produto.id,
      aws_api_gateway_integration.produto.id,
      aws_api_gateway_resource.pagamento.id,
      aws_api_gateway_method.pagamento.id,
      aws_api_gateway_integration.pagamento.id,
    ]))
    auto_deploy = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.pedido,
    aws_api_gateway_integration.produto,
    aws_api_gateway_integration.pagamento
  ]
}

output "base_url" {
  value = "${aws_api_gateway_stage.stage.invoke_url}/"
}
