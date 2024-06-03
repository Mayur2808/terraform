provider "aws" {
  region = "us-east-1" # Replace with your preferred region
}

terraform {
  backend "s3" {
    bucket = "terraform2801"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# resource "aws_key_pair" "my_key_pair" {
#   key_name   = "my-key-pair"
#   public_key = file("~/.ssh/id_rsa.pub") # Path to your public key
# }

resource "aws_instance" "my_instance" {
  ami           = "ami-00beae93a2d981137" # Replace with your preferred AMI ID
  instance_type = "t2.micro"

  key_name = aws_key_pair.dockerfile1_key_pair.key_name

  tags = {
    Name = "MyInstance"
  }
}

resource "aws_iam_user" "admin_user" {
  name = "admin-user"
}

resource "aws_iam_user_policy_attachment" "admin_user_policy" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


