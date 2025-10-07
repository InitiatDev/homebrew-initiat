class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.0/initiat-darwin-amd64.tar.gz"
  sha256 "bdc5e851cdc6e1e29cc098d94c97f75a085422acfa7a8f08450b9f6bc3036b9b"
  license "AGPL-3.0"
  version "v0.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.0/initiat-darwin-amd64.tar.gz"
      sha256 "bdc5e851cdc6e1e29cc098d94c97f75a085422acfa7a8f08450b9f6bc3036b9b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.0/initiat-darwin-arm64.tar.gz"
      sha256 "ae1d11f60e035b60c9fdaaa79b5dc176c7c38312b9bec364f138eb5c66f81a2d"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
