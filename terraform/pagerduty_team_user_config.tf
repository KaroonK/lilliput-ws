# Create Users
resource "pagerduty_user" "user1" {
  name  = "Test User1"
  email = "khatiwada.karoon+testuser1@gmail.com"
}

resource "pagerduty_user" "user2" {
  name  = "Test User2"
  email = "khatiwada.karoon+testuser2@gmail.com"
}
resource "pagerduty_user" "user3" {
  name  = "Test User3"
  email = "khatiwada.karoon+testuser3@gmail.com"
}

resource "pagerduty_user" "user4" {
  name  = "Test User4"
  email = "khatiwada.karoon+testuser4@gmail.com"
}

resource "pagerduty_user" "user5" {
  name  = "Test User5"
  email = "khatiwada.karoon+testuser5@gmail.com"
}

# Create Teams
resource "pagerduty_team" "Team1" {
  name        = "Team 1"
  description = "First Team"
}

resource "pagerduty_team" "Team2" {
  name        = "Team 2"
  description = "Second Team"
}


# Create Team Memberships
resource "pagerduty_team_membership" "User1Team1" {
  user_id = pagerduty_user.user1.id
  team_id = pagerduty_team.Team1.id
  role    = "manager"
}


resource "pagerduty_team_membership" "User2Team1" {
  user_id = pagerduty_user.user2.id
  team_id = pagerduty_team.Team1.id
  role    = "manager"
}


resource "pagerduty_team_membership" "User3Team2" {
  user_id = pagerduty_user.user3.id
  team_id = pagerduty_team.Team2.id
  role    = "manager"
}


resource "pagerduty_team_membership" "User4Team2" {
  user_id = pagerduty_user.user4.id
  team_id = pagerduty_team.Team2.id
  role    = "manager"
}


resource "pagerduty_team_membership" "User5Team2" {
  user_id = pagerduty_user.user5.id
  team_id = pagerduty_team.Team2.id
  role    = "manager"
}