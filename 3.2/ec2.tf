resource "aws_instance" "my-instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"

  tags = {
    Name        = "HelloWorld"
    environment = "development"
  }
  root_block_device {
    delete_on_termination = true
    volume_size           = 50
    volume_type           = "gp2"
  }
}
