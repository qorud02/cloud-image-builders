#!/bin/bash
set -euxo pipefail

CURRENT_DIR=$(dirname "$0")

python3 -m venv /tmp/packer-rl8-venv
# shellcheck source=/dev/null
source /tmp/packer-rl8-venv/bin/activate
pip3 install -r "${CURRENT_DIR}/requirements-rl8.txt"
ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 /tmp/packer-rl8-venv/bin/ansible-playbook "$@"
