cask "motionik" do
  arch arm: "arm64", intel: "x64"

  version "2.0.5"
  sha256 arm:   "f66d9376ecfd17147abdadbc9554828cb3ed59f2261508e64915bb6c67cdf2e1",
         intel: "3ee58ec6f1667e08a7ae9719738d9a883313d67c384550a883264a57d621106d"

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
