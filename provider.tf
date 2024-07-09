# ==============================================================================
#                     ✨ Provider Configuration ✨
# ==============================================================================
provider "aws" {
  #This will fetch AWS acces keys and secrate key from AWS profile that is genrated in ".aws" directory when we configure our aws-cli.
  profile = var.aws_profile
  region  = var.aws_region
}

