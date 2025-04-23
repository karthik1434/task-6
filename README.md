
## 🧱 Infrastructure Components

- **VPC** with Public Subnets
- **Internet Gateway (IGW)** and **Route Table**
- **Application Load Balancer (ALB)** with Security Group
- **ECS Cluster** using **Fargate**
- **ECR** for Docker image storage
- **Security Groups** for ALB and ECS Tasks
- **IAM Roles** for ECS Tasks execution

## ⚙️ GitHub Actions Workflow

Triggered on **push to the main branch**:
1. Checks out the repo
2. Builds Docker image
3. Pushes image to Amazon ECR
4. Initializes and applies Terraform config
5. Optionally destroys resources after 10 minutes (for demo environments)

> 💡 Terraform version used: `1.6
# 🚀 Strapi Deployment on AWS ECS Fargate with Terraform & GitHub Actions

This project deploys a **Strapi CMS** application on **Amazon ECS Fargate**, with full automation using **Docker**, **Terraform**, and **GitHub Actions**. The infrastructure includes networking (VPC, subnets, IGW), ECS cluster, Application Load Balancer (ALB), and ECR integration for container image hosting.

---

## 📦 Project Structure


---

## 🔧 Infrastructure Overview

- **VPC** and **public subnets**
- **Internet Gateway (IGW)** and **Route Tables**
- **Application Load Balancer (ALB)** with listener on port 80
- **Security Groups**:
  - ALB SG (HTTP access from `0.0.0.0/0`)
  - ECS Task SG (Access only from ALB SG)
- **ECS Fargate Cluster**
  - Task Definition using Docker image from ECR
  - ECS Service attached to the ALB
- **Amazon ECR** to store Docker image
- **IAM roles** for ECS task execution

---

## 🛠️ GitHub Actions Workflow

**File:** `.github/workflows/deploy.yml`

### Triggers
- Runs on every push to `main` branch.

### Steps
1. **Checkout repo**
2. **Set up Docker**
3. **Configure AWS credentials**
4. **Create ECR repo if it doesn’t exist**
5. **Build & push Docker image to ECR**
6. **Set up Terraform**
7. **Run `terraform init` and `terraform apply`**
8. **Wait 10 minutes and destroy resources (for demo purposes)**

---

## 🚢 Docker Image

**Dockerfile Location:** `docker/Dockerfile`

```Dockerfile
FROM node:18

WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

EXPOSE 1337
CMD ["yarn", "start"]
