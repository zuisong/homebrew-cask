cask "conductor" do
  arch arm: "aarch64", intel: "x86_64"

  on_arm do
    version "0.51.1,01KQXTJPFXYYFC99RV1S6WEYQT"
    sha256 "eb5e5e7710fdfbb974be01d5ecc6c1029c554e6994b70b797524a237bfe71648"
  end
  on_intel do
    version "0.51.1,01KQXTJYYBTEXNDDNZZTY7PPT9"
    sha256 "9bb8b087f5467bf21f63d5062222324537fd34f6a21ddf09de19b28208934add"
  end

  url "https://cdn.crabnebula.app/asset/#{version.csv.second}",
      verified: "cdn.crabnebula.app/asset/"
  name "Conductor"
  desc "Claude code parallelisation"
  homepage "https://conductor.build/"

  livecheck do
    url "https://cdn.crabnebula.app/update/melty/conductor/darwin-#{arch}/latest"
    regex(%r{/asset/([^?/]+)}i)
    strategy :json do |json, regex|
      asset_id = json["url"]&.[](regex, 1)
      version = json["version"]
      next if asset_id.blank? || version.blank?

      "#{version},#{asset_id}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Conductor.app"

  zap trash: [
    "~/Library/Application Support/com.conductor.app",
    "~/Library/Caches/com.conductor.app",
    "~/Library/WebKit/com.conductor.app",
  ]
end
