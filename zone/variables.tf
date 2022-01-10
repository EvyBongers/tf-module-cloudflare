variable "dns_zone" {
  type = string
}

variable "zone_settings" {
  type = object({
    development_mode = optional(string),

    ipv6                  = optional(string),
    true_client_ip_header = optional(string),

    always_use_https         = optional(string),
    automatic_https_rewrites = optional(string),
    opportunistic_encryption = optional(string),

    ssl             = optional(string),
    security_level  = optional(string),
    tls_1_3         = optional(string),
    min_tls_version = optional(string),
    security_header = optional(object({
      enabled            = optional(bool),
      include_subdomains = optional(bool),
      max_age            = optional(number),
      nosniff            = optional(bool),
      preload            = optional(bool),
    })),

    http2 = optional(string),
    http3 = optional(string),

    brotli = optional(string),
    minify = optional(object({
      css  = string,
      js   = string,
      html = string,
    })),
  })
  default = {}
}
