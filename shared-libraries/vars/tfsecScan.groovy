def call(String dir) {
    sh """
        cd ${dir}
        tfsec .
    """
}
