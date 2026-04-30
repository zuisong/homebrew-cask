cask "tuist" do
  version "4.191.2"
  sha256 "830635af55546aa2bdae164ca9eb5051fd01c42052fe835d1f77ac231d64dd91"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
