cask "unshaky" do
  version "0.7.0"
  sha256 "722fdd718fe47e58f1ea9c60fbcaf81cb4bbd6173b9cf7a8c4a6425a977a9fd9"

  url "https://github.com/aahung/Unshaky/releases/download/v#{version}/Unshaky_v#{version}.zip"
  name "Unshaky"
  desc "Software fix for double key presses on Apple's butterfly keyboard"
  homepage "https://github.com/aahung/Unshaky"

  livecheck do
    url "https://raw.githubusercontent.com/aahung/Unshaky/master/appcast.xml"
    strategy :sparkle, &:short_version
  end

  no_autobump! because: :requires_manual_review

  auto_updates true
  depends_on macos: ">= :sierra"

  app "Unshaky.app"

  zap trash: [
    "~/Library/Caches/com.nestederror.Unshaky",
    "~/Library/Preferences/com.nestederror.Unshaky.plist",
  ]
end
