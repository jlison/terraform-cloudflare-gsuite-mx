# terraform-cloudflare-gsuite-mx
A terraform module to quickly setup a Google Workspace MX records

For example:
```terraform
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.39.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

module "email" {
  source                   = "jlison/gsuite-mx/cloudflare"
  version                  = "2.0.1"
  zone_id                  = var.cloudflare_zone_id
  sub_domain               = "@" #optional
  ttl                      = 3600 #optional
  dkim                     = var.dkim # optional
  dmarc                    = var.dmarc #optional
  google_site_verification = var.google_site_verification #optional
  mta_sts                  = var.mta_sts #optional
  smtp_tls                 = var.smtp_tls #optional
}
```
