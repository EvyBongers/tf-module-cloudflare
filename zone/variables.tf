variable "dns_zone" {
  type = string
}

variable "zone_settings" {
  type = object({
    development_mode = string,

    ipv6                  = string,
    true_client_ip_header = string,

    always_use_https         = string,
    automatic_https_rewrites = string,
    opportunistic_encryption = string,

    ssl             = string,
    security_level  = string,
    tls_1_3         = string,
    min_tls_version = string,
    security_header = object({
      enabled            = bool,
      include_subdomains = bool,
      max_age            = number,
      nosniff            = bool,
      preload            = bool,
    }),

    http2 = string,
    http3 = string,

    brotli = string,
    minify = object({
      css  = string,
      js   = string,
      html = string,
    }),
  })
}
