module "secure_vpc" {
  source = "../../modules/secure-vpc"

  name               = "dev"
  vpc_cidr           = "10.10.0.0/16"
  availability_zones = ["ca-central-1a", "ca-central-1b"]

  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]

  enable_nat_gateway      = true
  flow_log_retention_days = 30

  tags = {
    Environment = "dev"
    Project     = "cloud-security-platform"
    ManagedBy   = "terraform"
  }
}