locals {
  base_tags = {
    Account     = var.account
    Environment = var.environment
    Department  = var.department
    Team        = var.team_acronym
  }

  environment_type = {
    dev  = "Development"
    pre  = "Pre-production"
    pro  = "Production"
  }[var.environment]

  # Verificar se a sigla do time é válida
  valid_team = contains(local.valid_team_acronyms, var.team_acronym)

  # Verificar combinações de CIA se o ambiente for pro
  valid_cia = var.environment != "pro" || contains(local.valid_cia_combinations, var.cia)

  # Classificação de ambiente
  environment_classification = {
    "dev" = "Development"
    "pre" = "Pre-Production"
    "pro" = "Critical"
  }[var.environment]

  merged_tags = merge(local.base_tags, var.additional_tags, {
    "EnvironmentType" = local.environment_type,
    "EnvironmentClassification" = local.environment_classification
  })
}

# Verificações
resource "null_resource" "validate_team" {
  count = local.valid_team ? 0 : 1
  provisioner "local-exec" {
    command = "echo 'Invalid team acronym: ${var.team_acronym}'"
  }
}

resource "null_resource" "validate_cia" {
  count = local.valid_cia ? 0 : 1
  provisioner "local-exec" {
    command = "echo 'Invalid CIA combination: ${var.cia}'"
  }
}

output "tags" {
  value = local.merged_tags
}
