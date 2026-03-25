#!/bin/bash
set -euo pipefail

syft . -o spdx-json > sbom.spdx.json
echo "SBOM generated at sbom.spdx.json"
