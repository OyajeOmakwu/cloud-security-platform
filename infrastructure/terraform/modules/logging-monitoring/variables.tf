variable "name" {
  description = "Name prefix"
  type        = string
}

variable "cloudtrail_bucket_name" {
  description = "Globally unique S3 bucket name for CloudTrail logs"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
