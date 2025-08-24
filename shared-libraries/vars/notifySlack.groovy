def call(String message) {
    slackSend (
        channel: '#devops-alerts',
        color: (currentBuild.currentResult == 'SUCCESS') ? 'good' : 'failure',
        message: message
    )
}
