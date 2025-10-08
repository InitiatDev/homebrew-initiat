class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.0/initiat-darwin-amd64.tar.gz"
  sha256 "d974c6a918594ff5fc28070801abc49be1e59d39d47f1e89ecd888a6eb3b87db"
  license "AGPL-3.0"
  version "v0.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.0/initiat-darwin-amd64.tar.gz"
      sha256 "d974c6a918594ff5fc28070801abc49be1e59d39d47f1e89ecd888a6eb3b87db"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.5.0/initiat-darwin-arm64.tar.gz"
      sha256 "7fb1773f7d20ffb3932f08c475e348c7b4fca7665f3a3b70afcc359b47f5994c"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
