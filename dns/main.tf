terraform {
  required_version = ">= 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 2.20"
    }
  }
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
  dynamic "data" {
    for_each = each.value.value == null ? [1] : []

    content {
      algorithm   = each.value.data.algorithm
      type        = each.value.data.type
      fingerprint = each.value.data.fingerprint
    }
  }
}

resource "cloudflare_record" "txt_records" {
  for_each = local.txt_records

  zone_id = var.dns_zone_id

  name  = each.value.name
  type  = each.value.type
  value = each.value.value
}
