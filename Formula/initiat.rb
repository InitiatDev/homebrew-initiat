class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.0/initiat-darwin-amd64.tar.gz"
  sha256 "effacc6ce1c34caa19cc602a8a19bd264df3179367013c99cc9acc5c89bb99f0"
  license "AGPL-3.0"
  version "v0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.0/initiat-darwin-amd64.tar.gz"
      sha256 "effacc6ce1c34caa19cc602a8a19bd264df3179367013c99cc9acc5c89bb99f0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.0/initiat-darwin-arm64.tar.gz"
      sha256 "7d6a511da43b067d0d82dc41d0ad04a0999f7c9c04996dd2f9b58a426bd3b231"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
