cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.113.0"
  sha256 arm:   "14132b4540547ba008b3a6f3bc1b85d72983e3811d6a1ba3487fea5cd8fa0326",
         intel: "8a5a3dec38dd8ec6310acf73bd95649dc4b1a7a6b015fe731451a24ccb7f165b"

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
