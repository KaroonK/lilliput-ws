import java.lang.reflect.*;
import jenkins.model.Jenkins;
import jenkins.model.*;
import org.jenkinsci.plugins.scriptsecurity.scripts.*;
import org.jenkinsci.plugins.scriptsecurity.sandbox.whitelists.*;

scriptApproval = ScriptApproval.get()
alreadyApproved = new HashSet<>(Arrays.asList(scriptApproval.getApprovedSignatures()))

scriptApproval.approveSignature("new groovy.util.XmlParser");
scriptApproval.approveSignature("method groovy.util.XmlParser parse java.lang.String")
scriptApproval.approveSignature("method groovy.util.Node children")
scriptApproval.approveSignature("method groovy.util.Node attributes")
scriptApproval.save()

