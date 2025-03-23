# HW24 – EC2 and Load Balancer (AWS Project)

This project is part of the **High Scalability Architecture (HSA13)** homework assignment.  
It demonstrates a simple setup of:

- Two EC2 instances running a basic web server (Apache)
- An **Application Load Balancer (ALB)** that distributes traffic between them

> ⚠️ In the current setup, both instances are running, but traffic is always routed to **Instance-2** — likely due to sticky sessions or ALB health check state.

---

## 🌐 Live Demo

You can test the result via the public DNS of the Load Balancer:

🔗 **[WebALB-1693581179.eu-north-1.elb.amazonaws.com](http://WebALB-1693581179.eu-north-1.elb.amazonaws.com)**

Expected output:

Hello from Instance-1 or Hello from Instance-2


Currently shows:  
**"Привіт з Instance-2"** (which means "Hello from Instance-2")


![изображение](https://github.com/user-attachments/assets/43756faf-a86b-4886-9952-f29128fc285b)

![изображение](https://github.com/user-attachments/assets/5fcfe048-fed9-4b5e-a20d-46818f3273cf)



---

## ⚙️ What This Project Does

- Launches **two t3.micro EC2 instances**
- Installs **Apache HTTP Server**
- Sets up a simple home page with a unique message per instance
- Deploys an **Application Load Balancer**
- Connects both EC2s to the ALB via a Target Group
- Exposes the setup via public DNS

---

## 🚀 Deployment Guide

### ✅ Prerequisites

Make sure you have:

- An active AWS account
- An existing **SSH Key Pair** (for EC2 access)
- A **VPC** with two public **subnets** in different Availability Zones

### 🧱 Deploy via AWS Console

1. Go to [AWS CloudFormation](https://console.aws.amazon.com/cloudformation)
2. Choose **Create Stack > With new resources (standard)**
3. Upload `ec2_alb_template.yaml`
4. Fill in the parameters:
   - **KeyName**: name of your SSH key
   - **VPC ID**: your target VPC
   - **Subnet1 / Subnet2**: two public subnets in different AZs
5. Click **Next**, then **Create Stack**

In a few minutes, the stack will complete and provide the Load Balancer DNS in **Outputs**

---

## 🛠 Technologies Used

- AWS EC2
- AWS CloudFormation
- Application Load Balancer (ALB)
- Apache HTTP Server
- Amazon Linux 2

---

## 🔍 Troubleshooting

- If only one instance returns traffic, check:
  - ALB **Health Checks** (ensure both instances return 200 on `/`)
  - **Sticky Sessions** settings
  - EC2 **user data** and Apache status

---

## 🧹 Cleanup

To avoid unwanted AWS charges:

1. Go to **CloudFormation**
2. Select the stack (e.g., `my-test-stack`)
3. Click **Delete**

---

## 📄 License

This project is for educational purposes only.

---
