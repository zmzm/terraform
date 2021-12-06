resource "aws_security_group" "http_server_sg" {
  # name, vpc_id  is very importants because it's forces new resource creation
  name        = "http_server_sg"
  description = "Allow HTTP/SSH inbound/outbound traffic"
  vpc_id      = "vpc-0dd32c134eec70aa4"

  # HTTP traffic
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "name" = "http_server_sg "
  }
}

resource "aws_instance" "http_server" {
  ami             = "ami-0ed9277fb7eb570c9"
  instance_type   = "t2.micro"
  key_name        = "default_ec2"
  security_groups = [aws_security_group.http_server_sg.id]
  subnet_id       = "subnet-082bb22982366b048"

}
