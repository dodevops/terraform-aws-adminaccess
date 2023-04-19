variable "project" {
  type        = string
  description = "Project this configuration is for"
}

variable "stage" {
  type        = string
  description = "Name of the stage for this state"
}

variable "trusted_root_account_arn" {
  type        = string
  description = "ARN of the account used as a root account for access purposes (= where the real users live in)"
}