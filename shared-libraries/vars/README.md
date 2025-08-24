🔌 Jenkins Global Configuration

In Jenkins UI → Manage Jenkins → Configure System

Add your shared library repo (e.g., GitHub or GitLab).

Name it cloud-shared-lib (that’s the one used in @Library('cloud-shared-lib')).

Ensure Jenkins agents have installed:

- terraform

- tfsec

- checkov

- AWS CLI (with correct IAM role/credentials)

Set up Slack integration or replace with email notifications.