cask "clocker" do
  version "26.09,26.9"
  sha256 "9ef4ca12e04f92476d3ed2073ae01d382020553851c1bf46dadb849b6d31f33c"

  url "https://github.com/n0shake/Clocker/releases/download/#{version.csv.second || version.csv.first}/Clocker.zip",
      verified: "github.com/n0shake/Clocker/"
  name "Clocker"
  desc "Menu bar timezone tracker and compact calendar"
  homepage "https://abhishekbanthia.com/clocker"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest do |json, regex|
      version = json["name"]&.[](regex, 1)
      tag_version = json["tag_name"]&.[](regex, 1)
      next if version.blank? || tag_version.blank?

      (version == tag_version) ? tag_version : "#{version},#{tag_version}"
    end
  end

  depends_on macos: ">= :sonoma"

  app "Clocker.app"

  uninstall launchctl: "com.abhishek.ClockerHelper",
            quit:      "com.abhishek.Clocker"

  zap trash: [
    "~/Library/Application Scripts/com.abhishek.Clocker",
    "~/Library/Containers/com.abhishek.Clocker",
    "~/Library/Preferences/com.abhishek.Clocker.plist",
    "~/Library/Preferences/com.abhishek.Clocker.prefs",
    "~/Library/Preferences/com.abhishek.ClockerHelper.plist",
  ]
end
