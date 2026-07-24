# 🚀 Terraform Azure Infrastructure

Production-ready Azure Infrastructure using **Terraform** with reusable modules and multi-environment deployment (**Dev**, **PreProd**, **Prod**).

---

## 📌 Overview

This project automates the provisioning of Microsoft Azure infrastructure using **Infrastructure as Code (IaC)**.

The repository is organized using reusable Terraform modules to simplify infrastructure deployment across multiple environments while following DevOps best practices.

---

## ✨ Features

- Reusable Terraform Modules
- Multi-Environment Deployment
- Infrastructure as Code (IaC)
- Modular Project Structure
- Azure Networking
- Production Ready
- Easy to Scale

---

## 🛠 Azure Resources

- Resource Group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- Public IP
- Linux Virtual Machine
- NAT Gateway
- Bastion
- Application Gateway
- Storage Account

---

## 📂 Project Structure

```
Environment/
│
├── dev/
├── preprod/
└── prod/

module/
├── azurerm_resource_group/
├── azurerm_virtual_network/
├── azurerm_subnet/
├── azurerm_public_ip/
├── azurerm_nsg/
├── azurerm_nat_gateway/
├── azurerm_bastion/
├── azurerm_linux_virtual_machine/
├── azurerm_storage_account/
└── azurerm_application_gateway/
```

---

## ⚙️ Prerequisites

- Terraform >= 1.6
- Azure CLI
- Azure Subscription

---

## 🚀 Deployment

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

---

## 🏗 Terraform Modules

| Module | Purpose |
|---------|----------|
| Resource Group | Creates Resource Groups |
| Virtual Network | Creates VNets |
| Subnet | Creates Subnets |
| NSG | Network Security Rules |
| Public IP | Creates Public IP |
| Linux VM | Deploys Linux Virtual Machine |
| Bastion | Secure VM Access |
| NAT Gateway | Outbound Internet Access |
| Application Gateway | Layer 7 Load Balancer |
| Storage Account | Azure Storage |

---

## 🔧 Technologies

- Terraform
- Microsoft Azure
- Azure CLI
- Infrastructure as Code (IaC)
- Linux

---

## 📖 Future Enhancements

- Azure Kubernetes Service (AKS)
- Azure Monitor
- Log Analytics
- Key Vault
- Azure Firewall
- Private Endpoints

---

## 👨‍💻 Author

**Asmit Kumar Maurya**

Azure DevOps Engineer

- LinkedIn: https://linkedin.com/in/asmit-maurya
- GitHub: https://github.com/asmitmaurya585

---

⭐ If you found this project useful, consider giving it a star.
