cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.0.40-2"
  sha256 arm:          "8a1e1e394b7070b7a3221ba29b7e94c60b20d4f6bff8801fc17e03605d99ca17",
         intel:        "b98f3196051053f765919c8ba75e07d04e6364a85cf7c2184ff16023d1e40874",
         arm64_linux:  "88fcf7527608f1454463ad4bea5c209df25fde4078b8b32167f8ce07acacde4d",
         x86_64_linux: "9e496f6671147fbce50e924d85ee67d648c284a913478d4f7c765169edbddb29"

  url "https://github.com/github/copilot-cli/releases/download/v#{version}/copilot-#{os}-#{arch}.tar.gz"
  name "GitHub Copilot CLI"
  desc "Brings the power of Copilot coding agent directly to your terminal"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  auto_updates true
  conflicts_with cask: "copilot-cli"
  depends_on macos: ">= :ventura"

  binary "copilot"

  zap trash: "~/.copilot"
end
