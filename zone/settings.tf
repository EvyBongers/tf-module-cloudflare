resource "cloudflare_zone_settings_override" "settings" {
  zone_id = cloudflare_zone.dns_zone.id

  settings {
  }
}
