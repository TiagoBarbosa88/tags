# Tags

## Usage

```hcl

Chamar o modulo em outro bp

module "tags" {
  source        = "git::https://github.dev/TiagoBarbosa88/tags?git.VERSION"
  description   = "Modulo de tags para indentificar o projeto de que time está provisionado"
}


module "tags" {
  source        = "../terraform-modules/tags"
  account       = "finance"
  environment   = "pro"
  department    = "fin-tech"
  team_acronym  = "a"
  cia           = ["a", "b", "c"]
  additional_tags = {
    Owner   = "John Doe"
    Project = "XYZ"
  }
}

```