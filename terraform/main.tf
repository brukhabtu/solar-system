terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "=2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://${var.pm_node_name}:8006/api2/json"
  pm_api_token_id = var.pm_api_token_username
  pm_api_token_secret = var.pm_api_token_credential

  pm_tls_insecure = var.pm_tls_insecure
  pm_parallel     = 10
  pm_timeout      = 600
  
  pm_debug = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_vm_qemu" "k3s_vm" {
  name        = "k3s-${count.index}"
  os_type     = "cloud-init"
  agent       = 1

  count       = var.k3s_vm_count
  target_node = var.pm_node_name
  clone       = var.k3s_vm_template_name
  memory      = var.k3s_vm_mem
  cores       = var.k3s_vm_cores

  sshkeys    = var.k3s_vm_ssh_key_public_key
}