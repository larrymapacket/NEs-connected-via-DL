terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
    }
  }
}
provider "equinix" {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

data "equinix_network_account" "metro1" {
  metro_code = var.metro_code_1
  project_id = var.project_id
}

data "equinix_network_account" "metro2" {
  metro_code = var.metro_code_2
  project_id = var.project_id
}

resource "equinix_network_device" "c8000v-metro1" {
  name            = "tf-c8kv-da-larry"
  metro_code      = data.equinix_network_account.metro1.metro_code
  type_code       = "C8000V"
  self_managed    = true
  byol            = true
  package_code    = "network-essentials"
  notifications   = ["lama@equinix.com"]
  hostname        = "C8KV-1"
  account_number  = data.equinix_network_account.metro1.number
  version         = "17.6.6a"
  core_count      = 2
  term_length     = 1
  additional_bandwidth = 50
  ssh_key {
    username = var.login_name
    key_name = var.ssh_key_name
  }
  acl_template_id = var.acl_template_id
}

resource "equinix_network_device" "c8000v-metro2" {
  name            = "tf-c8kv-dc-larry"
  metro_code      = data.equinix_network_account.metro2.metro_code
  type_code       = "C8000V"
  self_managed    = true
  byol            = true
  package_code    = "network-essentials"
  notifications   = ["lama@equinix.com"]
  hostname        = "C8KV-2"
  account_number  = data.equinix_network_account.metro2.number
  version         = "17.6.6a"
  core_count      = 2
  term_length     = 1
  additional_bandwidth = 50
  ssh_key {
    username = "larry"
    key_name = "larry-rsa"
  }
  acl_template_id = var.acl_template_id
}

resource "equinix_network_device_link" "tf-dlg" {
  name   = "tf-dlg-larry"
  subnet = "192.168.100.0/24"
  project_id = var.project_id
  device {
    id           = equinix_network_device.c8000v-metro1.uuid
    interface_id = 6
  }
  device {
    id           = equinix_network_device.c8000v-metro2.uuid
    interface_id = 7
  }
  link {
    account_number  = data.equinix_network_account.metro1.number
    src_metro_code  = equinix_network_device.c8000v-metro1.metro_code
    dst_metro_code  = equinix_network_device.c8000v-metro2.metro_code
    throughput      = "50"
    throughput_unit = "Mbps"
  }
}