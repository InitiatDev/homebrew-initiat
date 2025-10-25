class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.1/initiat-darwin-amd64.tar.gz"
  sha256 "01719b5679ac79e9a82d784330a9e0798d136aa9c69eacbbb05651ce05659807"
  license "AGPL-3.0"
  version "v0.5.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.1/initiat-darwin-amd64.tar.gz"
      sha256 "01719b5679ac79e9a82d784330a9e0798d136aa9c69eacbbb05651ce05659807"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.1/initiat-darwin-arm64.tar.gz"
      sha256 "08e527dfb94196eb639451dfcd1ede1d77b45d9b83f2a24b7fbd5d8fdc4a701f"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
