🏗️ Local Infrastructure Automation Suite
A local Infrastructure-as-Code (IaC) environment built with Terraform and Docker, simulating a real production infrastructure workflow. Deploys an Nginx web server and a Python monitoring dashboard with full container networking — all provisioned and torn down automatically.

📌 Project Overview
This project demonstrates end-to-end infrastructure automation using industry-standard DevOps tools. Instead of manually setting up servers, everything is defined as code — reproducible, version-controlled, and consistent across environments.

🚀 Features

Infrastructure as Code — entire environment defined in Terraform (main.tf)
Containerised Services — Nginx web server and Python monitor deployed via Docker
Container Networking — services communicate over a defined Docker network
Python Monitoring Dashboard — real-time system health tracking
Automated Provisioning — single command to spin up the full environment
Automated Teardown — clean destruction of all resources with terraform destroy
Reusable Modules — Terraform config structured for easy reuse


🛠️ Tech Stack
ToolPurposeTerraformInfrastructure provisioning and lifecycle managementDockerContainer runtime for all servicesDockerfileCustom image builds for Python monitorNginxWeb server containerPythonMonitoring dashboard applicationHCLTerraform configuration language

📁 Project Structure
local-infrastructure-automation-suite/
├── main.tf                        # Terraform configuration (providers, resources)
├── .terraform.lock.hcl            # Terraform dependency lock file
├── .gitignore                     # Ignores .terraform/, secrets, state files
├── monitor/                       # Python monitoring dashboard
│   ├── Dockerfile                 # Docker image for the monitor app
│   └── app.py                     # Python monitoring application
└── screenshots/                   # Project screenshots showing live deployment

⚙️ Prerequisites
Make sure you have the following installed:

Terraform >= 1.0
Docker (Docker Engine running)
Python 3.x (for local testing of monitor app)


🏃 How to Run
1. Clone the repository
bashgit clone https://github.com/Kith-mini/local-infrastructure-automation-suite.git
cd local-infrastructure-automation-suite
2. Initialise Terraform
bashterraform init
3. Preview the infrastructure plan
bashterraform plan
4. Deploy the full environment
bashterraform apply
Type yes when prompted. Terraform will provision all Docker containers and networking automatically.
5. Verify services are running
bashdocker ps
6. Tear down everything
bashterraform destroy

📸 Screenshots

Live deployment screenshots are available in the screenshots/ folder.


💡 What I Learned

Writing Terraform configurations to manage Docker resources as infrastructure
Defining container networking so services can communicate securely
Building custom Docker images with Dockerfiles
Simulating a real production IaC workflow locally without cloud costs
Structuring projects for reproducibility and documentation


🗺️ Future Improvements

 Add Prometheus + Grafana for advanced monitoring
 Deploy to AWS using the same Terraform config (swap Docker provider for AWS provider)
 Add GitHub Actions CI pipeline to validate Terraform on every push
 Add variable files (terraform.tfvars) for configurable environments


👩‍💻 Author
Kithmini Athma

GitHub: @Kith-mini
LinkedIn: kithmini-athma
Location: Sydney, NSW, Australia


📄 License
This project is open source and available under the MIT License.
