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
    dynamic "security_header" {
      for_each = toset(var.zone_settings.security_header == null ? [] : [var.zone_settings.security_header])
      content {
        enabled            = security_header.value.enabled
        include_subdomains = security_header.value.include_subdomains
        max_age            = security_header.value.max_age
        nosniff            = security_header.value.nosniff
        preload            = security_header.value.preload
      }
    }

    http2 = var.zone_settings.http2
    http3 = var.zone_settings.http3

    brotli = var.zone_settings.brotli
    dynamic "minify" {
      for_each = toset(var.zone_settings.minify == null ? [] : [var.zone_settings.minify])
      content {
        css  = minify.value.css
        js   = minify.value.js
        html = minify.value.html
      }
    }
  }
}
