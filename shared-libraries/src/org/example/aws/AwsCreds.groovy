package org.example.aws

class AwsCreds implements Serializable {
  static Map assumeRole(String roleArn, String sessionName = "jenkins") {
    def creds = sh(
      script: "aws sts assume-role --role-arn ${roleArn} --role-session-name ${sessionName} --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' --output text",
      returnStdout: true
    ).trim().split()

    return [
      accessKey: creds[0],
      secretKey: creds[1],
      sessionToken: creds[2]
    ]
  }
}
