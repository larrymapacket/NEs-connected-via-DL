variable "equinix_client_id" {
  type        = string
  description = "API Consumer Key available under 'My Apps' in developer portal. This argument can also be specified with the EQUINIX_API_CLIENTID shell environment variable."
}

variable "equinix_client_secret" {
  type        = string
  description = "API Consumer secret available under 'My Apps' in developer portal. This argument can also be specified with the EQUINIX_API_CLIENTSECRET shell environment variable."
}

variable "project_id" {
  type        = string
  description = "my project ID in equinix network edge portal."
}
variable "acl_template_id" {
  type        = string
  description = "my ACL template ID in equinix network edge portal."
}

variable "metro_code_1" {
  type        = string
  description = "Metro code"
}

variable "metro_code_2" {
  type        = string
  description = "Metro code"
  ## default     = "DC"
}
variable "ssh_key_name" {
    type        = string
    description = "ssh key used to login to the device"
  }
variable "login_name" {
    type        = string
    description = "device login name"
  }
