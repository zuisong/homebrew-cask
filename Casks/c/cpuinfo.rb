cask "cpuinfo" do
  version "1.5.1"
  sha256 "e6037c41db55d6032bfb0c5f6ed6b62d8303a58b1a13a972522253aeebef427a"

  url "https://github.com/yusukeshibata/cpuinfo/raw/#{version}/dist/cpuinfo.zip"
  name "cpuinfo"
  desc "CPU meter menu bar app"
  homepage "https://github.com/yusukeshibata/cpuinfo/"

  no_autobump! because: :requires_manual_review

  app "cpuinfo.app"

  zap trash: [
    "~/Library/Application Scripts/io.fata.shibata.cpuinfo",
    "~/Library/Containers/io.fata.shibata.cpuinfo",
  ]
end
