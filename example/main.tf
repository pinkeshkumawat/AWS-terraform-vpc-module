module "vpc" {
  source = "../modules/vpc/"

  for_each = var.vpcs

  cidr = each.value.vpc_cidr
  name = each.key
  enable_dns_hostnames = each.value.enable_dns_hostnames
  enable_dns_support = each.value.enable_dns_support
  tags = merge(var.common_tags, var.vpc_tags)
}

module "internet_gateway" {
  source = "../modules/internet_gateway/"

  for_each = var.internet_gateways

  name = each.key
  vpc_id = module.vpc[each.value.vpc_name].id
  tags = merge(var.common_tags, var.igw_tags)
}

module "subnet" {
  source = "../modules/subnet/"

  for_each = var.subnets
  
  name = each.key
  availability_zone = each.value.az
  cidr = each.value.cidr
  vpc_id = module.vpc[each.value.vpc_name].id
  map_public_ip_on_launch = lookup(each.value, "map_public_ip_on_launch", false)
  tags = merge(var.common_tags, var.subnet_tags)
}

module "nat_gateway" {
  source = "../modules/nat_gateway/"

  for_each = var.nat_gateways

  name = each.key
  subnet_id = module.subnet[each.value.subnet].id
  tags = merge(var.common_tags, var.nat_gateway_tags)
}

module "route_table" {
  source = "../modules/route_table/"

  for_each = var.route_tables

  name = each.key
  subnet_id = module.subnet[each.value.subnet].id
  vpc_id = module.vpc[each.value.vpc_name].id
  tags = merge(var.common_tags, var.route_table_tags)
}

module "routes" {
  source = "../modules/route_table/routes/"

  for_each = var.routes

  route_table_id = module.route_table[each.value.route_table_name].id
  destination_cidr_block = each.value.cidr
  gateway_id = lookup(each.value, "igw_name", "") != "" ? module.internet_gateway[each.value.igw_name].id : null
  nat_gateway_id = lookup(each.value, "nat_gw_name", "") != "" ? module.nat_gateway[each.value.nat_gw_name].id : null
}