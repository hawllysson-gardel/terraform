resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_instance" {
  instance_type          = "t4g.medium"
  ami                    = data.aws_ami.ubuntu.id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [var.public_security_group]
  subnet_id              = var.public_subnet

  user_data = file("${path.root}/ec2/install-dependencies.sh")

  root_block_device {
    volume_size = 10
  }
}

resource "aws_eip" "eip" {
  domain   = "vpc"
  instance = aws_instance.ec2_instance.id
  depends_on = [
    var.internet_gateway,
    aws_instance.ec2_instance
  ]
}
