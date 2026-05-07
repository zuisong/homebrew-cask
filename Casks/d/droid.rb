cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.120.1"
  sha256 arm:   "9cdc161b8e8580bb6d1103aae3f38c93e616f2dc461641f92b6bd6943c33dc97",
         intel: "f748b413c02e17bb4e96b2058ba5d86c407b30b67984b293069283c25fff3eca"

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
