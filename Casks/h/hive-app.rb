cask "hive-app" do
  arch arm: "-arm64"

  version "1.0.127"
  sha256 arm:   "b50c23a517c119295cfd378598f1a9ceb4b1f2d95fa4a3fd27bc11a3485973ba",
         intel: "ad3f91870513de3da45dd82e07510f3cc4a2c328fcdd2225c58c3dbae11be259"

  url "https://github.com/morapelker/hive/releases/download/v#{version}/Hive-#{version}#{arch}.dmg"
  name "Hive"
  desc "AI agent orchestrator for parallel coding across projects"
  homepage "https://github.com/morapelker/hive"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Hive.app"

  zap trash: [
    "~/.hive",
    "~/Library/Application Support/hive",
    "~/Library/Logs/hive",
    "~/Library/Preferences/com.hive.app.plist",
    "~/Library/Saved Application State/com.hive.app.savedState",
  ]
end
