module "network" {
  source          = "./network"
  access_ip       = var.access_ip
  vpc_cidr        = local.vpc_cidr
  security_groups = local.security_groups
}

module "ec2" {
  source                = "./ec2"
  public_security_group = module.network.public_security_group
  public_subnet         = module.network.public_subnet
  internet_gateway      = module.network.internet_gateway_id
}