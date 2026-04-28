cask "motionik" do
  arch arm: "arm64", intel: "x64"

  version "2.0.8"
  sha256 arm:   "a0333efafa0ce8ed0ab7275254cbc95e3b5def3c85d996be4acdbafcc86dfe66",
         intel: "593465b3c7f1006b6a9c35c83917040a5711cbe5cfcb6509fe7a343d3472d1b2"

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
