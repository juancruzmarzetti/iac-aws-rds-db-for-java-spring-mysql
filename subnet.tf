resource "aws_subnet" "subnet_2" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_us_east_1b"
  }
}