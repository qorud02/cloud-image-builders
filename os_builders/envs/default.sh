#!/bin/bash
set -euxo pipefail

CURRENT_DIR=$(dirname "$0")

python3 -m venv /tmp/packer-default-venv
# shellcheck source=/dev/null
source /tmp/packer-default-venv/bin/activate
pip3 install -r "${CURRENT_DIR}/requirements.txt"
ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 /tmp/packer-default-venv/bin/ansible-playbook "$@"
