# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Define a resource (e.g., an EC2 instance)
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Example-Instance"
  }
}
