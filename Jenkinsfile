pipeline{
  agent any
  parameters {
    extendedChoice description: 'Test(s) to fail', multiSelectDelimiter: ',', name: 'failTests',  quoteValue: false, saveJSONParameterToFile: false, type: 'PT_CHECKBOX', value: 'First,Second,Third', visibleItemCount: 3
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
            if (env.failTests.contains('first')){ env.first=SOMETHING}
            if (env.failTests.contains('second')){ env.second=SOMETHING}
            if (env.failTests.contains('third')){ env.third=SOMETHING}

        }
      }
    }
    stage("Execute Tests"){
      steps{
        script{
            echo env.failTests
        }
      }
    }
  }
}
