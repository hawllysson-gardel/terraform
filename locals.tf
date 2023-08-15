locals {
  vpc_cidr = "10.1.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public_security_group"
      description = "Security Group for Public Access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }

        portainer = {
          from        = 9000
          to          = 9000
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }

        nifi_web_port = {
          from        = 8080
          to          = 8080
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nifi_secure_web_port = {
          from        = 8443
          to          = 8443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nifi_remote_port = {
          from        = 10000
          to          = 10000
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nifi_data_input_port = {
          from        = 8000
          to          = 8000
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nifi_additional_port = {
          from        = 8181
          to          = 8181
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
      }
    }
  }
}
