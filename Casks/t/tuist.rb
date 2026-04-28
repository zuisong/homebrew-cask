cask "tuist" do
  version "4.188.4"
  sha256 "9aea0d6c6f0ca81b60d1e12d099bf09cefef1e2af529549ab9069f9bc169832b"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  depends_on :macos

  binary "tuist"

  zap trash: "~/.tuist"
end
