cask "stretchly" do
  arch arm: "-arm64"

  version "1.17.2"
  sha256 arm:   "9e757eb1601c11a1b0540ad462ed8deef5a9959cc98975c4d3cf9b073a709207",
         intel: "d40d6a5868965d6ba8d2c502c5f8370574f24c25609071fa2bfedce6687873d8"

  url "https://github.com/hovancik/stretchly/releases/download/v#{version}/stretchly-#{version}#{arch}.dmg",
      verified: "github.com/hovancik/stretchly/"
  name "Stretchly"
  desc "Break time reminder app"
  homepage "https://hovancik.net/stretchly/"

  # This is the default strategy, but we need to explicitly
  # specify it to continue checking it while it is deprecated
  livecheck do
    url :url
    strategy :git
  end

  disable! date: "2026-09-01", because: :unsigned

  depends_on macos: ">= :big_sur"

  app "Stretchly.app"

  uninstall quit: "net.hovancik.stretchly"

  zap trash: [
    "~/Library/Application Support/Stretchly",
    "~/Library/Logs/Stretchly",
    "~/Library/Preferences/net.hovancik.stretchly.plist",
  ]
end
