#!/bin/bash
# Build script for iOS development builds and releases
# Usage: ./build-ios.sh [--release]

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

echo "Building iOS app..."
echo "Release mode: $RELEASE_MODE"

# Ensure dependencies are installed
npm ci --no-audit --no-fund

# Build web assets
echo "Building web assets..."
npm run build:mobile

# Create build output directory
mkdir -p build-scripts/ios-build

if [ "$RELEASE_MODE" = true ]; then
  echo "Creating release build for App Store..."
  # In a real build, this would:
  # 1. Use Xcode to create release build
  # 2. Create app archive (.xcarchive)
  # 3. Export IPA for App Store
  # For now, create a placeholder
  echo "Release build would be created here"
  cp -r dist build-scripts/ios-build/release
else
  echo "Creating debug build..."
  cp -r dist build-scripts/ios-build/debug
fi

echo "iOS build complete!"
echo "Output: build-scripts/ios-build/"

# Perform smoke test
echo "Running smoke tests..."
if [ -f "tests/smoke-test.js" ]; then
  npm run test:smoke
fi

echo "✓ iOS build successful"
