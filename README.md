# Helm errors are Ugly!

> Error: INSTALLATION FAILED: template: camunda-platform/templates/zeebe-gateway/deployment.yaml:90:24: executing "camunda-platform/templates/zeebe-gateway/deployment.yaml" at <include "camundaPlatform.authIssuerBackendUrl" .>: error calling include: template: camunda-platform/templates/camunda/_helpers.tpl:197:10: executing "camundaPlatform.authIssuerBackendUrl" at <include "identity.keycloak.url" .>: error calling include: template: camunda-platform/templates/identity/_helpers.tpl:194:9: executing "identity.keycloak.url" at <include "identity.keycloak.port" .>: error calling include: template: camunda-platform/templates/identity/_helpers.tpl:174:23: executing "identity.keycloak.port" at <.Values.identityKeycloak.service.ports>: wrong type for value; expected map[string]interface {}; got interface {}


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

## Output with color
![2024-04-02-152845_grim](https://github.com/jessesimpson36/helm_error_format/assets/19277629/46b41b08-13cf-489a-96a2-fd8c797016b3)


## vim error format

In vim, there is a variable called `errorformat` which is used to navigate the files of a stacktrace within the quickfix menu.  Here is an errorformat + function you can add to your vimrc to read the newly formatted stacktrace:

```
function! HelmErrorFormat()
  set efm=%.%#\ \ \ template:\ %f:%l:%c:
endfunction

nmap <silent> <leader>gh :call HelmErrorFormat()<CR>:cf<CR>:copen<CR><CR>
```
