pipeline{
    agent any
    // parameters{
    //     choice(name: 'environment', choices: ['qa', 'prod'], description: 'Entorno de ejecucioon')
    // }
    triggers{
        pollSCM 'H/5 * * * *'
    }
    tools {
        maven 'maven 3.6.3'
    }
    stages{
       stage('clean ws'){
            steps{
                deleteDir()
            }
       }
       stage('SCM'){
         steps{
            checkout scm
         }
       }
       stage('Compile master'){
            when{
                branch 'master'
            }
            steps{
                echo "master"
                sh label: '', script: 'mvn clean install -DskipTests'
                sh label: '', script: 'cp target/app-1.0.jar /home/ec2-user/app'
                sh label: '', script: 'cp src/main/resources/scripts/run-app.sh /home/ec2-user/app'
                sh label: '', script: 'sudo sh /home/ec2-user/app/run-app.sh'
            }
       }

    }
}