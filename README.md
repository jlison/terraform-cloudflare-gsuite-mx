# terraform-cloudflare-gsuite-mx
A terraform module to quickly setup a Google Workspace MX records

For example:
```terraform
module "cloudflare-gsuite" {
  source                   = "git@github.com:jlison/terraform-cloudflare-gsuite-mx.git"
  zone_id                  = var.cloudflare_zone_id
  dkim                     = var.dkim
  dmarc                    = var.dmarc
  google_site_verification = var.google_site_verification
}
```
