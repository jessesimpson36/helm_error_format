# Helm errors are Ugly!

```
Error: INSTALLATION FAILED: template: camunda-platform/templates/zeebe-gateway/deployment.yaml:90:24: executing "camunda-platform/templates/zeebe-gateway/deployment.yaml" at <include "camundaPlatform.authIssuerBackendUrl" .>: error calling include: template: camunda-platform/templates/camunda/_helpers.tpl:197:10: executing "camundaPlatform.authIssuerBackendUrl" at <include "identity.keycloak.url" .>: error calling include: template: camunda-platform/templates/identity/_helpers.tpl:194:9: executing "identity.keycloak.url" at <include "identity.keycloak.port" .>: error calling include: template: camunda-platform/templates/identity/_helpers.tpl:174:23: executing "identity.keycloak.port" at <.Values.identityKeycloak.service.ports>: wrong type for value; expected map[string]interface {}; got interface {}
```

## Usage

```
awk -f format_error.awk test
```


## Output

```
 Error: INSTALLATION FAILED:
   template: camunda-platform/templates/zeebe-gateway/deployment.yaml:90:24:
     executing "camunda-platform/templates/zeebe-gateway/deployment.yaml"
      at <include "camundaPlatform.authIssuerBackendUrl" .>:
 error calling include:
   template: camunda-platform/templates/camunda/_helpers.tpl:197:10:
     executing "camundaPlatform.authIssuerBackendUrl"
      at <include "identity.keycloak.url" .>:
 error calling include:
   template: camunda-platform/templates/identity/_helpers.tpl:194:9:
     executing "identity.keycloak.url"
      at <include "identity.keycloak.port" .>:
 error calling include:
   template: camunda-platform/templates/identity/_helpers.tpl:174:23:
     executing "identity.keycloak.port"
      at <.Values.identityKeycloak.service.ports>:
 wrong type for value; expected map[string]interface {}; got interface {}
```
