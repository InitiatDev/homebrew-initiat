class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.3.0/initiat-darwin-amd64.tar.gz"
  sha256 "408e0d6003d81264431dbad75f185d736eb75316d981504d0ef1a9fffbc6e5ce"
  license "AGPL-3.0"
  version "v0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.3.0/initiat-darwin-amd64.tar.gz"
      sha256 "408e0d6003d81264431dbad75f185d736eb75316d981504d0ef1a9fffbc6e5ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.3.0/initiat-darwin-arm64.tar.gz"
      sha256 "652e3ee060c26016524b60e9548ef2b6fe6df609d19dfdae65ed29440917148a"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
