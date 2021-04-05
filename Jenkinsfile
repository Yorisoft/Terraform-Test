#!/usr/bin/env groovy

properties([
    parameters([
        booleanParam(defaultValue: false, description: 'Apply feature branch', name: 'APPLYFEATUREBRANCH')
    ])
])
  
node('worker') {
    def image
    def pipeline = new cicd.Pipeline()

    try {
        pipeline.cleanupAndCheckout()   

        stage('Docker Build') {   
            image = pipeline.buildDockerImage(
                appName: 'Terraform Demo',
                appVersion: '1.0.0'
            )
        }
        stage('Initialize Terraform') {
            image.inside() {
                sh('terraform 0.13upgrade -yes .')
                sh('terraform init')
            }
        }
        stage('Plan Terraform') {
            image.inside() {
                withCredentials([string(credentialsId: 'OKTA_API_TOKEN', variable: 'OKTA_API_TOKEN'),]) {
                sh('terraform plan')
                }
            }
        }
        if (env.APPLYFEATUREBRANCH == 'true' || env.BRANCH_NAME == 'master') {
            stage('Apply Terraform') {
                image.inside() {
                    withCredentials([string(credentialsId: 'OKTA_API_TOKEN', variable: 'OKTA_API_TOKEN'),]) {
                        sh('terraform apply')
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