# terraform aws rds db resource info:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
# https://github.com/cloudposse/terraform-aws-rds/blob/main/main.tf

resource "aws_db_instance" "default" {
  availability_zone = "us-east-1a"
  allocated_storage = 10
  db_name = "mydb"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  username = var.db_username
  password = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot = true
  port = var.database_port
  identifier = "mydb"
  publicly_accessible = true
  vpc_security_group_ids = [aws_security_group.allow_custom_tcp.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet.name
}

resource "aws_db_subnet_group" "my_db_subnet" {
  name = "my_db_subnet_group"
  subnet_ids = [
    var.subnet_id,
    aws_subnet.subnet_2.id
    ]

  tags = {
    Name = "My DB Subnet Group"
  }
}