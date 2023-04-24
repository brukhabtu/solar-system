variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default = "pluto"
}

variable "pm_api_token_username" {
  type = string
}

variable "pm_api_token_credential" {
  type = string
  sensitive = true
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}

variable "k3s_vm_count" {
  default = 2
}

variable "k3s_vm_cores" {
  default = 2
}

variable "k3s_vm_mem" {
  default = "4096"
}

variable "k3s_vm_ssh_key_public_key" {
  sensitive = true
}

variable "k3s_vm_template_name" {
    type = string
    default = "k3sos-template"
}

