resource "aws_security_group" "mydb" {
  name        = "mydb"
  description = "Allow Postgres Connections From Bastion"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "SSH From Bastion"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  tags = {
    Name = "mydb"
  }
}

resource "aws_db_instance" "mydb" {
  allocated_storage      = 10
  identifier             = "mydb"
  db_name                = "mydb"
  engine                 = "postgres"
  engine_version         = "13.7"
  instance_class         = "db.t3.micro"
  username               = "foo"
  password               = "foobarbaz"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.mydb.id]
}