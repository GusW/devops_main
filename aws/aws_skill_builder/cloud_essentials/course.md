# Cloud Essentials Learning Path

<https://explore.skillbuilder.aws/learn/lp/82/cloud-essentials-learning-plan>

---

## Overview

## [Guide](./media/Ramp-Up_Guide_CloudPractitioner.pdf)

---

## 1 - Job Roles in the Cloud

### 1.1 AWS Cloud for Business

More companies are seeing the value and benefit of moving to a cloud environment.

The traditional on-premises model for managing IT applications and infrastructure is highly manual and often uses expensive equipment at less than full capacity. In contrast, an AWS Cloud environment helps businesses drive innovation because of its ability to increase development speed and provide near-limitless scale. And the speed, scale, innovation, and productivity benefits help businesses pursue bigger, broader digital opportunities, now and in the future.

Speed: With the AWS Cloud, organizations can experiment with applications and new business models at lower cost and greater speed.

Scale: The AWS Cloud creates opportunities for organizations to scale products almost instantaneously to a broader set of customer segments, geographies, and channels.

Innovation: Using the AWS Cloud means that roles that were once required for on premises will move to a shared responsibility model. This frees up your team to innovate and use technologies such as advanced analytics, the Internet of Things, or IoT, and automation at scale.

Productivity: The adoption of cloud principles such as infrastructure and security as code helps to automate compliance and other routine processes, which speeds up productivity.

The AWS Global Cloud Infrastructure is the most secure, extensive, and reliable cloud platform, offering more than 200 fully featured services from data centers globally. Whether you need to deploy your application workloads across the globe in a single click or you want to build and deploy specific applications closer to your end-users with single-digit millisecond latency, AWS provides you the cloud infrastructure where and when you need it.

### 1.2 On-premises Job Roles

Each organization has a different way to structure their IT department; there is no set rule. Today, you will learn about the critical roles of an on-premises IT department.

#### 1.2.1 IT Solutions Architect

The IT Solutions Architect creates the high-level solutions for business applications, systems, portfolios, infrastructures, or an entire enterprise.

They develop IT services and solutions for companies and organizations and often design and manage communications, security, networking, and storage.

#### 1.2.2 System Administrator

The System Administrator keeps servers operational. They ensure servers meet uptime goals. They are responsible for patching or upgrading operating systems, hardware, and hypervisors. They make sure system backups occur.

#### 1.2.3 Network Administrator

Network Administrators administer network access points. They are concerned with security around personnel access, configurations, and virtual private networks (VPNs).

#### 1.2.4 Desktop Administrator

The Desktop Administrator administers installing and maintaining applications on desktop and laptop computers. They work with the Network Administrator for network and security configurations.

#### 1.2.5 Application Administrator

The Applications Administrator handles web and customer applications. They work with the System Administrator to host and maintain applications on servers. They also partner with the Network Administrator for application access control.

#### 1.2.6 Database Administrator

The Database Administrator administers databases by working with the System Administrator on the servers that the database is on. They work with the Network Administrator for database access control.

### 1.3 Shared Responsibility Model

<https://aws.amazon.com/compliance/shared-responsibility-model/>

**AWS is responsible for security of the cloud and customer is responsible for security in the cloud.**

This shared model can help relieve customers' operational burden

- AWS operates, manages, and controls the components from the host operating system and virtualization layer down to the physical security of the facilities in which the service operates.
- The customer assumes responsibility and management of the guest operating system, including updates and security patches. The customer also assumes responsibility for other associated application software and the configuration of the AWS provided security group firewall.

### 1.4 Job Roles in the Cloud

#### 1.4.1 Cloud Architect

The Cloud Architect is responsible for delivering an overall cloud strategy and is in charge of the entire cloud environment. The Cloud Architect builds a business’s cloud architecture blueprint to deliver highly available, cost-efficient, and scalable cloud environments.

This role supervises deployment in the cloud environment and application architecture for all aspects of the cloud. It is critical that a Cloud Architect is knowledgeable enough to be your business’s AWS Cloud subject matter expert and the go-to for anything related to the cloud.

- Understands how services are connected and the integration of services
- Understands Amazon CloudWatch and logging
- Understands AWS Identity and Access Management (IAM) and the security involved

#### 1.4.2 System Administrator

The System Administrator is responsible for overall performance of cloud systems. They are the glue that keeps systems working together by managing configurations, completing detailed tasks, and assisting Database Administrators with setting up database servers in the cloud.

A System Administrator in the cloud maintains data integrity by deploying, configuring, and monitoring hybrid and cloud solutions instead of infrastructure performance and maintenance.

It’s essential that the System Administrator is adaptable and proficient with configuration management, requirements gathering, deployment planning, and completing detailed hands-on tasks.

- Proficient with hands-on tasks and detailed configuration changes
- Understands configuration management
- Proficient with requirement gathering and translating to deployments

#### 1.4.3 Security Administrator

When using AWS, you gain the control and confidence you need to securely run a business with the most flexible and secure cloud computing environment available today. Going back to our shared responsibility model, security and compliance is a shared responsibility between AWS and the customer. **AWS is responsible for the security of the cloud, which includes protecting the infrastructure that runs all of the services offered in the AWS Cloud. The customer is responsible for security in the cloud. This is the Security Administrator’s primary responsibility.**

A Security Administrator must be someone that is trusted and exceptionally knowledgeable because they are responsible for the overall integrity, confidentiality, and protection of data and resources in the cloud.

This role is a combination of reactive (investigates when security incidents or concerns are reported) and proactive (puts standards and development processes in place to reduce the number of security incidents). While the Security Administrator does not need to know all of the details of cloud operations, they do define security requirements based on their company’s security and regulatory requirements.

To ensure security in the cloud, the Security Administrator must have a deep understanding of security rules and requirements applicable to their unique business. They must be highly resourceful, because it isn’t possible to memorize every rule or regulation. This role communicates these requirements down to engineers and up to decision makers to understand and address security risks.

- Defines security requirements for enterprise-level businesses based on their security and regulatory requirements
- Understands security rules and requirements
- Communicates security rules down to engineers and up to decision makers to understand and address security risk
- Resourceful because it is not possible to memorize all regulatory requirements
- Researches and is resourceful with contacts to determine an answer to address security

#### 1.4.4 DevOps Administrator

The DevOps Administrator optimizes the use of the AWS Cloud. They help businesses operate at a larger, faster scale by managing developers and orchestrating the numerous tools and stages in the pipeline.

This role creates and maintains processes so that teams and developers can follow the model of small, rapid releases. To do this, this role manages the release cycle to ensure that there is enough pipeline to evaluate changes that need to be made, tested, and pushed to production. Additionally, the DevOps Administrator conducts tests and backs out changes if there are issues. They have the ability to quickly roll back changes if something doesn’t work.

Because the DevOps Administrator is responsible for orchestrating the pipeline, this role must be proficient with programming scripting languages, operations, QA, and testing.

- Applies programming scripting languages with proficiency
- Understands and applies QA and testing
- Understands operations and manages developers
- Orchestrates the many tools and stages in the pipeline

### 1.5 Map On-premises Job Roles to Cloud Job Roles

#### 1.5.1 Cloud Architect

This is typically a lateral move for an IT Solutions Architect. Their day-to-day concern changes from on-premises issues with hardware, HVAC, or server upgrades, for example, to a focus on cloud technology. An example of a task for a Cloud Architect might be to assist a System Administrator who needs help with an integration.

#### 1.5.2 DevOps Administrator

DevOps Administrators implement continuous build, integration, deployment, and infrastructure as code. They review and recommend operational improvements. DevOps Administrators also perform application testing and recovery.

A DevOps Administrator in the cloud is no longer as dependent on other teams to complete their release cycles. It is common for an Application Administrator to move into the DevOps role. Database Administrators can also move into this role, but there might be more of a learning curve as they must learn about the data operations pipeline.

DevOps Administrators typically oversee database and developer teams.

### 1.6 Grow AWS Cloud competences

- [AWS Skills Builder](https://explore.skillbuilder.aws/)
- [AWS Skills Center](https://aws.amazon.com/training/skills-centers/)

---

## 2 - AWS Cloud Practitioner Essentials

## 2.1 Introduction to Amazon Web Services

## 2.2 Compute in the Cloud

## 2.3 Global Infrastructure and Reliability

## 2.4 Networking

## 2.5 Storage and Databases

## 2.6 Security

## 2.7 Monitoring and Analytics

## 2.8 Pricing and Support

## 2.9 Migration and Innovation

## 2.10 The Cloud Journey

## 2.11 AWS Certified Cloud Practitioner Basics

---

## 3 - Getting Started with Cloud Acquisition

---

## 4 - AWS Billing and Cost Management

---

## 5 - AWS Well-Architected

---

## 6 - AWS Foundations: Getting Started with the AWS Cloud Essentials
