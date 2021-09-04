
terraform {
  required_providers {
    pagerduty = {
      source = "PagerDuty/pagerduty"
      version = "1.10.1"
    }
  }
}

variable "KEY"{
    type = string
}

provider "pagerduty"{
    token = var.KEY
}
