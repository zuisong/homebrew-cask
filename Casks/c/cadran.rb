cask "cadran" do
  version "1.3.8"
  sha256 "987f4b4a8e0bd95bad65f4333f3de713e6f78b9593b8170f71f2effe1d66407d"

  url "https://github.com/Ilyomix/Cadran-releases/releases/download/v#{version}/Cadran-#{version}.dmg",
      verified: "github.com/Ilyomix/Cadran-releases/"
  name "Cadran"
  desc "Desktop clock rendered behind your icons"
  homepage "https://cadranapp.com/"

  livecheck do
    url "https://github.com/Ilyomix/Cadran-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Cadran.app"

  zap trash: [
    "~/Library/Application Support/Cadran",
    "~/Library/Preferences/ilyomix.Cadran.plist",
  ]
end
