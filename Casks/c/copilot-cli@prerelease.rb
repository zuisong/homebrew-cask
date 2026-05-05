cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.0.41-1"
  sha256 arm:          "72e90a536a248ef21dcd3e8c32a72b66394e8390ae52edff5ebebed8968bca76",
         intel:        "489389a23256f2dc4451be8e20962dd3474a4aac8b7390f98d8d065476d8fd53",
         arm64_linux:  "b84776a29dcdb0b63c192a391991e36de991b74468bb75c47fc5d60fab7180c3",
         x86_64_linux: "9293ff1eac92afad0f79f7240a7b41646d8e4d871f7113ac8e1cecb6e847f470"

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
