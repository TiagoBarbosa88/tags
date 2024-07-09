variable "account" {
  description = "A conta onde os recursos estão sendo criados"
  type        = string
}

variable "environment" {
  description = "O ambiente (ex: dev, pre, pro)"
  type        = string
  validation {
    condition     = contains(["dev", "pre", "pro"], var.environment)
    error_message = "O ambiente deve ser 'dev', 'pre' ou 'pro'."
  }
}

variable "department" {
  description = "O setor ou departamento responsável pelos recursos"
  type        = string
}

variable "team_acronym" {
  description = "Sigla do time responsável pelos recursos"
  type        = string
}

variable "cia" {
  description = "Combinação de Confidencialidade, Integridade e Disponibilidade"
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "Tags adicionais que podem ser passadas para os recursos"
  type        = map(string)
  default     = {}
}

locals {
  valid_team_acronyms = ["a", "b", "c", "l", "m"]
  valid_cia_combinations = [
    ["a", "b", "c"],
    ["b", "l", "m"],
    ["a", "m", "c"]
  ]
}
