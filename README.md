# CS312Minecraft: AWS Minecraft Server with Terraform & Docker

## Overview
This project provisions a Minecraft server on AWS using Terraform for infrastructure and Docker for server management. The server is set up to automatically restart on reboot for high availability.

## Requirements
- **AWS Account** with permissions for EC2, Security Groups, and Elastic IPs
- **AWS CLI** (`aws configure` to set credentials)
- **Terraform**
- **Git**
- **Docker** (installed automatically on the EC2 instance)

## Setup Steps

1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd CS312Minecraft
   ```

2. **Configure AWS CLI:**
   ```sh
   aws configure
   ```

3. **Provision infrastructure with Terraform:**
   ```sh
   cd terraform
   terraform init
   terraform apply
   ```
   - Note the public IP output after apply.

4. **Copy and run the setup script on your EC2 instance:**
   ```sh
   scp -i /path/to/minecraft-key ./scripts/setup.sh ubuntu@<instance_public_ip>:/tmp/
   ssh -i /path/to/minecraft-key ubuntu@<instance_public_ip>
   sudo bash /tmp/setup.sh
   ```

5. **Check server status:**
   - On your EC2 instance:
     ```sh
     sudo docker ps
     sudo docker logs minecraft_mc_1
     ```
   - From your local machine:
     ```sh
     nmap -sV -Pn -p T:25565 <instance_public_ip>
     ```

6. **Connect with Minecraft:**
   - Use `<instance_public_ip>:25565` in your Minecraft client.

## Troubleshooting
- Ensure your security group and subnet route table allow inbound traffic on ports 22 (SSH) and 25565 (Minecraft).
- If the server fails to start, check Docker logs for Java version errors and ensure you are using the correct image (`itzg/minecraft-server:java21`).

## Cleanup
To destroy all AWS resources:
```sh
cd terraform
terraform destroy
```

---

**For any issues, check the logs and AWS Console, or reach out for support.**