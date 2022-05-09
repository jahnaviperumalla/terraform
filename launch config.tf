resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "ami-04505e74c0741db8d" 
  instance_type = "t2.micro"
  key_name = "jahnavi-keypair"
security_groups = [ "${aws_security_group.demosg.id}" ]
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
lifecycle {
    create_before_destroy = true
  }
}

# Creating Security Group for Ec2
resource "aws_security_group" "demosg" {
  name        = "Demo Security Group for ec2"
  description = "Demo Module for ec2"
  vpc_id      = "${aws_vpc.demovpc.id}"
# Inbound Rules
  # All traffic access from load balncer
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    security_groups = [ "${aws_security_group.demosg.id}" ]
  }

# Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Creating s3 bucket
resource "aws_s3_bucket" "b" {
  bucket = "jahnavi-tf-test-bucket"

  tags = {
    Name        = "jahnavi-tf-test-bucket"
  }
}

#Creating another s3 bucket
resource "aws_s3_bucket" "b1" {
  bucket = "jahnavi-tf-test-bucket1"

  tags = {
    Name        = "jahnavi-tf-test-bucket1"
  }
}

#Creating 3rd s3 bucket
resource " "b2" {
  bucket = "jahnavi-tf-test-bucket2"

  tags = {
    Name        = "jahnavi-tf-test-bucket2"
  }
}