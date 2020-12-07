node {

    // internal variables

    def modulesBuildVersion = "Dev_5_2_3_${BUILD_NUMBER}"
    def modulesSpecVersion = "5.2.3.0"
    def modulesGitlabRepository = "https://gitpau.int.com/strydefurther/cheetah-segdv3-rsamp.git" //TODO update this repo url
    def mainModuleDirName = "Strydefurther"
    def modulesGitlabBranch = "master"
    def modulesDisplayName = "Strydefurther"
    def isModulesSuite = true

    def modulesSrcDirName = "Modules"
    def modulesSrcDir = "${env.WORKSPACE}/${modulesSrcDirName}"
    def workingDir = "${env.WORKSPACE}/workspace"
    def netbeansHarnessDir = "${workingDir}/netbeans-ml-harness"
    def intviewerPlatformInstallationDir = "${workingDir}/intviewerPlatform"
    def distDirName = "Dist"
    def destNbmDir = "${distDirName}/nbms"
    def destUpdateCenterDir = "${distDirName}/updateCenter"

    stage ("Prepare") {
        // clean up the workspace
        cleanWs()

        // update the display name of the job
        currentBuild.displayName = "Test " + BUILD_NUMBER
        echo "Displa Name ${currentBuild.displayName}"


        // get the common scripts
        dir("Test") {
            checkout scm
        }
    }

}
