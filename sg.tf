resource "aws_security_group" "alb" {
  name        = "alb-code"
  description = "80"
  vpc_id      = aws_vpc.v1.id  # Assumes you created the VPC with resource name `aws_vpc.utc_app`

  ingress {
    description = "Allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "Allow 443"
    from_port   = 443
    to_port     = 443
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
    Name       = "webserver-sg"
    env        = "dev"
    team       = "wdp"
    created_by = "Toki"
  }
}

resource "aws_security_group" "WS" {
  name        = "webser-alb"
  description = "80"
  vpc_id      = aws_vpc.v1.id # Assumes you created the VPC with resource name `aws_vpc.utc_app`

  ingress {
    description = "Allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb.id]
#    cidr_blocks = [ "0.0.0.0/0" ]
  }

#  ingress {
#    description = "Allow port 8080 from anywhere"
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "webserver-sg"
    env        = "dev"
    team       = "wdp"
    created_by = "Toki"
  }
}

