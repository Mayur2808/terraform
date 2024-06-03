provider "aws" {
  region = "us-east-1"  # Change this to the desired AWS region
}

resource "aws_iam_user" "admin_user" {
  name = "admin-user"
}

resource "aws_iam_user_policy_attachment" "admin_user_policy" {
  user       = aws_iam_user.admin_user.name
  policy_arn = var.admin_policy_arn
}

variable "admin_policy_arn" {
  description = "The ARN of the IAM policy to attach to the user"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Define variables for reusability
variable "instance_type" {
  description = "Type of instance to be created"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-00beae93a2d981137"  # Change this to the desired AMI ID
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "dockerfile1"  # Change this to your key pair name
}
variable ""