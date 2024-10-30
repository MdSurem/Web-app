node{
    stage("Code"){
       git 'https://github.com/MdSurem/Jenkins-Test.git'  //modify your accordignly
    }
    stage("Build"){
        sh "mvn clean package"
    }
    stage("QCA"){
         withSonarQubeEnv('mysonar') 
        {
           def mavenHome = tool name: "maven", type: "maven"
           def mavenCMD = "${mavenHome}/bin/mvn"
           sh "${mavenCMD} sonar:sonar"
        }
    }
    stage("Artifact"){
        nexusArtifactUploader artifacts: [[artifactId: 'myweb', classifier: '', file: 'target/myweb-8.7.1.war', type: 'war']], credentialsId: 'nexus', groupId: 'in.javahome', nexusUrl: '3.91.215.130:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'my-repo', version: '8.7.1'
    }
    stage("deploy"){
        deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://18.207.93.38:8080')], contextPath: 'webApp', war: 'target/*.war'
    }
}
