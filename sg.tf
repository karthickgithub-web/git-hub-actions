# Create the Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-server-security-group-2022"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = "vpc-0ffde819dac5b7639"

  # Ingress Rule for SSH (Port 22)
  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Ingress Rule for HTTP (Port 80)
  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Egress Rule (All outbound traffic allowed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "Web_Security_Group_2022"
  }
}
