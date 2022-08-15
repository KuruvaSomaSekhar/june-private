//Scripted
//Declarative

pipeline {
    agent any
    stages{
        stage("Build code"){
            steps {
                println "Im in the first stage"
                echo "I'm writing with echo command"
                sh "mvn clean package"
            }
        }
        stage("docker build"){
            steps {
                println "Im in the Second stage"
                echo "I'm writing with echo command"
                sh "docker ps"
            }
        }
        stage("Stage3"){
            steps {
                println "Im in the third stage"
                echo "I'm writing with echo command"
            }
        }
    }
}