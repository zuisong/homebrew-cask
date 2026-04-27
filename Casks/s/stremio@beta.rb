cask "stremio@beta" do
  arch arm: "arm64", intel: "x64"

  version "5.1.20"
  sha256 arm:   "768316e7a5c5698cd31cf0be67c01af6f106b69c5ec042e025d87b5da2800a98",
         intel: "75d86cecd6d40cf920f96fa7478740d08a6279923f62ab9f182ead3c48fece1c"

  url "https://dl.strem.io/stremio-shell-macos/v#{version}/Stremio_#{arch}.dmg"
  name "Stremio"
  desc "Open-source media center"
  homepage "https://www.strem.io/"

  livecheck do
    url "https://www.stremio.com/updater/check?product=stremio-shell-macos&arch=#{arch}"
    strategy :json do |json|
      json["version"]
    end
  end

  conflicts_with cask: "stremio"
  depends_on macos: ">= :big_sur"

  app "Stremio.app"

  zap trash: [
    "~/Library/Application Support/Smart Code ltd",
    "~/Library/Application Support/stremio-server",
    "~/Library/Caches/Smart Code ltd",
    "~/Library/Preferences/com.smartcodeltd.stremio.plist",
    "~/Library/Preferences/com.stremio.Stremio.plist",
    "~/Library/Saved Application State/com.smartcodeltd.stremio.savedState",
  ]
end
