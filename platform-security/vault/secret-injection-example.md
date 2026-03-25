# Secret Injection Example

Applications should retrieve secrets dynamically rather than storing long-lived credentials in code, environment variables, or deployment manifests.

## Example Approach

- application authenticates using workload identity
- Vault validates the workload identity
- Vault returns a short-lived secret
- the application uses the secret for a limited time only

## Security Benefits

- reduces exposure of static credentials
- limits credential lifetime
- improves revocation and rotation
- supports centralized secret access policies
