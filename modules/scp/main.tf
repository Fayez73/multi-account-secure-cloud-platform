resource "aws_organizations_policy" "deny_root" {
  name        = "deny-root"
  description = "Deny root user usage"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/deny_root.json")
}

resource "aws_organizations_policy" "restrict_regions" {
  name        = "restrict-regions"
  description = "Restrict AWS regions"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/restrict_regions.json")
}

resource "aws_organizations_policy" "mandatory_tags" {
  name        = "mandatory-tags"
  description = "Enforce mandatory tags"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/mandatory_tags.json")
}
