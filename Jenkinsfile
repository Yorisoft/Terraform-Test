node{
    
    currentStage = 'Setup'
    stage(currentStage){
        pipeline = new cicd.PipeLine()
        pipeline.cleanupAndCheckout()
    }

     currentStage = 'Build Docker'
    stage(currentStage){
        pipeline.buildDockerImage([])
    }
    
}