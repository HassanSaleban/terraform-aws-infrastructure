# 🚀 Terraform AWS Infrastructure

## 📋 Description
Infrastructure as Code (IaC) pour le provisionnement et la gestion d'instances EC2 sur AWS avec Terraform, orchestré via Docker et LocalStack pour les tests en local.

## 🎯 Objectifs du projet
- Automatiser le déploiement d'infrastructure AWS
- Gérer des instances EC2 avec différents types (t2.micro)
- Utiliser des buckets S3 pour le stockage
- Tester localement avec LocalStack avant le déploiement sur AWS réel
- Pratiquer l'Infrastructure as Code avec Terraform

## 🏗️ Architecture

### Services AWS utilisés
- **EC2** : Instances de calcul (t2.micro)
- **S3** : Stockage d'objets (buckets pour staging et learning)
- **VPC** : Réseau virtuel privé (configuration par défaut)
- **IAM** : Gestion des accès et permissions

### Environnements
- **dev** : Environnement de développement (par défaut)
- **staging** : Environnement de pré-production
- **production** : Environnement de production

## 🛠️ Technologies utilisées
- **Terraform** : v1.x
- **AWS CLI** : Pour l'authentification et les commandes
- **Docker** : Conteneurisation de l'environnement
- **LocalStack** : Émulation AWS locale pour les tests
- **VS Code** : Environnement de développement

## 📦 Prérequis

### Installation requise
```bash
# Terraform
https://www.terraform.io/downloads

# AWS CLI
https://aws.amazon.com/cli/

# Docker Desktop
https://www.docker.com/products/docker-desktop/
```

### Configuration AWS
```bash
# Configurer vos credentials AWS
aws configure
# AWS Access Key ID: [votre clé]
# AWS Secret Access Key: [votre secret]
# Default region name: eu-west-1
# Default output format: json
```

## 🚀 Démarrage rapide

### 1️⃣ Cloner le repository
```bash
git clone https://github.com/HassanSaleban/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure
```

### 2️⃣ Lancer l'environnement Docker (optionnel pour tests locaux)
```bash
# Démarrer LocalStack avec Docker Compose
docker-compose up -d

# Vérifier que LocalStack est actif
docker ps
```

### 3️⃣ Initialiser Terraform
```bash
# Se placer dans le dossier terraform-aws
cd terraform-aws

# Initialiser Terraform (télécharge les providers)
terraform init
```

### 4️⃣ Planifier le déploiement
```bash
# Voir les changements qui seront appliqués
terraform plan

# Ou avec des variables spécifiques
terraform plan -var="environment=dev" -var="instance_type=t2.micro"
```

### 5️⃣ Déployer l'infrastructure
```bash
# Appliquer la configuration
terraform apply

# Confirmer avec 'yes'
```

### 6️⃣ Vérifier le déploiement
```bash
# Lister les instances EC2 créées
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name]" --output table

# Vérifier les buckets S3
aws s3 ls
```

## 📁 Structure du projet

```
terraform-aws-infrastructure/
├── terraform-aws/
│   ├── main.tf              # Configuration principale
│   ├── variables.tf         # Déclaration des variables
│   ├── outputs.tf           # Sorties Terraform
│   └── providers.tf         # Configuration des providers
|
├── docker-compose.yml       # Configuration Docker LocalStack
├── .gitignore              # Fichiers à ignorer
└── README.md               # Ce fichier
```

## ⚙️ Configuration

### Variables disponibles

| Variable | Description | Type | Défaut |
|----------|-------------|------|--------|
| `instance_type` | Type d'instance EC2 | string | `t2.micro` |
| `environment` | Environnement de déploiement | string | `dev` |
| `ami_id` | ID de l'AMI Linux | string | AMI Linux de la région |
| `aws_region` | Région AWS | string | `eu-west-1` |

### Fichier terraform.tfvars (exemple)
```hcl
instance_type = "t2.micro"
environment   = "dev"
aws_region    = "eu-west-1"
ami_id        = "ami-0c1c30571d2dae5c9"  # Amazon Linux 2 eu-west-1
```

## 🧪 Tests avec LocalStack

LocalStack permet de tester votre infrastructure localement avant le déploiement sur AWS.

```bash
# Démarrer LocalStack
docker-compose up -d

# Configurer l'endpoint local
export AWS_ENDPOINT_URL=http://localhost:4566

# Tester Terraform avec LocalStack
terraform init
terraform apply

# Vérifier les ressources créées localement
awslocal ec2 describe-instances
awslocal s3 ls
```

## 🔐 Sécurité

### ⚠️ Bonnes pratiques
- ✅ Ne JAMAIS committer `terraform.tfvars` (contient des données sensibles)
- ✅ Ne JAMAIS committer `*.tfstate` (peut contenir des secrets)
- ✅ Utiliser des variables d'environnement pour les credentials
- ✅ Activer MFA sur votre compte AWS
- ✅ Suivre le principe du moindre privilège pour IAM

### Fichiers sensibles exclus (.gitignore)
```
*.tfvars
*.tfstate
*.tfstate.*
.terraform/
**/.terraform/*
```

## 📊 Commandes utiles

### Terraform
```bash
# Voir l'état actuel
terraform show

# Lister les ressources
terraform state list

# Détruire l'infrastructure
terraform destroy

# Formater le code
terraform fmt

# Valider la configuration
terraform validate
```

### AWS CLI
```bash
# Lister toutes les instances
aws ec2 describe-instances

# Arrêter une instance
aws ec2 stop-instances --instance-ids i-xxxxxxxxx

# Démarrer une instance
aws ec2 start-instances --instance-ids i-xxxxxxxxx

# Terminer une instance
aws ec2 terminate-instances --instance-ids i-xxxxxxxxx
```

## 🎓 Ce que j'ai appris

- ✅ Écriture de code Infrastructure as Code avec Terraform
- ✅ Gestion des instances EC2 et buckets S3
- ✅ Configuration de Docker Compose pour LocalStack
- ✅ Utilisation de l'AWS CLI pour interagir avec les ressources
- ✅ Bonnes pratiques de sécurité et gestion des secrets
- ✅ Tests d'infrastructure en local avant déploiement production
- ✅ Gestion des états Terraform et des variables d'environnement

## 📈 Améliorations futures

- [ ] Ajouter un backend S3 pour stocker l'état Terraform à distance
- [ ] Implémenter des modules Terraform réutilisables
- [ ] Configurer un VPC personnalisé avec sous-réseaux publics/privés
- [ ] Ajouter un Load Balancer pour la haute disponibilité
- [ ] Mettre en place un pipeline CI/CD avec GitHub Actions
- [ ] Configurer la surveillance avec CloudWatch
- [ ] Ajouter des Security Groups plus granulaires

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## 📝 License

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👤 Auteur

**Hassan Saleban**
- GitHub: [@HassanSaleban](https://github.com/HassanSaleban)
- LinkedIn: [Hassan Saleban](https://www.linkedin.com/in/hassan-saleban)

## 🙏 Remerciements

- Documentation officielle Terraform
- Documentation AWS
- Communauté LocalStack
- AWS Training & Certification

---

⭐ Si ce projet vous a aidé, n'hésitez pas à lui donner une étoile !
