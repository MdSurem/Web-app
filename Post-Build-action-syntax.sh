pipeline{
	agent any
	stages{
		stage("code"){
			steps{
				echo "This is code stage"
			}
		}
		stage("build"){
			steps{
				echo "This is build stage"
			}
		}
		stage("Artifact"){
			steps{
				echo "This is war file stored"
			}
		}
		stage("Deploy"){
			steps{
				echo "This is deloy stage"
			}
		}
	}
	post{
		success{
			echo "Your pipeline is successful"
		}
		failure{
			echo "your pipeline is failed"
		}
	}
}
