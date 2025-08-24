def call(String dir) {
    sh """
        cd ${dir}
        checkov -d .
    """
}
