cask "copilot-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.0.42"
  sha256 arm:          "a5fb50ae4278b032e60ff76018af4bcdd1723ce0a65e2172466ad3958a8281a3",
         intel:        "f8e32e986089db0cd2970ef99c0767d5795aee84716dcddf3b732d974ba08e6b",
         arm64_linux:  "f86a8b3c08655649478a90b608f12ffe2cbfb3cc7a91581bbc806d6af05ec49b",
         x86_64_linux: "cc8bee80f8cea693ff5b9d2c0dfd85928907c8ac4b79e2eac3e48aacd26721db"

  url "https://github.com/github/copilot-cli/releases/download/v#{version}/copilot-#{os}-#{arch}.tar.gz"
  name "GitHub Copilot CLI"
  desc "Brings the power of Copilot coding agent directly to your terminal"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "copilot-cli@prerelease"
  depends_on macos: ">= :ventura"

  binary "copilot"

  zap trash: "~/.copilot"
end
