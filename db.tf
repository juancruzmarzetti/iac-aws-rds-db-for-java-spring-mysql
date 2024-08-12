resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  username             = var.dbusername
  password             = var.dbpassword
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}