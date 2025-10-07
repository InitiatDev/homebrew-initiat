class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.1/initiat-darwin-amd64.tar.gz"
  sha256 "e91b9eaebbc4034f463bfa6df8ad0b532742c11d14fd23cb2367514f5face0d0"
  license "AGPL-3.0"
  version "v0.4.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.1/initiat-darwin-amd64.tar.gz"
      sha256 "e91b9eaebbc4034f463bfa6df8ad0b532742c11d14fd23cb2367514f5face0d0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.4.1/initiat-darwin-arm64.tar.gz"
      sha256 "b21dfda455aee41dad50f3307faab8dfb33cdc1ae72c759fc95f9aad1611649e"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
