provider "aws" {
  region = "us-east-1" #  region
}

resource "aws_instance" "example" {
  count         = 10
  ami           = "ami-0427090fd1714168b" # Specify your AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformInstance-${count.index}"
  }
}
