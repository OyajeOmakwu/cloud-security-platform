package kubernetes.admission

approved_registries := {
  "ghcr.io/",
  "public.ecr.aws/",
  "123456789012.dkr.ecr.ca-central-1.amazonaws.com/"
}

deny[msg] {
  input.request.kind.kind == "Pod"
  container := input.request.object.spec.containers[_]
  not startswith_any(container.image, approved_registries)
  msg := sprintf("Container image registry is not approved: %s", [container.image])
}

startswith_any(image, registries) {
  some registry
  registry := registries[_]
  startswith(image, registry)
}
