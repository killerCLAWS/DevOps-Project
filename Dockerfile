FROM jenkins/inbound-agent:latest

USER root
# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# Install Maven
RUN apt-get update && \
    apt-get install -y maven openjdk-11-jdk
# Clean up
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean
USER jenkins
