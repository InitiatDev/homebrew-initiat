class Initiat < Formula
  desc "The Developer Experience Platform that eliminates onboarding friction"
  homepage "https://initiat.dev"
  url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.1/initiat-darwin-amd64.tar.gz"
  sha256 "dc9cfa01039e23541ee57885944c445fea64f11125c60871d833a251f61f6f8e"
  license "AGPL-3.0"
  version "v0.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.1/initiat-darwin-amd64.tar.gz"
      sha256 "dc9cfa01039e23541ee57885944c445fea64f11125c60871d833a251f61f6f8e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/InitiatDev/initiat-cli/releases/download/v0.7.1/initiat-darwin-arm64.tar.gz"
      sha256 "e9e461172b7db20b7dae5c1d537db6fab6ea56059aa5c697f1d3bbf737a42c54"
    end
  end

  def install
    bin.install "initiat"
  end

  test do
    system "#{bin}/initiat", "version"
  end
end
