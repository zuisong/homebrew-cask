cask "open-webui@alpha" do
  version "0.0.18"
  sha256 "c89d3d05f0a61263b7bea6ea87e155123fd3039f851d44501eaefd190dfcd723"

  url "https://github.com/open-webui/desktop/releases/download/v#{version}/open-webui-arm64.dmg",
      verified: "github.com/open-webui/desktop/"
  name "Open WebUI"
  desc "Desktop application for Open WebUI"
  homepage "https://openwebui.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Open WebUI.app"

  zap trash: "~/Library/Application Support/open-webui"
end
