variable "key_vault" {
  type = any
}

variable "secrets" {
  type    = map(any)
  default = {}
}

