# Region
provider "aws" {
  region = "us-west-1" 
}

# Create an EC2 instance
resource "aws_instance" "ec2-db" {

  ami                         = "ami-0781b2f5146911b9a"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.terraform_subnet.id
  vpc_security_group_ids      = [aws_security_group.terraform_vpc_security_group.id]
  associate_public_ip_address = true
  key_name                    = "narek-es2-2.2-key"
  tags = {
    Name = "ec2-db"
  }
}