terraform {
  required_version = ">= 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.0"
    }
  }
}

resource "cloudflare_zone" "dns_zone" {
  account_id = var.account_id
  zone       = var.dns_zone
}

resource "cloudflare_zone_dnssec" "dns_zone" {
  count = var.dnssec_enabled ? 1 : 0

  zone_id = cloudflare_zone.dns_zone.id
}
