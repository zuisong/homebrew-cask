cask "slack" do
  arch arm: "arm64", intel: "x64"

  on_catalina do
    version "4.33.90"
    sha256 arm:   "8c060d33c7c451b58abaed380da4e6781089530d3b9c12da70e738e27c4eb47c",
           intel: "7e0ba8a18a9cf95090ad80f58437d647eee5d1842ac4f15ea053c16c1629edde"

    url "https://downloads.slack-edge.com/releases/macos/#{version}/prod/#{arch}/Slack-#{version}-macOS.dmg",
        verified: "downloads.slack-edge.com/"

    livecheck do
      skip "Legacy version"
    end
  end
  on_big_sur :or_newer do
    version "4.43.51"
    sha256 arm:   "fbdc8f3ad8f6b42976f537bb17126423587326fe0a472be1554cc7e6ae63d0dd",
           intel: "0ec14540b667430ebe97b18d861bf8763fba4c5cad94a2cbb5e1d3bb46f6b1bc"

    url "https://downloads.slack-edge.com/desktop-releases/mac/#{arch}/#{version}/Slack-#{version}-macOS.dmg",
        verified: "downloads.slack-edge.com/"

    livecheck do
      url "https://slack.com/ssb/download-osx"
      strategy :header_match
    end
  end

  name "Slack"
  desc "Team communication and collaboration software"
  homepage "https://slack.com/"

  auto_updates true
  conflicts_with cask: "slack@beta"
  depends_on macos: ">= :catalina"

  app "Slack.app"

  uninstall quit: "com.tinyspeck.slackmacgap"

  zap trash: [
    "/Library/Logs/DiagnosticReports/Slack_*",
    "~/Library/Application Scripts/com.tinyspeck.slackmacgap",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.tinyspeck.slackmacgap.sfl*",
    "~/Library/Application Support/Slack",
    "~/Library/Caches/com.tinyspeck.slackmacgap*",
    "~/Library/Containers/com.tinyspeck.slackmacgap*",
    "~/Library/Cookies/com.tinyspeck.slackmacgap.binarycookies",
    "~/Library/Group Containers/*.com.tinyspeck.slackmacgap",
    "~/Library/Group Containers/*.slack",
    "~/Library/HTTPStorages/com.tinyspeck.slackmacgap*",
    "~/Library/Logs/Slack",
    "~/Library/Preferences/ByHost/com.tinyspeck.slackmacgap.ShipIt.*.plist",
    "~/Library/Preferences/com.tinyspeck.slackmacgap*",
    "~/Library/Saved Application State/com.tinyspeck.slackmacgap.savedState",
    "~/Library/WebKit/com.tinyspeck.slackmacgap",
  ]
end
