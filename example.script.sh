
### find some errors in this script##

pipeline{
    agent any
    triggers{
        cron "6 11 31 10 *"
    }
    environment{
        abc="md surem"
        course="devops"
        place="Hyd"
    }
    stages{
        stage("code"){
            steps{
                echo "my name is $abc and i am from $place and i am learning $course"
            }
        }
        stage("build"){
            when{
                branch "prod"
            }
            steps{
                echo "my name is $abc and i am from $place and i am learning $course"
            }
        }
        stage("test"){
            environment{
                place="Kadiri"
            }
            steps{
                echo "my name is $abc and i am from $place and i am learning $safari"
            }
        }
        stage("deploy"){
            input{
                message "can i deploy the pipeline into app server ?!! grant me permission#"
            }
            steps{
                script{
                    sh "printenv"
                }
            }
        }
    }
    post{
        success{
            echo "your pipeline is successful"
        }
        failure{
            echo "your pipeline is failes"
        }
        aborted{
            echo "your pipeline rejected or cancelled due to security reasons"
        }
    }
}
