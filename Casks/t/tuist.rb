cask "tuist" do
  version "4.191.0"
  sha256 "b07a521f8dd5930d9f1a3590aa9ece8f96d8e55a5b7ff4fb7587d0327a664551"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
