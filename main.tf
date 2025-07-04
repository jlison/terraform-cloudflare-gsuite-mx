resource "cloudflare_dns_record" "mx" {
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
  content  = each.value.server
  ttl      = var.ttl
  priority = each.value.priority
}

resource "cloudflare_dns_record" "spf" {
  zone_id = var.zone_id
  name    = var.sub_domain
  type    = "TXT"
  content = var.spf
  ttl     = var.ttl
}

resource "cloudflare_dns_record" "dkim" {
  count   = length(var.dkim) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "google._domainkey"
  type    = "TXT"
  content = var.dkim
  ttl     = var.ttl
}

resource "cloudflare_dns_record" "dmarc" {
  count   = length(var.dmarc) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = var.dmarc
  ttl     = var.ttl
}

resource "cloudflare_dns_record" "google_site_verification" {
  count   = length(var.google_site_verification) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = var.sub_domain
  type    = "TXT"
  content = var.google_site_verification
  ttl     = var.ttl
}

resource "cloudflare_dns_record" "mta_sts" {
  count   = length(var.mta_sts) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_mta-sts"
  type    = "TXT"
  content = var.mta_sts
  ttl     = var.ttl
}

resource "cloudflare_dns_record" "smtp_tls" {
  count   = length(var.smtp_tls) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "_smtp._tls"
  type    = "TXT"
  content = var.smtp_tls
  ttl     = var.ttl
}
