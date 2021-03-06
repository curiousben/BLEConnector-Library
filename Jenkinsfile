#!/usr/bin/env groovy
pipeline {
    agent none
    environment {
      LIBRARY_PATH = 'modules/base'
      MICROSERVICE = 'ble-connector'
      VERSION = '1.1.0'
    }
    stages {
        stage('Install, Test, and Build BLEConnector') {
            agent {
                docker 'node:8.12.0-jessie'
            }
            environment {
                CI = 'true'
            }
            steps {
                dir(LIBRARY_PATH) {
                    sh 'npm install'
                    sh 'npm test'
                    sh 'npm pack'
                }
            }
        }
        stage('Build Docker Image') {
            agent {
                dockerfile {
                  filename 'Dockerfile'
                  dir 'modules/base'
                  additionalBuildArgs '--build-arg NPM_PACKAGE_NAME=${MICROSERVICE} --build-arg NPM_PACKAGE_VERSION=${VERSION} --build-arg NPM_PACKAGE=${MICROSERVICE}-${VERSION}.tgz -t curiousben/${MICROSERVICE}-core:${VERSION}'
                }
            }
            steps {
                sh 'echo Successfully built the image'
            }
        }
    }
}
