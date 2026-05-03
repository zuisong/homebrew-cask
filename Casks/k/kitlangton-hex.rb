cask "kitlangton-hex" do
  version "0.7.4"
  sha256 "0af9e1214de6b0bee7957fdea9cf2a8ffc713e274611581f422637754c8c3990"

  url "https://github.com/kitlangton/Hex/releases/download/v#{version}/Hex-#{version}.dmg",
      verified: "github.com/kitlangton/Hex/"
  name "Hex"
  desc "Voice-to-text transcription and paste tool"
  homepage "https://hex.kitlangton.com/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Hex.app"

  zap trash: [
    "~/Library/Application Scripts/com.kitlangton.Hex",
    "~/Library/Containers/com.kitlangton.Hex",
  ]
end
