failedTests = []
pipeline{
  agent any
  parameters {
    extendedChoice description: 'Test(s) to fail', multiSelectDelimiter: ',', name: 'failTests',  quoteValue: false, saveJSONParameterToFile: false, type: 'PT_CHECKBOX', value: 'first,second,third', visibleItemCount: 3
  }
  stages{
    stage("Clone"){
      steps{
        git branch: 'main', url: 'https://github.com/KaroonK/lilliput-ws.git'
      }
    }
    stage("Update variables"){
      steps{
        script{
            env.failTests = env.failTests != null? env.failTests.toLowerCase() : ''
            if (env.failTests != null && env.failTests.contains('first')){ env.setProperty('first', 'SOMETHING')}
            if (env.failTests != null && env.failTests.contains('second')){ env.setProperty('second', 'SOMETHING')}
            if (env.failTests != null && env.failTests.contains('third')){ env.setProperty('third', 'SOMETHING')}

        }
      }
    }
    stage("Execute Tests"){
      steps{
        script{
            sh 'python3 tests/main.py'
            // logic to figure out tests from which folder failed
            def parser = new XmlParser().parse("$WORKSPACE/logs/test_results.xml")
            allChildren = parser.children()
            for (int x = 0 ; x<allChildren.size(); x++){
              child = allChildren.get(x)
              childAttributes = child.attributes()
              numOfFailures = childAttributes.get('failures')
              if (numOfFailures.toInteger() > 0){
                filePath = childAttributes.get('file')
                folder = filePath.split('/')[0]
                if (!failedTests.contains(folder)){
                  failedTests.add(folder)
                }
              }
            }
            junit 'logs/test_results.xml'
            // end of logic
        }
      }
    }
  }
  post{
    unstable{
      // read the YAML 
      // find out which team it belongs to
      script{
        for (eachFolder in failedTests){
          def metadata = readYaml file:"$WORKSPACE/tests/${eachFolder}/metadata.yaml"
          routingKey = metadata['owner'].equals('Team 1') ? "$PAGERDUTY_TEAM_1_KEY" : "$PAGERDUTY_TEAM_2_KEY"
          pagerduty(resolve: false, routingKey: routingKey, incidentSummary: "lilliput-ws-failure", incidentSource: 'lilliput-ws main branch')
        }
      }
    }
  }
}
