terraform {
  required_version = ">= 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 2.20"
    }
  }
}

resource "cloudflare_zone" "dns_zone" {
  zone = var.dns_zone
}

resource "cloudflare_zone_dnssec" "dns_zone" {
  count = var.dnssec_enabled ? 1 : 0

  zone_id = cloudflare_zone.dns_zone.id
}
