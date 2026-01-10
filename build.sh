#!/bin/bash
set -e

echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch stable

export PATH="$PATH:`pwd`/flutter/bin"

echo "Running flutter doctor..."
flutter doctor

echo "Building Flutter web app..."
flutter build web --release
