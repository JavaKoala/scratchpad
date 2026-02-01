pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                deleteDir()
                checkout scmGit(
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[url: 'https://github.com/JavaKoala/scratchpad']])
            }
        }
        stage('build') {
            steps {
                sh """#!/bin/bash
                  export HOME="/var/snap/jenkins/current"
                  source /etc/profile
                  rvm use 4.0.1
                  bundle install
                  bin/ci
                """
            }
        }
    }
}