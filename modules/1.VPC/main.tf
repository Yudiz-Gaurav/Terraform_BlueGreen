# ==============================================================================
#                               ✨ Create VPC ✨
# ==============================================================================

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "TF-VPC"
  }
}

# ==============================================================================
#                           ✨ Subnet Configuration ✨
# ==============================================================================

# Public Subnet-1
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-PublicSubnet-1"
  }
}

# Public Subnet-2
resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[1]
  availability_zone = data.aws_availability_zones.az.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-PublicSubnet-2"
  }
}

# Public Subnet-3
resource "aws_subnet" "public-subnet-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[2]
  availability_zone = data.aws_availability_zones.az.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-PublicSubnet-3"
  }
}

# Private Subnet-1
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "TF-PrivateSubnet-1"
  }
}

# Private Subnet-2
resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "TF-PrivateSubnet-2"
  }
}

# Private Subnet-3
resource "aws_subnet" "private-subnet-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[2]
  availability_zone = data.aws_availability_zones.az.names[2]

  tags = {
    Name = "TF-PrivateSubnet-3"
  }
}

# ==============================================================================
#                          ✨ Create IGW (Internet Gateway) ✨
# ==============================================================================

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-InternetGateway"
  }
}

# ==============================================================================
#                      ✨ Create Public and Private Route Tables ✨
# ==============================================================================

# Public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-PublicRouteTable"
  }
}

# Private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-PrivateRouteTable"
  }
}

# ==============================================================================
#                 ✨ Add Public and Private Subnets to Route Tables ✨
# ==============================================================================

# Add public subnets to public route table
resource "aws_route_table_association" "public_subnet_association-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Add private subnets to private route table
resource "aws_route_table_association" "private_subnet_association-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private_route_table.id
}

# More associations for other subnets...

# ==============================================================================
#                     ✨ Create NAT Gateway in Public Subnet ✨
# ==============================================================================

resource "aws_eip" "nat" {
  tags = {
    Name = "TF-EIP"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "TF-NAT-Gateway"
  }
}

# ==============================================================================
#                           ✨ Create VPC Security Group ✨
# ==============================================================================

resource "aws_security_group" "vpc_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.main.id


  ingress {
    description = "All Inbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound Rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-VPC-SG"
  }
}
