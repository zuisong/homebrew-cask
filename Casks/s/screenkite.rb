cask "screenkite" do
  version "1.2.1,377"
  sha256 "fff0dc78be5f34bae0cde2c6766d031bb4c13f3452c65eccbc6335743c42c82e"

  url "https://downloads.screenkite.com/mac-releases/ScreenKite-#{version.csv.second}.zip"
  name "ScreenKite"
  desc "Screen recorder and editor"
  homepage "https://www.screenkite.com/"

  livecheck do
    url "https://downloads.screenkite.com/mac-releases/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "ScreenKite.app"
end
