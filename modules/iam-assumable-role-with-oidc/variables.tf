variable "create_role" {
  description = "Whether to create a role"
  type        = bool
  default     = false
}

variable "provider_url" {
  description = "URL of the OIDC Provider. Use provider_urls to specify several URLs."
  type        = string
  default     = ""
}

variable "provider_urls" {
  description = "List of URLs of the OIDC Providers"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  description = "The AWS account ID where the OIDC provider lives, leave empty to use the account for the AWS provider"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "IAM role name prefix"
  type        = string
  default     = null
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
  default     = ""
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}

variable "number_of_role_policy_arns" {
  description = "Number of IAM policies to attach to IAM role"
  type        = number
  default     = null
}

variable "inline_policy_statements" {
  description = "List of inline policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) to attach to IAM role as an inline policy"
  type        = any
  default     = []
}

variable "oidc_fully_qualified_subjects" {
  description = "The fully qualified OIDC subjects to be added to the role policy"
  type        = set(string)
  default     = []
}

variable "oidc_subjects_with_wildcards" {
  description = "The OIDC subject using wildcards to be added to the role policy"
  type        = set(string)
  default     = []
}

variable "oidc_fully_qualified_audiences" {
  description = "The audience to be added to the role policy. Set to sts.amazonaws.com for cross-account assumable role. Leave empty otherwise."
  type        = set(string)
  default     = []
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = false
}

variable "allow_self_assume_role" {
  description = "Determines whether to allow the role to be [assume itself](https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/)"
  type        = bool
  default     = false
}

variable "provider_trust_policy_conditions" {
  description = "[Condition constraints](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#condition) applied to the trust policy"
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  default = []
}
