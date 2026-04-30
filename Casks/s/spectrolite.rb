cask "spectrolite" do
  arch arm: "arm64", intel: "x64"

  version "1.4.3"
  sha256 arm:   "0362152a86e72025991173544237cfad1c48addc5d56158b248dbcb60da60d62",
         intel: "8b1c4279f9e1aecb30bbb1e605c8ea0285d2016d407f553775c9b316f3e4edda"

  url "https://spectrolite.app/downloads/Spectrolite-#{version}-#{arch}.zip"
  name "Spectrolite"
  desc "App for making risograph prints"
  homepage "https://spectrolite.app/"

  livecheck do
    url "https://d398dq9v5f85fz.cloudfront.net/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on :macos

  app "Spectrolite.app"

  zap trash: [
    "~/Library/Application Support/spectrolite",
    "~/Library/Logs/Spectrolite",
    "~/Library/Preferences/com.electron.spectrolite.plist",
    "~/Library/Saved Application State/com.electron.spectrolite.savedState",
  ]
end
