
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "master-key" {
  key_name   = "paris"
  public_key = file("~/.ssh/id_rsa.pub")

}
resource "aws_instance" "test_server" {

  ami = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server_sg.id]
  key_name               = aws_key_pair.master-key.key_name
//  user_data              = file("user_data.sh")
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_1.id
  tags = {
    Name = "Server-Dev"

  }
}


resource "aws_security_group" "server_sg" {

  name        = "Server-Dev Security Group"
  description = "Dev SecurityGroup"
  vpc_id      = aws_vpc.vpc_app.id
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.external_ip]
    }
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.external_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dev Server SecurityGroup"

  }
}

