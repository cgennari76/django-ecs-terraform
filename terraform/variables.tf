# core

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-1"
}

# ecs

variable "amis" {
  description = "Which AMI to spawn."
  default = {
    us-west-1 = "ami-0f970e43c203fe1a1"
  }
}
variable "instance_type" {
  default = "t3.micro"
}
variable "docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
  default     = "536233321899.dkr.ecr.us-west-1.amazonaws.com/django-app:latest"
}
variable "app_count" {
  description = "Number of Docker containers to run"
  default     = 2
}

variable "docker_image_url_nginx" {
  description = "Docker image to run in the ECS cluster"
  default     = "536233321899.dkr.ecr.us-west-1.amazonaws.com/nginx:latest"
}
