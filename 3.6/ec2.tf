resource "aws_instance" "my-instance" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.my-security-group.id, aws_security_group.my-jenkins-security-group.id]
  tags = {
    Name        = "Kodepillal"
    environment = "development"
  }
  ebs_block_device {
    delete_on_termination = true
    volume_size           = 50
    volume_type           = "gp2"
    device_name           = "/dev/sdb"
  }
}
resource "aws_security_group" "my-security-group" {
  name        = "my-sg"
  description = "allow 22 and 80 ports"
  vpc_id      = "vpc-074d34831f7dd8c7d"

  ingress {
    description = "allow 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow 80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    environment = "dev"
    Name        = "ssh-sg"
  }

}

resource "aws_security_group" "my-jenkins-security-group" {
  name        = "my-jenkins-sg"
  description = "allow 8080"
  vpc_id      = "vpc-074d34831f7dd8c7d"



  ingress {
    description = "allow 80 port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    environment = "dev"
    Name        = "jenkins-sg"
  }

}

