# create a security group for ec2 & add inbound rule
resource "aws_security_group" "Instance" {
  name        = "Instance_SG"
  description = "Allow inbound traffic"
  vpc_id = aws_vpc.myvpc_1.id
  

  
  # Define ingress rules to allow inbound traffic on ports 22, 443, and 80
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS access from anywhere
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere
  }
  
  # Define egress rules as needed
  # Example: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
    Name = "SG1"
  }
}