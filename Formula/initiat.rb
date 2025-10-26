class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.1/initiat-darwin-amd64.tar.gz"
  sha256 "b4c017ecffa9b206767421c33c8963c31e6bcec7fcec732ecd796e832200f3a3"
  license "AGPL-3.0"
  version "v0.6.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.1/initiat-darwin-amd64.tar.gz"
      sha256 "b4c017ecffa9b206767421c33c8963c31e6bcec7fcec732ecd796e832200f3a3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.1/initiat-darwin-arm64.tar.gz"
      sha256 "e188a87b2cff09908e638eb68eac772c6ead84d64e2b9bc8955e1ac9778ee19c"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
