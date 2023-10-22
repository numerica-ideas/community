module "network" {
  source                     = "./modules/network"
  vpc_cidr                   = "10.0.0.0/16"
  vpc_name                   = "eks-vpc"
  igw_name                   = "eks-gw"
  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidr_blocks = ["10.0.4.0/24", "10.0.5.0/24"]
  availability_zones         = ["eu-north-1a", "eu-north-1b"]
  public_subnet_name_prefix  = "eks-public-subnet"
  private_subnet_name_prefix = "eks-private-subnet"
  public_rt_name             = "eks-public-rt"
  private_rt_name            = "eks-private-rt"
}

module "security" {
  source                     = "./modules/securitygroup"
  security_group_name        = "eks-securitygroup"
  security_group_description = "desc"
  inbound_port               = [80, 22]
  vpc_id                     = module.network.vpc_id

}

module "eks" {
  source                 = "./modules/eks"
  cluster_name           = "eks-nginx"
  capacity_type          = "SPOT"
  public_subnets         = module.network.public_subnet_ids
  security_group_ids     = [module.security.security_group_id]
  endpoint_public_access = true
  node_group_name        = "green"
  instance_types         = ["t3.medium"]
  desired_size           = 1
  max_size               = 2
  min_size               = 1
  eks_role               = "EksClusterRole"
  node_role              = "EKS-WORKER-NODE-ROLE"

}