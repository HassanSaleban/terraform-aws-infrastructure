# Configuration Terraform pour AWS RÉEL

terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider AWS - Configuration Réelle
provider "aws" {
  region = "us-east-1" # Ireland (votre région)
  
  # AWS utilisera automatiquement vos credentials
  # configurées avec: aws configure
  
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Project   = "AWS-Learning"
      Owner     = "dataska"
    }
  }
}