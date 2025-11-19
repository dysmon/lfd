variable "firewall_allowed_ports" {
  default = [
    { port = 22, proto = "tcp", name = "ssh" },
    { port = 9090, proto = "tcp", name = "prometheus" },
    { port = 3100, proto = "tcp", name = "loki" },
    { port = 3000, proto = "tcp", name = "grafana" },
    { port = 80, proto = "tcp", name = "http" },
    { port = 443, proto = "tcp", name = "https" },
    { port = 8000, proto = "tcp", name = "backend" }
  ]
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}


variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}


variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}


variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "web-server-1"
}


variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}


variable "ssh_public_key" {
  description = "SSH public key content (username:ssh-rsa ...). Use file('~/.ssh/id_rsa.pub') with terraform CLI or pass as var."
  type        = string
}


variable "ssh_user" {
  description = "Username for SSH key metadata"
  type        = string
  default     = "ubuntu"
}


variable "ssh_cidr" {
  description = "CIDR allowed to access SSH. Replace default before apply (e.g. your ip)"
  type        = string
  default     = "0.0.0.0/0"
}


variable "image_project" {
  description = "Image project for the boot disk"
  type        = string
  default     = "ubuntu-os-cloud"
}


variable "image_family" {
  description = "Image family"
  type        = string
  default     = "ubuntu-2204-lts"
}
