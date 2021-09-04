# Schedule for Team 1
resource "pagerduty_schedule" "Team1Schedule" {
  name      = "Team 1 Rotation"
  time_zone = "America/New_York"

  layer {
    name                         = "Day Shift"
    start                        = "2021-09-03T00:00:00-00:00"
    rotation_virtual_start       = "2021-09-03T00:00:00-00:00"
    rotation_turn_length_seconds = 86400
    users                        = [pagerduty_user.user1.id,pagerduty_user.user2.id]

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "08:00:00"
      duration_seconds  = 32400
    }
  }

  teams = [pagerduty_team.Team1.id]
}

# Schedule for Team 2
resource "pagerduty_schedule" "Team2Schedule" {
  name      = "Team 2 Rotation"
  time_zone = "America/New_York"

  layer {
    name                         = "Day Shift"
    start                        = "2021-09-03T00:00:00-00:00"
    rotation_virtual_start       = "2021-09-03T00:00:00-00:00"
    rotation_turn_length_seconds = 86400
    users                        = [pagerduty_user.user3.id,pagerduty_user.user4.id,pagerduty_user.user5.id]

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "08:00:00"
      duration_seconds  = 32400
    }
  }

  teams = [pagerduty_team.Team2.id]
}