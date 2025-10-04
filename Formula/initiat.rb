class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/vtest/initiat-darwin-amd64.tar.gz"
  sha256 "f0a4ca72c64dcc0b8921bec73d2c1c05b55cad4f0ed0b0f3071f6c6d3410d66d"
  license "AGPL-3.0"
  version "test"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/vtest/initiat-darwin-amd64.tar.gz"
      sha256 "f0a4ca72c64dcc0b8921bec73d2c1c05b55cad4f0ed0b0f3071f6c6d3410d66d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/vtest/initiat-darwin-arm64.tar.gz"
      sha256 "322e8f178ddc6071477b8f458811f18e11f2eaac1ce7b885cc4d126e85980f16"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
