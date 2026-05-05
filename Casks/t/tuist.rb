cask "tuist" do
  version "4.191.7"
  sha256 "80536a33d2c4aa160bbdecce2ef68d935c658703decb08265fb41bb6a308e1cf"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
