FROM jenkins/jenkins:alpine

USER root
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

USER jenkins
# unsecure admin user for local testing only
ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false'
COPY --chown=jenkins:jenkins create-job.groovy /usr/share/jenkins/ref/init.groovy.d/create-job.groovy
RUN install-plugins.sh git workflow-job workflow-aggregator extended-choice-parameter