cask "open-webui" do
  version "0.0.19"
  sha256 "3d0b19aca1c3a5dec2a722d32b92bbbe66396dc6ff116974f96892c0db22cb01"

  url "https://github.com/open-webui/desktop/releases/download/v#{version}/open-webui-arm64.dmg",
      verified: "github.com/open-webui/desktop/"
  name "Open WebUI"
  desc "Desktop application for Open WebUI"
  homepage "https://openwebui.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on macos: ">= :monterey"

  app "Open WebUI.app"

  zap trash: "~/Library/Application Support/open-webui"
end
