variable "name" {
  description = "Name prefix for guardrail resources"
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}
