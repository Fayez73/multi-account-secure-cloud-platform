def call(Map args = [:], Closure body) {
  def roleArn = args.roleArn
  def region  = args.region ?: "eu-west-2"

  withCredentials([aws(roleArn: roleArn, roleSessionName: "jenkins", region: region, credentialsId: 'aws-org-admin-role')]) {
    body()
  }
}
