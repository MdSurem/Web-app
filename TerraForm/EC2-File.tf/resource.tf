resource "aws_instance" "flm" {
  tags = {
    Name = var.iname
  }

  ami                    = var.ami_id
  instance_type          = var.itype
  key_name               = var.key_id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  count                  = var.icount
}
