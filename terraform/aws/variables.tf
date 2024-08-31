variable "table_name" {}
variable "hash_key" {}
variable "hash_key_type" { default = "S" }
variable "tags" { type = map(string) }
