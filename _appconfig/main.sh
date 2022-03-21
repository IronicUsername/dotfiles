#!/bin/bash
echo "==> Running main.sh"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Setting up VSCode..."
$current_relative_path/vscode/main.sh