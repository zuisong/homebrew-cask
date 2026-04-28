cask "tuist" do
  version "4.189.0"
  sha256 "b9e41cf865f43a6af78285a08f79bc9a79fb1115497fb7b6c0b9ab54802743fc"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
