cask "motionik" do
  arch arm: "arm64", intel: "x64"

  version "2.1.2"
  sha256 arm:   "2bb38c9458f8d51c52d72b86d6b8621469c96841648608de7bd82735d47be7d3",
         intel: "184ca128ed9782f642cf18fc3dad88cede21e547ffe55c575f2c0a78b46d4582"

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
