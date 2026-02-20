#############################################
# Secure Multi-Account Landing Zone (IaC)
# Terraform skeleton (module-based)
#
# Purpose:
# - Show Infrastructure-as-Code structure for a secure AWS foundation
# - Ready for multi-account patterns (Org/SSO, logging, guardrails)
# - Safe to showcase in a portfolio without exposing secrets
#############################################

terraform {
  required_version = ">= 1.5.0"

  # Optional: enable remote state once you’re ready
  # backend "s3" {
  #   bucket         = "REPLACE_ME-tfstate"
  #   key            = "landing-zone/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "REPLACE_ME-tf-locks"
  #   encrypt        = true
  # }
}

#############################################
# Variables (safe defaults)
#############################################

variable "project_name" {
  description = "Project name used for tagging and naming."
  type        = string
  default     = "secure-multi-account-landing-zone"
}

variable "environment" {
  description = "Environment label (dev/stage/prod)."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region for this deployment."
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  description = "Owner tag (team/person)."
  type        = string
  default     = "portfolio"
}

#############################################
# Provider + default tags
#############################################

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      Owner       = var.owner
      ManagedBy   = "terraform"
    }
  }
}

#############################################
# Locals (naming + standard tags)
#############################################

locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "terraform"
  }
}

#############################################
# Core modules (placeholders)
# Keep this structure even if you don’t deploy.
# Recruiters like seeing clear separation of concerns.
#############################################

# module "org_baseline" {
#   source      = "./modules/org-baseline"
#   name_prefix = local.name_prefix
#   tags        = local.common_tags
# }

# module "security_logging" {
#   source      = "./modules/security-logging"
#   name_prefix = local.name_prefix
#   tags        = local.common_tags
#
#   # Examples:
#   # enable_cloudtrail = true
#   # enable_guardduty  = true
# }

# module "iam_identity_center" {
#   source      = "./modules/iam-identity-center"
#   name_prefix = local.name_prefix
#   tags        = local.common_tags
# }

# module "network_baseline" {
#   source      = "./modules/network-baseline"
#   name_prefix = local.name_prefix
#   tags        = local.common_tags
# }

#############################################
# Outputs (safe)
#############################################

output "name_prefix" {
  description = "Naming prefix used across resources."
  value       = local.name_prefix
}

output "region" {
  description = "AWS region targeted by this configuration."
  value       = var.region
}
