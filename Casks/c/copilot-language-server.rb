cask "copilot-language-server" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.478.0"
  sha256 arm:          "f78026f4f059684cebebf987f923c2d3a8fd43400f1a5cb9885b27a2bba112b6",
         intel:        "bb437d52210a0537fe3292dfceea59d974174b25e540288340eeab35319c4f24",
         arm64_linux:  "7bfdce8d5a1fe445b4ef4dffb07d22fb1556042f4e992f8d1e8444ecaf008b98",
         x86_64_linux: "7ffd607b2a10c8e269af128227672bd36e09aa271b61ea3453712131a1da3fa9"

  url "https://github.com/github/copilot-language-server-release/releases/download/#{version}/copilot-language-server-#{os}-#{arch}-#{version}.zip"
  name "GitHub Copilot Language Server"
  desc "Language Server Protocol server for GitHub Copilot"
  homepage "https://github.com/github/copilot-language-server-release"

  depends_on macos: ">= :big_sur"

  binary "copilot-language-server"

  zap trash: "~/.cache/pkg/*/rg",
      rmdir: "~/.cache/pkg"
end
