cask "athas" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "ec9a038eee1d71d7b816f98ad9986180866b7cadeb7f231dd8571fc16aa4ddf5",
         intel: "cc158d4b39548fe8cc858263c14c69ce1b55c599d66ce74d643979e999e435be"

  url "https://github.com/athasdev/athas/releases/download/v#{version}/Athas_#{version}_#{arch}.dmg",
      verified: "github.com/athasdev/athas/"
  name "Athas"
  desc "Lightweight code editor"
  homepage "https://athas.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Athas.app"

  zap trash: [
    "~/Library/Application Support/com.code.athas",
    "~/Library/Caches/com.code.athas",
    "~/Library/Logs/com.code.athas",
    "~/Library/Preferences/com.code.athas.plist",
    "~/Library/WebKit/com.code.athas",
  ]
end
