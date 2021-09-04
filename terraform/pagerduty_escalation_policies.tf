resource "pagerduty_escalation_policy" "lilliput-ws-team1-ep" {
  name      = "Team 1 Escalation Policy"
  num_loops = 2
  teams     = [pagerduty_team.Team1.id]

  rule {
    escalation_delay_in_minutes = 10
    target {
      type = "schedule"
      id   = pagerduty_schedule.Team1Schedule.id
    }
  }
}

resource "pagerduty_escalation_policy" "lilliput-ws-team2-ep" {
  name      = "Team 2 Escalation Policy"
  num_loops = 2
  teams     = [pagerduty_team.Team2.id]

  rule {
    escalation_delay_in_minutes = 10
    target {
      type = "schedule"
      id   = pagerduty_schedule.Team2Schedule.id
    }
  }
}
