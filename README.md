# Infra-Terraform-AWS-example

Ceci a été créé pour un rapport technique d’étudiant du cours MGL805 à l’automne 2021 pour migrer une application web vers le « serverless ».

Ce répertoire a comme fonction de monter cette architecture multicouche rapidement afin de suivre un guide spécifique de migration dans Amazon Web Services (AWS)

## **website architecture (on-demand)**
![three tier architecture](on-demand-website-architecture.png)


# Requis
* Un compte de [AWS](https://aws.amazon.com/free/)
* Avoir [Terraform installé](https://www.terraform.io/downloads.html)

L'architecture qui sera générée ne sera pas exactement comme l'architecture;
- L' « Application Load Balancing » du backend donne accès à tous au lieu de le limiter aux instances du frontend. Il faut configurer un [private link](https://aws.amazon.com/elasticloadbalancing/faqs/) ce qui dépasse le but de cet exemple;
- Dans l'exemple, la base de données peut se retrouver dans un des deux sous-réseaux privés;
- L'application de backend générée n'est pas réellement un backend, mais le frontend et le backend peuvent configurés en modifiant les scripts qui se trouvent sous le dossier on_demand_website/scripts ou [ici](on_demand_website/scripts)

# Initializer l'environnement

1. Télécharger ce dossier par git ou zip
2. Changer au repertoire `on_demand_website`
3. Générer une clé asymétrique ou utiliser une clé publique existante et ajouter le chemin vers la clé (par défaut, il y a mykey.pub)
4. Vérifier les variables inputs.tfvars si elles correspondent aux valeurs attendues. Vous pourrez même activer la variable `password` en enlevant `#`.
4. (optionnel) Configurer une base de données mysql pour vérifier la migration vers le serverless
   - (option 1) changer la valeur `module.vpc.private_subnets` par `module.vpc.public_subnets` de la variable `private_subnets` qui se trouve sous le module `db_mysql` dans le fichier `main.tf` (ligne 96). Ensuite, se connecter à la base de données avec votre ordi. Il y a un exemple de base de données: https://dev.mysql.com/doc/mysql-getting-started/en/
   - (option 2) se connecter par ssh dans une des instances du backend pour l'utiliser comme bastion

```bash
cd on_demand_website
terraform init
terraform plan --var-file configs/inputs.tfvars -out plan
terraform apply plan
```

Pour générer une clé avec ssh
```bash
ssh-keygen -t ed25519 -f mykey
```

