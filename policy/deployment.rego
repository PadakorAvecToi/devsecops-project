package main

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    not container.securityContext
    msg := sprintf("Le conteneur '%s' n'a pas de securityContext defini", [container.name])
}

deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    container.securityContext.runAsNonRoot != true
    msg := sprintf("Le conteneur '%s' n'est pas configure avec runAsNonRoot: true", [container.name])
}