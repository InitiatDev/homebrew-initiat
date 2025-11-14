class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/0.7.2/initiat-darwin-amd64.tar.gz"
  sha256 "adf7835940bc55d9a39bfdec3e9a2cb76430f905e8ce72d46c0b2ae189e9ac23"
  license "AGPL-3.0"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/0.7.2/initiat-darwin-amd64.tar.gz"
      sha256 "adf7835940bc55d9a39bfdec3e9a2cb76430f905e8ce72d46c0b2ae189e9ac23"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/0.7.2/initiat-darwin-arm64.tar.gz"
      sha256 "28922b027060ce8346b70d2c09cae4e7e09a651a2741f3c717ee96a7838b0c6b"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
