resource "cloudflare_record" "mx" {
  for_each = {
    main = { server = "aspmx.l.google.com", priority = 1 }
    alt1 = { server = "alt1.aspmx.l.google.com", priority = 5 }
    alt2 = { server = "alt2.aspmx.l.google.com", priority = 5 }
    alt3 = { server = "alt3.aspmx.l.google.com", priority = 10 }
    alt4 = { server = "alt4.aspmx.l.google.com", priority = 10 }
  }

  zone_id  = var.zone_id
  name     = var.sub_domain
  type     = "MX"
  value    = each.value.server
  ttl      = var.ttl
  priority = each.value.priority
}

resource "cloudflare_record" "spf" {
  zone_id = var.zone_id
  name    = var.sub_domain
  type    = "TXT"
  value   = var.spf
  ttl     = var.ttl
}

resource "cloudflare_record" "dkim" {
  count   = length(var.dkim) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "google._domainkey"
  type    = "TXT"
  value   = var.dkim
  ttl     = var.ttl
}

resource "cloudflare_record" "dmarc" {
  count   = length(var.dmarc) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_dmarc"
  type    = "TXT"
  value   = var.dmarc
  ttl     = var.ttl
}

resource "cloudflare_record" "google_site_verification" {
  count   = length(var.google_site_verification) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = var.sub_domain
  type    = "TXT"
  value   = var.google_site_verification
  ttl     = var.ttl
}

resource "cloudflare_record" "mta_sts" {
  count   = length(var.mta_sts) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_mta-sts"
  type    = "TXT"
  value   = var.mta_sts
  ttl     = var.ttl
}

resource "cloudflare_record" "smtp_tls" {
  count   = length(var.smtp_tls) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_smtp._tls"
  type    = "TXT"
  value   = var.smtp_tls
  ttl     = var.ttl
}
