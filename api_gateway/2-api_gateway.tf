data "kubernetes_service" "lanchonete_pedido_app_svc" {
  metadata {
    name      = "pedido-app-svc"
    namespace = "lanchonete-pedido"
  }
}

data "kubernetes_service" "lanchonete_produto_app_svc" {
  metadata {
    name      = "produto-app-svc"
    namespace = "lanchonete-produto"
  }
}

data "kubernetes_service" "lanchonete_pagamento_app_svc" {
  metadata {
    name      = "pagamento-app-svc"
    namespace = "lanchonete-pagamento"
  }
}

resource "aws_api_gateway_rest_api" "main" {
  name        = "lanchonete_gateway"
  description = "Lanchonete Gateway used for EKS. Managed by Terraform."
  endpoint_configuration {
    types = ["REGIONAL"]
  }

  depends_on = [
    data.kubernetes_service.lanchonete_pedido_app_svc,
    data.kubernetes_service.lanchonete_produto_app_svc,
    data.kubernetes_service.lanchonete_pagamento_app_svc
  ]
}
