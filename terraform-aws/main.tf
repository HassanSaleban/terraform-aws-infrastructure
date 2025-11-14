# Configuration principale : EC2 + RDS + S3 pour AWS Réel

# Data source pour récupérer l'AMI Linux la plus récente
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ========================================
# INSTANCE EC2 - Pour gagner 20$
# ========================================
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name        = "terraform-ec2-learning"
    Environment = var.environment
    Challenge   = "AWS-20-dollars"
  }
}

# ========================================
# RDS DATABASE - Pour gagner 20$
# ========================================
resource "aws_db_instance" "learning_db" {
  identifier = "terraform-learning-db"
  
  # Configuration de base
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"  # Free tier eligible
  allocated_storage = 20
  
  # Credentials
  db_name  = "learningdb"
  username = var.db_username
  password = var.db_password
  
  # Sécurité
  publicly_accessible = false
  skip_final_snapshot = true  # Pour pouvoir détruire facilement
  
  # Performance
  storage_type      = "gp2"
  storage_encrypted = false  # Pour simplifier en apprentissage
  
  tags = {
    Name        = "terraform-rds-learning"
    Environment = var.environment
    Challenge   = "AWS-20-dollars"
  }
}

#