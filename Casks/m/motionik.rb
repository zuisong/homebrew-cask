cask "motionik" do
  arch arm: "arm64", intel: "x64"

  version "2.0.2"
  sha256 arm:   "59cf090fe76206afb2f3f4f908d5f4d08b58fbd16eb91c0e472dad0c757fb96f",
         intel: "9ea63eeeb2d3271f9bdc1718febb891b2d9fc46b0267990658a7679893477eeb"

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
