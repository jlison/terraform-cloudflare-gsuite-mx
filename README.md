# terraform-cloudflare-gsuite-mx
A terraform module to quickly setup a Google Workspace MX records

For example:
```terraform
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 2.0"
    }
  }
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_token
}

module "email" {
  source                   = "git@github.com:jlison/terraform-cloudflare-gsuite-mx.git"
  zone_id                  = var.cloudflare_zone_id
  sub_domain               = "@" #optional
  ttl                      = 3600 #optional
  dkim                     = var.dkim # optional
  dmarc                    = var.dmarc #optional
  google_site_verification = var.google_site_verification #optional
}
```
