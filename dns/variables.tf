variable "dns_zone_id" {
  type = number
}

variable "dns_records" {
  type = list(object({
    name     = string
    priority = optional(number)
    proxied  = optional(bool)
    type     = string
    value    = string
  }))
}
