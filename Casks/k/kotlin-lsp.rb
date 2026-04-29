cask "kotlin-lsp" do
  arch arm: "-aarch64"

  version "262.4739.0"
  sha256 arm:          "1b745743ce22ad92681a1bc3b1046803e942a6e1f36e04fb85ae9a40334a2f1e",
         intel:        "6f06efe7a10f94b9c8a028c4efeb6c7e1769f47a01edfb74450acf30ab5665e4",
         arm64_linux:  "625870ae091c6d0dee25514d545c708a6ea50d7cbb5154aaf1aa9123ccff338b",
         x86_64_linux: "46971110c9b8a3360ce3fdf5437467f4c447dad37ad73dbf81d64af6779e4105"

  on_macos do
    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}#{arch}.sit",
        verified: "download-cdn.jetbrains.com/kotlin-lsp/"
  end
  on_linux do
    url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}#{arch}.tar.gz",
        verified: "download-cdn.jetbrains.com/kotlin-lsp/"
  end

  name "Kotlin LSP"
  desc "Official Kotlin Language Server"
  homepage "https://github.com/Kotlin/kotlin-lsp"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  binary "kotlin-server-#{version}/kotlin-lsp.sh", target: "kotlin-lsp"

  # No zap stanza required
end
