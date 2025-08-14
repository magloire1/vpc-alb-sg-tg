resource "aws_instance" "server-1" {
  availability_zone = "us-east-1a"
  ami = "ami-0e1989e836322f58b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.WS.id]
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv1.id
  tags = {
    Name = "webserver-1"
  }
}
resource "aws_instance" "server-2" {
  availability_zone = "us-east-1b"
  ami = "ami-0e1989e836322f58b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.WS.id]
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv2.id 
  tags = {
    Name = "webserve-2"
  }
}