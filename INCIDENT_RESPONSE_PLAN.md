# Incident Response Plan

## Scenario
A simulated credential is accidentally hardcoded in a project file.
Only a clearly labelled fake value will be used for this exercise.

## Response Steps

1. Detection: Use GitHub Actions to detect the simulated exposure.
2. Inspection: Review the scan output and identify the affected file.
3. Containment: Assess the exposure. For a real credential, revoke or
   rotate it immediately. No real credential will be revoked in this exercise.
4. Eradication: Remove the fake credential from the file.
5. Recovery: Run the security check again and verify that it passes.
6. Documentation: Record the incident and response in a GitHub Issue.
