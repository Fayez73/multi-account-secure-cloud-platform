def terraformInit(String dir) {
    sh """
        cd ${dir}
        terraform init -backend-config=backend.hcl
    """
}

def terraformValidate(String dir) {
    sh """
        cd ${dir}
        terraform validate
    """
}

def terraformFmt(String dir) {
    sh """
        cd ${dir}
        terraform fmt -check -diff
    """
}

def terraformPlan(String dir) {
    sh """
        cd ${dir}
        terraform plan -out=plan.out
    """
}

def terraformApply(String dir) {
    sh """
        cd ${dir}
        terraform apply -auto-approve plan.out
    """
}
