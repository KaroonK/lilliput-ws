
data "pagerduty_vendor" "jenkins" {
  name = "Jenkins"
}
resource "pagerduty_service" "lilliput-ws-failures-team1" {
  name                    = "Team 1 Failure Service"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.lilliput-ws-team1-ep.id
}
resource "pagerduty_service_integration" "jenkins_team1" {
  name    = data.pagerduty_vendor.jenkins.name
  service = pagerduty_service.lilliput-ws-failures-team1.id
  vendor  = data.pagerduty_vendor.jenkins.id
}

resource "pagerduty_service" "lilliput-ws-failures-team2" {
  name                    = "Team 2 Failure Service"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.lilliput-ws-team2-ep.id
}

resource "pagerduty_service_integration" "jenkins_team2" {
  name    = data.pagerduty_vendor.jenkins.name
  service = pagerduty_service.lilliput-ws-failures-team2.id
  vendor  = data.pagerduty_vendor.jenkins.id
}