resource "aws_instance" "my-instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-security-group.id]
  tags = {
    Name = "HelloWorld"
    environment = "development"
  }
ebs_block_device {
  delete_on_termination =  true
  volume_size = 50
  volume_type = "gp2"
  device_name = "/dev/sdb"
}
}