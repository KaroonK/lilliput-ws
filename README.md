# Terraform Pagerduty Configuration

## Summary
This repository contains different modules used to pagerduty configuration through terraform, as well as, triggering the respective service in Pagerduty for a test failure via Jenkins

## Pre-requisites
- PagerDuty Access
- Terraform
- Docker

## Steps
* Clone this repository
* Generate API Token in Pagerduty
	* Store this token as an environment variable: TF_VAR_KEY 
* Navigate into the cloned directory
* Execute terraform plan and then terraform apply --auto-approve
    * This will create users, services, teams, team memberships, service integration, schedules, and escalation policy
* Retreive the integration keys from Pagerduty for both services
    * Log into PagerDuty
	* Navigate to Service
	* Select each service
	* Select 'Integrations'
	* Expand Jenkins CI
	* Store both keys as environment variables -> Ex : TEAM1_KEY, TEAM2_KEY
* Build the dockerfile (optional)
* Execute the following Docker command (replace everything inside curly braces):
    ```
    docker run --name {any_name} -p 8080:8080 -itd -e PAGERDUTY_TEAM_1_KEY=$TEAM1_KEY -e PAGERDUTY_TEAM_2_KEY=$TEAM2_KEY karoonk/pagerduty-jenkins:v4
    ```
    * Substitute the variables accordingly, and the container image name accordingly, if built from scratch
* Navigate to http://localhost:8080
* Click on lilliput-ws and click build
    9 a. First execution does not have any Jenkins parameters to fail a specific test
* Click build with parameters
	10 a. Select the test(s) to fail
* Navigate back to PagerDuty's UI to ensure that the failure of the tests has created an incident shown in the service