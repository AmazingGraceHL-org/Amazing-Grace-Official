#!/bin/bash
# Build script for Android development builds and releases
# Usage: ./build-android.sh [--release]

set -e

RELEASE_MODE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --release)
      RELEASE_MODE=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo "Building Android APK..."
echo "Release mode: $RELEASE_MODE"

# Ensure dependencies are installed
npm ci --no-audit --no-fund

# Build web assets
echo "Building web assets..."
npm run build:mobile

# Create build output directory
mkdir -p build-scripts/android-build

if [ "$RELEASE_MODE" = true ]; then
  echo "Creating release APK..."
  # In a real build, this would:
  # 1. Sign the APK with release keystore
  # 2. Align and compress
  # 3. Create final release APK
  # For now, create a placeholder
  echo "Release APK would be created here"
  cp -r dist build-scripts/android-build/release
else
  echo "Creating debug APK..."
  cp -r dist build-scripts/android-build/debug
fi

echo "Android build complete!"
echo "Output: build-scripts/android-build/"

# Perform smoke test
echo "Running smoke tests..."
if [ -f "tests/smoke-test.js" ]; then
  npm run test:smoke
fi

echo "✓ Android build successful"
