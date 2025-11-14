# Outputs pour AWS Réel

# AMI utilisée
output "ami_id" {
  description = "ID de l'AMI Linux utilisée"
  value       = data.aws_ami.amazon_linux.id
}

output "ami_name" {
  description = "Nom de l'AMI Linux"
  value       = data.aws_ami.amazon_linux.name
}

# Instance EC2
output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "IP publique de l'instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_type_used" {
  description = "Type d'instance utilisé"
  value       = var.instance_type
}

# RDS Database
output "rds_endpoint" {
  description = "Endpoint de connexion RDS"
  value       = aws_db_instance.learning_db.endpoint
}

output "rds_database_name" {
  description = "Nom de la base de données"
  value       = aws_db_instance.learning_db.db_name
}

output "rds_username" {
  description = "Username RDS"
  value       = aws_db_instance.learning_db.username
  sensitive   = true
}



# Informations générales
output "environment" {
  description = "Environnement de déploiement"
  value       = var.environment
}

output "aws_region" {
  description = "Région AWS utilisée"
  value       = "us-east-1"
}