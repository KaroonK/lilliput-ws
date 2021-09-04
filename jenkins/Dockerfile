FROM jenkins/jenkins:lts

USER root
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install --no-cache --upgrade pip setuptools unittest-xml-reporting

USER jenkins
# unsecure admin user for local testing only
ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false'
COPY --chown=jenkins:jenkins * /usr/share/jenkins/ref/init.groovy.d/
RUN install-plugins.sh git workflow-job workflow-aggregator extended-choice-parameter pipeline-utility-steps junit pagerduty