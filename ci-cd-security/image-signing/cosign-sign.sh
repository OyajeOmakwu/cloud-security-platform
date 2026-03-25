#!/bin/bash
set -euo pipefail

IMAGE_NAME="${1:-my-image:latest}"

cosign sign "${IMAGE_NAME}"
