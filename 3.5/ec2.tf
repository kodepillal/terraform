resource "aws_instance" "my-instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"

  tags = {
    Name        = "HelloWorld"
    environment = "development"
  }
}
