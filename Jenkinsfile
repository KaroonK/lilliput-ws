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
            env.failTests = env.failTests.toLowerCase()
            if (env.failTests != null && env.failTests.contains('first')){ env.setProperty('first', 'SOMETHING')}
            if (env.failTests != null && env.failTests.contains('second')){ env.setProperty('second', 'SOMETHING')}
            if (env.failTests != null && env.failTests.contains('third')){ env.setProperty('third', 'SOMETHING')}

        }
      }
    }
    stage("Execute Tests"){
      steps{
        script{
            sh 'python -m unittest'
        }
      }
    }
  }
}
