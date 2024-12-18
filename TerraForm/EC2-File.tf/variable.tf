
variable "iname" {
  description = "its represents instance name"
  type        = string
  default     = "mdsurem"
}

variable "ami_id" {
  type    = string
  default = "ami-0166fe664262f664c"
}

variable "key_id" {
  type    = string
  default = "suremkey-pair"
}

variable "itype" {
  type    = string
  default = "t2.micro"
}

variable "icount" {
  type    = number
  default = 1
}
