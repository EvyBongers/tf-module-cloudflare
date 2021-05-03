variable "dns_zone_id" {
  type = string
}

variable "rewrite_rules" {
  type = map(object({
    priority       = number
    forwarding_url = string
    status_code    = number
  }))
}
