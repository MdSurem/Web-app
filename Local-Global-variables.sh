pipeline{
    agent any
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
            steps{
                echo "my name is $abc and i am from $place and i am learning $course"
            }
        }
        stage("test"){
            environment{
                place="Kadiri"
            }
            steps{
                echo "my name is $abc and i am from $place and i am learning $course"
            }
        }
    }
}
