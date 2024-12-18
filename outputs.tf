output "Metro1_Device" {
  description = "Metro1 device attributes"
  value =  {
    account_number = equinix_network_device.c8000v-metro1.account_number
    device_id      = equinix_network_device.c8000v-metro1.uuid
    device_name    = equinix_network_device.c8000v-metro1.name
    device_type    = equinix_network_device.c8000v-metro1.type_code
    status         = equinix_network_device.c8000v-metro1.status
    package        = equinix_network_device.c8000v-metro1.package_code
    ssh_ip_address = equinix_network_device.c8000v-metro1.ssh_ip_address
    ssh_ip_fqdn    = equinix_network_device.c8000v-metro1.ssh_ip_fqdn
  } 
}

output "Metro2_Device" {
  description = "Metro2 device attributes"
  value =  {
    account_number = equinix_network_device.c8000v-metro2.account_number
    device_id      = equinix_network_device.c8000v-metro2.uuid
    device_name    = equinix_network_device.c8000v-metro2.name
    device_type    = equinix_network_device.c8000v-metro2.type_code
    status         = equinix_network_device.c8000v-metro2.status
    package        = equinix_network_device.c8000v-metro2.package_code
    ssh_ip_address = equinix_network_device.c8000v-metro2.ssh_ip_address
    ssh_ip_fqdn    = equinix_network_device.c8000v-metro2.ssh_ip_fqdn
  } 
}

output "Device_Link_Group" {
  description = "Device Link attributes"
  value =  {
    dlg_name    = equinix_network_device_link.tf-dlg.name
    dlg_id      = equinix_network_device_link.tf-dlg.uuid
    subnet      = equinix_network_device_link.tf-dlg.subnet
    link_infor  = equinix_network_device_link.tf-dlg.link
  } 
}
