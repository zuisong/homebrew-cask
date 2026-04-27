cask "motionik" do
  arch arm: "arm64", intel: "x64"

  version "2.0.4"
  sha256 arm:   "e7daa13053d2c1cdb8ea44df746ec8afbbfde03969db52e858b8004a4d2cd43b",
         intel: "75114b075bf425b085c8fd62a6ca066841f1b8c54305da72f19f3234cbb4d635"

  url "https://assets.motionik.com/releases/Motionik-#{version}-#{arch}.dmg"
  name "Motionik"
  desc "Screen recording software"
  homepage "https://motionik.com/"

  livecheck do
    url "https://assets.motionik.com/releases/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: ">= :ventura"

  app "Motionik.app"

  zap trash: [
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.motionik.screenrecorder.sfl*",
        "~/Library/Application Support/motionik",
        "~/Library/Logs/motionik",
        "~/Library/Preferences/com.motionik.screenrecorder.plist",
      ],
      rmdir: "~/Motionik-Recordings"
end
