#!/user/bin/env groovy

node('worker') {
  def image
  def pipeline = new cicd.PipeLine()

  try {

    stage('build docker') {
      image = buildDockerImage(
        appName: 'My Docker Image',
        appVersion: '1.0'
      )
    }

    stage('terraform init') {
      image.inside(
        withCredentials([string(credentialsId:'OKTA_API_TOKEN', variable: 'OKTA_API_TOKEN'),]) {
          sh('terraform 0.13upgrade -yes .')
          sh('terraform init')
        }
      )
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