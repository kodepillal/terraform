resource "aws_key_pair" "deployer" {
  key_name   = "kodepillal"
  public_key = trimspace(tls_private_key.rsa-4096-example.public_key_openssh)
}

resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private-key" {
  content  = tls_private_key.rsa-4096-example.private_key_pem
  filename = "kodepillal.pem"
}
