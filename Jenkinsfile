 
node('worker'){
    def image
    def pipeline = new cicd.Pipeline()

    try {
        pipeline.cleanupAndCheckout()

        stage('Docker Build'){
            image = pipeline.buildDockerImage(
                appName: 'Terraform Demo'
                appVersion: '1.0.0'
            )
        }
        stage('Initialize Terraform'){
            image.inside(
                sh('terraform 0.13upgrade -yes .')
                sh('terraform init')
            )
        }
        stage('Plan Terraform'){
            image.inside(
                withCredentials([string(credentialsId: 'API_TOKEN', variable: 'API_TOKEN'),]) {
                sh('terraform plan')
            }
            )
        }
        if (env.APPLYFEATUREBRANCH == 'true' || env.BRANCH_NAME == 'master') {
            stage('Apply Terraform'){
                image.inside() {
                    withCredentials([string(credentialsId: 'API_TOKEN', variable: 'API_TOKEN'),]) {
                        sh('terraform plan')
                    }
                }
            }
        }
    }
    catch (e) {
        print 'Error: ' + env
        currentBuild.result = 'FAILURE'
    }
    finally {
        stage('cleanup'){
            clearnWs()
        }
    }
}