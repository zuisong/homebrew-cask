cask "tuist" do
  version "4.188.2"
  sha256 "54de1fd5bdd81d763568ca06a5a4817e31ad7a9ee069e066c1966818797b9282"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
