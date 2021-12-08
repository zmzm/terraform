# Default resources
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "http_server_sg" {
  # name, vpc_id  is very importants because it's forces new resource creation
  name        = "http_server_sg"
  description = "Allow HTTP/SSH inbound/outbound traffic"
  vpc_id      = aws_default_vpc.default.id

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
  subnet_id       = tolist(data.aws_subnet_ids.default_subnets.ids)[2]

  // Custom provisioner need connection
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  // NOTE provisioners should only be used as a last resort
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y", // install apache HTTP server (httpd)
      "sudo service httpd start",
      "echo Virtual server is working at ${self.public_dns} | sudo tee /var/www/html/index.html" // create file index.html and add message 
    ]
  }
}
