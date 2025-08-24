def call(Map args = [:]) {
  def status  = args.buildStatus ?: 'UNKNOWN'
  def channel = args.channel ?: '#general'

  slackSend(
    channel: channel,
    color: (status == "SUCCESS") ? "good" : "failure",
    message: "Build ${env.JOB_NAME} [${env.BUILD_NUMBER}] finished with status: ${status}\n${env.BUILD_URL}"
  )
}
