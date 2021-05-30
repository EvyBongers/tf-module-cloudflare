resource "cloudflare_zone_settings_override" "settings" {
  zone_id = cloudflare_zone.dns_zone.id

  settings {
    ipv6 = var.zone_settings.ipv6

    always_use_https         = var.zone_settings.always_use_https
    automatic_https_rewrites = var.zone_settings.automatic_https_rewrites
    opportunistic_encryption = var.zone_settings.opportunistic_encryption

    ssl             = var.zone_settings.ssl
    tls_1_3         = var.zone_settings.tls_1_3
    min_tls_version = var.zone_settings.min_tls_version
    security_header {
      enabled            = var.zone_settings.security_header.enabled
      include_subdomains = var.zone_settings.security_header.include_subdomains
      max_age            = var.zone_settings.security_header.max_age
      nosniff            = var.zone_settings.security_header.nosniff
      preload            = var.zone_settings.security_header.preload
    }

    http2 = var.zone_settings.http2
    http3 = var.zone_settings.http3

    brotli = var.zone_settings.brotli
    minify {
      css  = var.zone_settings.minify.css
      js   = var.zone_settings.minify.js
      html = var.zone_settings.minify.html
    }
  }
}
