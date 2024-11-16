data "aws_lb" "lanchonete_pedido_lb" {
  tags = {
    "kubernetes.io/service-name" = "lanchonete-pedido/pedido-app-svc"
  }
}

data "aws_lb" "lanchonete_produto_lb" {
  tags = {
    "kubernetes.io/service-name" = "lanchonete-produto/produto-app-svc"
  }
}

data "aws_lb" "lanchonete_pagamento_lb" {
  tags = {
    "kubernetes.io/service-name" = "lanchonete-pagamento/pagamento-app-svc"
  }
}

resource "aws_api_gateway_vpc_link" "pedido" {
  name        = "lanchonete_gateway_vpclink_pedido"
  description = "Lanchonete Gateway VPC Link for Pedido. Managed by Terraform."
  target_arns = [data.aws_lb.lanchonete_pedido_lb.arn]
}

resource "aws_api_gateway_vpc_link" "produto" {
  name        = "lanchonete_gateway_vpclink_produto"
  description = "Lanchonete Gateway VPC Link for Produto. Managed by Terraform."
  target_arns = [data.aws_lb.lanchonete_produto_lb.arn]
}

resource "aws_api_gateway_vpc_link" "pagamento" {
  name        = "lanchonete_gateway_vpclink_pagamento"
  description = "Lanchonete Gateway VPC Link for Pagamento. Managed by Terraform."
  target_arns = [data.aws_lb.lanchonete_pagamento_lb.arn]
}
