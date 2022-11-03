terraform {
  required_version = ">= 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.0"
    }
  }
}

resource "cloudflare_page_rule" "rewrite_rules" {
  for_each = var.rewrite_rules

  zone_id  = var.dns_zone_id
  target   = each.key
  priority = each.value.priority

  actions {
    forwarding_url {
      url         = each.value.forwarding_url
      status_code = each.value.status_code
    }
  }
}
