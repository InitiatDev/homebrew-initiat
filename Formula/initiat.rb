class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.2.1/initiat-darwin-amd64.tar.gz"
  sha256 "53f1510355726916a727b6e32e1f3c86729621762c677a6d288b3ef51a68f189"
  license "AGPL-3.0"
  version "v0.2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.2.1/initiat-darwin-amd64.tar.gz"
      sha256 "53f1510355726916a727b6e32e1f3c86729621762c677a6d288b3ef51a68f189"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.2.1/initiat-darwin-arm64.tar.gz"
      sha256 "1f22da7826d4ea5bfe3a405f3f5c62caccc9786b26c65520d4dd3966d5cb8b7b"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
