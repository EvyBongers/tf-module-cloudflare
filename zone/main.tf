terraform {
  required_version = ">= 0.14.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.20.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "cloudflare_zone" "dns_zone" {
  zone = var.dns_zone
}

resource "cloudflare_zone_dnssec" "dns_zone" {
  zone_id = cloudflare_zone.dns_zone.id
}
