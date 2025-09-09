# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

upstream_input "network_stack" {
  type   = "stack"
  source = "app.terraform.io/hashi-edu-premium/Rose Stacks test/crispy-invention"
}


deployment "simple" {
  inputs = {
    prefix           = "DOOB"
    instances        = 2
  }
}

deployment "complex" {
  inputs = {
    prefix           = upstream_input.network_stack.staging_vpc_id
    instances        = 2
  }
  destroy = true
}

# deployment_group "simple" {
#   auto_approve_checks = [deployment_auto_approve.no_destroy]
# }

# deployment_auto_approve "no_destroy" {
#   check {
#     condition = context.plan.changes.remove == 0
#     reason    = "Plan removes ${context.plan.changes.remove} resources."
#   }

#     check {
#     condition = context.plan.changes.remove == 1
#     reason    = "Plan removes ${context.plan.changes.remove} resources."
#   }
# }
