class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.0/initiat-darwin-amd64.tar.gz"
  sha256 "7d5b56255ea8709b2003d17da3c38b960293741671d8b18a305dc5eb102e850e"
  license "AGPL-3.0"
  version "v0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.0/initiat-darwin-amd64.tar.gz"
      sha256 "7d5b56255ea8709b2003d17da3c38b960293741671d8b18a305dc5eb102e850e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.6.0/initiat-darwin-arm64.tar.gz"
      sha256 "d93eac9a22029afb1435f591fda6e8d06316bd006245f5eb4fd4ed940e11cc6c"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
