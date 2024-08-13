resource "aws_security_group" "allow_custom_tcp" {
  name = "allow_custom_tcp"
  description = "Allow Custom TCP traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port = var.database_port
    to_port = var.database_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_custom_tcp"
  }
}