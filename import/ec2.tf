# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-0a232144cf20a27a5"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  instance_type                        = "t2.micro"                  
  key_name                             = "ec2-keypair"
  monitoring                           = false
  subnet_id                            = "subnet-0b0e1a5307f990642"

  vpc_security_group_ids      = ["sg-0d873efb3af049fec"]
  tags = {
    Name = "terraform-import"
  }
  
}
