cask "tuist" do
  version "4.187.0"
  sha256 "7aa217879e4c5986d4389152a4a654688ab070f3d9d0168a5be525f9bb213da1"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
