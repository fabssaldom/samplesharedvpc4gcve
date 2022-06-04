variable "project" {
  type    = string
  default = "fsalaman-sandbox-340019"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "vmname" {
  type    = string
  default = "gcvejumphost1"
}

variable "subnet" {
  type    = string
  default = "fabsv2sn1"
}

variable "vpcname" {
  type    = string
  default = "fabsvpc2"
}

variable "bgpasn" {
  type    = number
  default = 64577
}

variable "natname" {
  type    = string
  default = "fabsnat2"
}

variable "routername" {
  type    = string
  default = "fabsrouter2"
}

variable "firewallname" {
  type    = string
  default = "vpc2-fabsv2sn1-firewall"
}

variable "vmimage" {
  type = string
  #default = "debian11-fabs-v0-9"
  default = "https://www.googleapis.com/compute/v1/projects/fsalaman-sandbox-340019/global/images/debian11-fabs-v0-10"
}

variable "reserved1_name" {}
variable "reserved1_address" {}
variable "reserved1_address_prefix_length" {}
variable "reserved2_name" {}
variable "reserved2_address" {}
variable "reserved2_address_prefix_length" {}
variable "address_purpose" {}
variable "address_type" {}
variable "service" {}
variable "peering" {}
