cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.118.1"
  sha256 arm:   "44b2764ee0b799099c43b651e089e36388ee33e6809abaed73c769e95103ccbe",
         intel: "e949fd1ef259239ba809ea9a4d5c326c2614e92e9db1d3839ef475134789c2f2"

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
