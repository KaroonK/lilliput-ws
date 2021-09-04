import hudson.slaves.EnvironmentVariablesNodeProperty
import jenkins.model.Jenkins
instance = Jenkins.getInstance()
globalNodeProperties = instance.getGlobalNodeProperties()
envVarsNodePropertyList = globalNodeProperties.getAll(EnvironmentVariablesNodeProperty.class)

newEnvVarsNodeProperty = null
envVars = null

if ( envVarsNodePropertyList == null || envVarsNodePropertyList.size() == 0 ) {
  newEnvVarsNodeProperty = new EnvironmentVariablesNodeProperty();
  globalNodeProperties.add(newEnvVarsNodeProperty)
  envVars = newEnvVarsNodeProperty.getEnvVars()
} else {
  envVars = envVarsNodePropertyList.get(0).getEnvVars()
}

PAGERDUTY_TEAM_1_KEY = System.getenv('PAGERDUTY_TEAM_1_KEY')
PAGERDUTY_TEAM_2_KEY = System.getenv('PAGERDUTY_TEAM_2_KEY')

envVars.put("PAGERDUTY_TEAM_1_KEY", PAGERDUTY_TEAM_1_KEY)

envVars.put("PAGERDUTY_TEAM_2_KEY", PAGERDUTY_TEAM_2_KEY)

instance.save()