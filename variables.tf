#### GENERAL CONFIGS ####
# Configurações gerais do projeto

# Nome do projeto - usado como prefixo em todos os recursos
variable "project_name" {}

# Região AWS onde os recursos serão criados
variable "region" {}

# Ambiente (dev, stg, prd, etc.)
variable "environment" {}

#### SSM VPC #####
# Parâmetros do Systems Manager (SSM) para recuperar IDs de rede
# Estes valores são armazenados no SSM Parameter Store por uma infraestrutura de rede pré-existente

# ID da VPC armazenado no SSM Parameter Store
variable "ssm_vpc_id" {}

# IDs das subnets públicas armazenados no SSM (uma por AZ)
variable "ssm_public_subnet_1" {} # Subnet pública AZ 1a

variable "ssm_public_subnet_2" {} # Subnet pública AZ 1b

variable "ssm_public_subnet_3" {} # Subnet pública AZ 1c

# IDs das subnets privadas armazenados no SSM (uma por AZ)
variable "ssm_private_subnet_1" {} # Subnet privada AZ 1a

variable "ssm_private_subnet_2" {} # Subnet privada AZ 1b

variable "ssm_private_subnet_3" {} # Subnet privada AZ 1c

#### BALANCER ####
# Configurações do Application Load Balancer

# Define se o Load Balancer é interno (true) ou voltado para internet (false)
variable "load_balancer_internal" {}

# Tipo do Load Balancer (application, network, gateway)
variable "load_balancer_type" {}

variable "capacity_providers" {
  description = "Lista de provedores de capacidade para o cluster ECS (ex: [\"FARGATE\", \"FARGATE_SPOT\"])"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}