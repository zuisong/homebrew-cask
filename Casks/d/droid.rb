cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.114.1"
  sha256 arm:   "49b5e60d41fe72edd1aed7fddc54d678da2d6d71dacb325722bc260e8b5acda6",
         intel: "3898316e71f24b4c27195e27061560b5c875c904c0add15ed943c060f142fdd1"

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
