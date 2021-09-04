import hudson.plugins.git.*;
import jenkins.model.Jenkins;

def scm = new GitSCM("https://github.com/KaroonK/lilliput-ws.git")
scm.branches = [new BranchSpec("*/main")];

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, "Jenkinsfile")

def parent = Jenkins.instance
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(parent, "lilliput-ws")
job.definition = flowDefinition

parent.reload()