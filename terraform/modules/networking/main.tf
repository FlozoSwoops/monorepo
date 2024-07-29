resource "aws_vpc" "assessment_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "assessment-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id     = aws_vpc.assessment_vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block = element(var.public_subnets, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id     = aws_vpc.assessment_vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block = element(var.private_subnets, count.index)

  tags = {
    Name = "eks-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.assessment_vpc.id

  tags = {
    Name = "eks-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.assessment_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "eks-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}