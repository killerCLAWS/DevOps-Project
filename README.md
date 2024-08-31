# DevOps-Project
DevOps-Project

# Configuring Jenkins 

Build the Jenkins Agent Image and push Docker Hub or ECR
 >> docker build -t custom-jenkins-agent:latest . ## Using /Dockerfile in repo

Using Jenkins Helm chart /DevOps-Project/k8s/helm-chart/jenkins/charts.yaml
 >> helm install jenkins jenkins/jenkins --values /DevOps-Project/k8s/helm-chart/jenkins/values.yaml

Access Jenkins Dashboard and install required Plugins
 >> http://<jenkins-ip>:8080. or ingress-endpoint configured
 >> Installing required Plugins Docker, Credentials

  * Go to Manage Jenkins → Manage Nodes and Clouds.
    Click on New Node → Permanent Agent and configure the agent.
  
  * Remote root directory: /home/jenkins (or any suitable directory inside the agent)
    Labels: docker-agent
    Launch method: Select Launch agent via SSH

  * Under the Docker Agent Template settings:
    Use Docker Image from above step: custom-jenkins-agent:version


# Steps to configure the Build Jenkins Job setup 

1) Configure Jenkins freestyle job, using [ Label Expression: docker-agent ] to pick "**jenkinsfile**"
2) Jenkins configuration with SCM <https://github.com/killerCLAWS/DevOps-Project/> to pick "jenkinfile" to build job.

-------------------------------------------------------------------------------------------------------

Jenkinsfiles 

1) Jenkinsfile-infra : Steps to provision infrasturece using terraform to deploy K8s cluster and Create dynamodb table.
2) Jenkinsfile-build : Steps to build the helm chart of the application and push the package in Jfrog.

-------------------------------------------------------------------------------------------------------

# Moniotoring Setup 

Using kube-prometheus-stack to deploy prometehus, grafana, pushgateway, service-monitor
https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack/


