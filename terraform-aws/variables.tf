# Déclaration des variables

variable "instance_type" {
  description = "Type d'instance EC2 (modifie toutes les instances)"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"
}

variable "ami_id" {
  description = "ID de l'AMI Linux"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
}

# Variables RDS
variable "db_username" {
  description = "Username pour la base de données"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_password" {
  description = "Mot de passe pour la base de données"
  type        = string
  sensitive   = true
}