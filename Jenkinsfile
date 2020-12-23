#!/user/bin/env groovy

node {
  try {
    stage('terraform init') {
      withCredentials([string(credentialsId:'OKTA_API_TOKEN', variable: 'OKTA_API_TOKEN'),]) {
        sh('terraform 0.13upgrade -yes .')
        sh('terraform init')
      }
    }
  }

  catch (e) {
    print 'Error: ' + e
    currentBuild.result = 'FAILURE'
  }
  finally {
    stage('cleanup') {
      cleanWs()
    }
  }
}