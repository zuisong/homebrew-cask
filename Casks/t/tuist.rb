cask "tuist" do
  version "4.188.0"
  sha256 "3acf05be4e81c6ed4716a347ba643ae668cab8f43a41ad90c76ee7c7fd3826a9"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
