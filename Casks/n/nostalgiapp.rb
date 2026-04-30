cask "nostalgiapp" do
  version "1.0.8.8.2"
  sha256 "b714ca75524d26d6e311d8bb41b3c2c022fdb3f4d2801fe7b0710707ecad346d"

  url "https://www.nostalgi.app/downloads/NostalgiApp-#{version}.dmg"
  name "NostalgiApp"
  desc "Launcher for eXoDOS and retro game collections"
  homepage "https://nostalgi.app/"

  livecheck do
    url "https://nostalgi.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "NostalgiApp.app"

  zap trash: [
    "~/Library/Application Support/NostalgiApp",
    "~/Library/Caches/com.nostalgi.app",
    "~/Library/Logs/NostalgiApp",
    "~/Library/Preferences/com.nostalgi.app.plist",
  ]
end
