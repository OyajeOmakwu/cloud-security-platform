variable "name" {
  type        = string
  description = "Name prefix for IAM resources"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}