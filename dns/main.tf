terraform {
  required_version = ">= 0.15.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.20.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "cloudflare_record" "a_records" {
  for_each = local.a_records

  zone_id = var.dns_zone_id

  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
  proxied = each.value.proxied
}

resource "cloudflare_record" "aaaa_records" {
  for_each = local.aaaa_records

  zone_id = var.dns_zone_id

  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
  proxied = each.value.proxied
}

resource "cloudflare_record" "cname_records" {
  for_each = local.cname_records

  zone_id = var.dns_zone_id

  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
  proxied = each.value.proxied
}

resource "cloudflare_record" "mx_records" {
  for_each = local.mx_records

  zone_id = var.dns_zone_id

  name     = each.value.name
  type     = each.value.type
  value    = each.value.value
  priority = each.value.priority
}

resource "cloudflare_record" "sshfp_records" {
  for_each = local.sshfp_records

  zone_id = var.dns_zone_id

  name  = each.value.name
  type  = each.value.type
  value = each.value.value
}

resource "cloudflare_record" "txt_records" {
  for_each = local.txt_records

  zone_id = var.dns_zone_id

  name  = each.value.name
  type  = each.value.type
  value = each.value.value
}
