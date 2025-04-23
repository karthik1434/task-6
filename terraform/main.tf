provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./network.tf"
}

module "ecs" {
  source = "./ecs.tf"
}

module "alb" {
  source = "./alb.tf"
}
