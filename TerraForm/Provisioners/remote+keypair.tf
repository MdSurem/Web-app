resource "aws_instance" "one" {
  tags = {
    Name = "my-instance"
  }
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.micro"
  count         = 1
  key_name      = aws_key_pair.my-key.key_name
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/root/.ssh/id_rsa")
      host        = self.public_ip
    }
    inline = [
      "echo 'hello buddy'",
      "sudo mkdir surem",
      "sudo cd surem",
      "sudo touch aws.txt",
    ]
  }
}


resource "aws_key_pair" "my-key" {
  key_name   = "puchki"
  public_key = file("/root/.ssh/id_rsa.pub")
}
