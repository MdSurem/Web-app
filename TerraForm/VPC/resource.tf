
resource "aws_vpc" "myvpc" {
  tags = {
    Name = "terraform-vpc"
  }
  cidr_block           = "11.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
}


resource "aws_subnet" "mysn-1" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "terraform-public-sn"
  }
  availability_zone       = "us-east-1a"
  cidr_block              = "11.0.1.0/24"
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "mysn-2" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "terraform-private-sn"
  }
  availability_zone = "us-east-1b"
  cidr_block        = "11.0.2.0/24"
}

resource "aws_internet_gateway" "myigw" {
  tags = {
    Name = "terraform-igw"
  }
  vpc_id = aws_vpc.myvpc.id
}


resource "aws_eip" "nat" {
  domain  = "vpc"
}


resource "aws_nat_gateway" "my-nat" {
  tags = {
    Name = "terraform-nat"
  }
  allocation_id     = aws_eip.nat.id
  subnet_id         = aws_subnet.mysn-1.id
  connectivity_type = "public"
}


resource "aws_route_table" "my-public-rt" {
  tags = {
    Name = "terraform-public-rt"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}


resource "aws_route_table" "my-private-rt" {
  tags = {
    Name = "terraform-private-rt"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat.id
  }
}

resource "aws_route_table_association" "myassoc-pub" {
  subnet_id      = aws_subnet.mysn-1.id
  route_table_id = aws_route_table.my-public-rt.id
}

resource "aws_route_table_association" "myassoc-priv" {
  subnet_id      = aws_subnet.mysn-2.id
  route_table_id = aws_route_table.my-private-rt.id
}
