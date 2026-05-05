cask "luxury-yacht" do
  arch arm: "arm64", intel: "amd64"

  version "1.8.1"
  sha256 arm:   "2164318d10f69ab69fd8ec1ce0c3438d4930113fb32850b2eb976024e669d205",
         intel: "a1445d6071683597f7ffa854325be84cfa559fb3b1f885f0b7f73ac19fd639f6"

  url "https://github.com/luxury-yacht/app/releases/download/v#{version}/luxury-yacht-v#{version}-macos-#{arch}.dmg",
      verified: "github.com/luxury-yacht/app/"
  name "Luxury Yacht"
  desc "Desktop app for managing Kubernetes clusters"
  homepage "https://luxury-yacht.app/"

  depends_on :macos

  app "Luxury Yacht.app"

  zap trash: "~/Library/Application Support/luxury-yacht"
end
