cask "conar" do
  arch arm: "arm64", intel: "x64"

  version "0.31.2,2605056odiedidu"
  sha256 arm:   "34e4cf7a32f9e74f39de658159ccde0dca1c9b62e533b788dfc874efe6d48cbc",
         intel: "9fd1ad9e92c4d6b65ca8dcdb40b6248355a1040ec9b9aa69937ae219737f7a14"

  url "https://download.todesktop.com/25112796k32u7/Conar%20#{version.csv.first}%20-%20Build%20#{version.csv.second}-#{arch}-mac.zip",
      verified: "download.todesktop.com/25112796k32u7/"
  name "Conar"
  desc "AI-powered database and data management tool"
  homepage "https://conar.app/"

  livecheck do
    url "https://download.todesktop.com/25112796k32u7/latest-mac.yml"
    regex(/Conar\s*v?(\d+(?:\.\d+)+)\s*-?\s*(?:Build\s*([a-z\d]+?)[._-])?#{arch}[._-]mac\.zip/i)
    strategy :electron_builder do |yaml, regex|
      yaml["files"]&.map do |item|
        match = item["url"]&.match(regex)
        next if match.blank?

        match[2].present? ? "#{match[1]},#{match[2]}" : match[1]
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Conar.app"

  zap trash: [
    "~/Library/Application Support/Conar",
    "~/Library/Logs/Conar",
    "~/Library/Preferences/com.wannabespace.conar.plist",
    "~/Library/Saved Application State/com.wannabespace.conar.savedState",
  ]
end
