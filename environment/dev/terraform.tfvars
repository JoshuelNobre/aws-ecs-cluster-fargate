project_name = "linux-tips-ecs-cluster"

region = "us-east-1"

environment = "dev"

#### SSM VPC Parameters ####

ssm_vpc_id = "/linuxtips-vpc/vpc/vpc_id"

ssm_public_subnet_1 = "/linuxtips-vpc/vpc/public_subnet_1a"

ssm_public_subnet_2 = "/linuxtips-vpc/vpc/public_subnet_1b"

ssm_public_subnet_3 = "/linuxtips-vpc/vpc/public_subnet_1c"

ssm_private_subnet_1 = "/linuxtips-vpc/vpc/private_subnet_1a"

ssm_private_subnet_2 = "/linuxtips-vpc/vpc/private_subnet_1b"

ssm_private_subnet_3 = "/linuxtips-vpc/vpc/private_subnet_1c"

load_balancer_internal = false

load_balancer_type = "application"