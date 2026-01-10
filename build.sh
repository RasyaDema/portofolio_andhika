#!/bin/bash
set -e

# Check if Flutter already exists
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git --depth 1 --branch stable
else
  echo "Flutter SDK already exists, skipping clone..."
fi

export PATH="$PATH:`pwd`/flutter/bin"

echo "Running flutter doctor..."
flutter doctor

echo "Getting dependencies..."
flutter pub get

echo "Building Flutter web app..."
flutter build web --release
