#!/bin/bash

# Generate Homebrew formula content for a new release
# This script should be run from the homebrew-initiat repository
# Usage: ./scripts/generate-formula.sh <version>

set -e

VERSION=${1:-""}

if [ -z "$VERSION" ]; then
    echo "❌ VERSION is required. Usage: $0 <version>"
    exit 1
fi

# Check if we're in quiet mode
QUIET_MODE=false
if [ "$2" = "--quiet" ]; then
  QUIET_MODE=true
fi

if [ "$QUIET_MODE" = false ]; then
  echo "🔧 Generating Homebrew formula for version $VERSION"
  echo ""
fi

# Download and verify the release files
if [ "$QUIET_MODE" = false ]; then
  echo "📥 Downloading release files..."
fi
mkdir -p temp
cd temp

# Download the release archives
curl -L -o "initiat-darwin-amd64.tar.gz" "https://github.com/InitiatDev/initiat-cli/releases/download/${VERSION}/initiat-darwin-amd64.tar.gz"
curl -L -o "initiat-darwin-arm64.tar.gz" "https://github.com/InitiatDev/initiat-cli/releases/download/${VERSION}/initiat-darwin-arm64.tar.gz"

# Calculate SHA256 checksums
INTEL_SHA=$(shasum -a 256 "initiat-darwin-amd64.tar.gz" | cut -d' ' -f1)
ARM_SHA=$(shasum -a 256 "initiat-darwin-arm64.tar.gz" | cut -d' ' -f1)

if [ "$QUIET_MODE" = false ]; then
  echo "📊 SHA256 checksums:"
  echo "  Intel: $INTEL_SHA"
  echo "  ARM:   $ARM_SHA"
  echo ""
fi

cd ..

# Generate the formula content
if [ "$QUIET_MODE" = false ]; then
  echo "📝 Generated Homebrew formula:"
  echo "=========================================="
fi
cat << EOF
class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/${VERSION}/initiat-darwin-amd64.tar.gz"
  sha256 "$INTEL_SHA"
  license "AGPL-3.0"
  version "$VERSION"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/${VERSION}/initiat-darwin-amd64.tar.gz"
      sha256 "$INTEL_SHA"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/${VERSION}/initiat-darwin-arm64.tar.gz"
      sha256 "$ARM_SHA"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
EOF

if [ "$QUIET_MODE" = false ]; then
  echo "=========================================="
  echo ""
  echo "🚀 Next steps:"
  echo "1. Copy the formula above to Formula/initiat.rb"
  echo "2. Review the changes: git diff Formula/initiat.rb"
  echo "3. Commit and push:"
  echo "   git add Formula/initiat.rb"
  echo "   git commit -m 'Update initiat to $VERSION'"
  echo "   git push origin main"
  echo ""
  echo "4. Test installation:"
  echo "   brew tap InitiatDev/initiat"
  echo "   brew install initiat"
fi

# Clean up
rm -rf temp
