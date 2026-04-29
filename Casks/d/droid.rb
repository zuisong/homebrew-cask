cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.111.0"
  sha256 arm:   "83c7139654403b918a449e9c17d4047d6a2e134cebd994e67562f74dc1415168",
         intel: "edf85a70bfeb3c717f7bcc06dcbe9c49036dec5f85cf2bda22e52d478cad10ea"

  url "https://downloads.factory.ai/factory-cli/releases/#{version}/darwin/#{arch}/droid"
  name "Droid"
  desc "AI-powered software engineering agent by Factory"
  homepage "https://docs.factory.ai/cli/getting-started/overview"

  livecheck do
    url "https://downloads.factory.ai/factory-cli/LATEST"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos
  depends_on formula: "ripgrep"

  binary "droid"

  zap trash: [
    "~/.factory",
    "~/.local/bin/droid",
  ]
end
